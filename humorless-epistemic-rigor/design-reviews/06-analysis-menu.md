# Analysis Menu

## Overview

The analyses and diagrams in this menu are tools, not requirements. Their purpose is to help teams evaluate candidate solutions, surface risks, and reduce uncertainty before making a decision.

**Not every design requires every analysis.** Instead, authors should select the analyses that are most likely to answer the questions raised by the design's requirements, assumptions, risks, and tradeoffs.

Each entry includes guidance on when the analysis is likely to provide value and when it can reasonably be skipped.

## Menu Items

| # | Analysis / Diagram Type | When to include | When to skip |
| --- | --- | --- | --- |
| 1 | **System-context diagram.** *Always include.* How-to: [Figma](https://www.figma.com/resource-library/context-diagram/#key-components-of-context-diagrams), [Visual Paradigm](https://online.visual-paradigm.com/knowledge/system-context-diagram/what-is-system-context-diagram/) | Extracting a service from a monolith; adding a new downstream dep (e.g., starting to call a partner team's API); deprecating an existing dep; ingesting from a new event source; becoming a new caller of a third-party API. | Optimization or refactor entirely internal to one already-described service; algorithm change with no new external interactions; data-only change with no new integration. |
| 2 | **Component diagram.** A "zoomed-in" version of a system-context diagram, which examines the components of a single service. How-to: [C4 model](https://c4model.com/diagrams/component) | Deciding "one service vs. three"; moving a responsibility from component A to component B; multiple candidate designs differ in how they're decomposed; the design crosses a team-ownership boundary; introducing a new logical tier (e.g., adding a queue between two services that previously called each other directly). | Algorithm change inside one module; data-structure rework; intra-component refactor; well-known structure that isn't changing. |
| 3 | **Sequence diagram.** Include if the order or timing of interactions matters *or* if you need to do a Performance and Scaling Workup. How-to: [Pace University tutorial](https://csis.pace.edu/~marchese/CS389/L9/Sequence%20Diagram%20Tutorial.pdf), [Figma](https://www.figma.com/resource-library/what-is-a-sequence-diagram/) | Async eventing with retries; request/response chain across multiple services; saga or orchestration flow; multi-party protocol (e.g., 2-phase commit, OAuth flow, distributed locks); anything where a reviewer might reasonably ask "what happens if the second call arrives before the first?" | Pure data transformation; single-process synchronous algorithm; trivial CRUD with no orchestration; flow that is fully captured by a single function call. |
| 4 | **Performance and Scaling Workup.** Include if the design has non-trivial load, latency, or capacity considerations. How-to: Appendix A, below. | On a user-facing critical path with a latency target; scales with user/traffic/data growth; consumes a scarce resource (DB connections, GPU, third-party rate limits); touches a known-hot dependency; introduces a new bottleneck candidate; multiple proposed designs differ in their scaling characteristics. | Infrequently run batch process with no SLO; internal tooling used by a few engineers; negligible traffic; performance is unambiguously not the limiting factor. |
| 5 | **Migration / Rollout Plan.** Describes how to safely transition a system from its current state to the proposed design, including deployment sequencing, compatibility considerations, and rollback strategies. How-to: [Martin Fowler](https://martinfowler.com/bliki/BlueGreenDeployment.html), [Google Cloud](https://cloud.google.com/architecture/application-deployment-and-testing-strategies) | Existing production data must move; existing clients or consumers must migrate; backward compatibility matters; multiple systems must be upgraded in a specific order; deployment spans multiple releases; rollback is non-trivial; introducing a new service that replaces an existing one. | Greenfield systems with no existing users or data; isolated internal tooling; single-step deployments with obvious rollback paths; changes that can be deployed safely using existing team patterns. |
| 6 | **API / data model diff.** Include if the design adds, removes, or changes a contract another party depends on. How-to: Appendix B, below. | New HTTP endpoint, gRPC method, or message schema; changing the shape of an existing response; renaming or removing a field; schema migration; new event topic; changing event payload structure; new column on a table that another service reads; deprecation of an existing field that any caller still uses. | Internal refactor that no caller sees; private helper changes; non-contractual log fields; pure performance optimization with no observable shape change. |
| 7 | **State machine diagram.** Include if there are non-trivial entity transitions through different states, or idempotency is important. How-to: [Philadelphia University](https://www.philadelphia.edu.jo/academics/malmakadmeh/uploads/State%20Diagram.pdf), [Visual Paradigm](https://www.visual-paradigm.com/guide/uml-unified-modeling-language/what-is-state-machine-diagram/) | Job/request lifecycle (e.g., Pending → InProgress → Succeeded/Failed); workflow with retry, abandon, or human-intervention transitions; a resource with provisioning states; entity where "stuck in X state" is a plausible debugging question; state model with concurrency or out-of-order arrivals. | Stateless transformation; entity with two obvious states (active/deleted) and obvious transitions; transitions that are immediately apparent from one paragraph of prose. |
| 8 | **Deployment diagram.** Include if the deployment topology differs from the team's standard pattern, or is itself a design choice. How-to: [C4 model](https://c4model.com/diagrams/deployment), [Agile Modeling](https://agilemodeling.com/artifacts/deploymentDiagram.htm) | Novel placement (e.g., colocated with specific hardware, on the edge, in customer environments); new physical or runtime tier; differs from "deploy as a service in our standard cluster" pattern; specific colocation requirements (e.g., "must run in same availability zone as the main database"). | Standard service-in-cluster deployment matching existing team convention; component is a library or local-only utility; no novel topology. |

## Appendix A: Scaling and Performance Analysis Guide

### Throughput & Capacity Audit

*Use a sequence diagram to work through the following steps.*

**1. Calculate Component Service Demand (Dᵢ)**

Map execution steps from your sequence diagram to the physical resource demands on your component diagram.

$$D_i = V_i \times S_i$$

Where:

- **Vᵢ (Visits):** Number of times a sequence arrow hits component *i* per user request.
- **Sᵢ (Service Time):** Baseline processing cost per visit (e.g., use the well-known "latency numbers every programmer should know" for hardware baselines).

**2. Locate the Absolute Bottleneck (D_max)**

The component with the largest total service demand limits the entire architecture.

$$D_{max} = \max_i D_i$$

**3. Compute Maximum Theoretical Throughput (X_max)**

Using the Utilization Law, calculate the absolute performance ceiling:

$$X_{max} = \frac{1}{D_{max}}$$

**4. Check Resource Stress (Uᵢ)**

Verify component saturation at your target traffic arrival rate (λ):

$$U_i = \lambda \times D_i$$

- **Action Boundary:** If Uᵢ ≥ 1 (that is, utilization reaches or exceeds 100%), the design will trigger unbounded queueing and crash.

### Horizontal Scaling Restrictions (Anti-Pattern Checklist)

*Inspect sequence diagram topologies to spot structural barriers to horizontal elastic scaling.*

**1. The Single-Leader Funnel**

- **Visual Signature:** A fleet of *N* workers scaling out horizontally, but *every* path terminates at a single, un-sharded database instance or monolithic third-party API.
- **Impact:** Your horizontal scale factor is hard-capped by that single node's X_max.

**2. The O(N²) Communication Pattern (Crosstalk)**

- **Visual Signature:** Sequence paths showing worker nodes broadcasting state updates to all other worker nodes (peer-to-peer syncing).
- **Impact:** Modeled by the Universal Scalability Law. As *N* grows, the system experiences *retrograde scalability*—it slows down due to communication overhead.

**3. The Hard Sequential Chain**

- **Visual Signature:** An orchestrator waiting for a synchronous return from Worker A before drawing the next activation arrow to Worker B.
- **Impact:** Governed by Amdahl's Law. The serial fraction of the execution path prevents parallel resource utilization.

**4. Distributed Lock Contention**

- **Visual Signature:** A sequence arrow calling an external coordinator (e.g., Redis `SETNX` or a database row lock) at the start of a transaction, holding it across multiple steps.
- **Impact:** Adding horizontal nodes merely increases lock queueing time, yielding zero net throughput gains.

### Failure Mode Analysis

*Again: based on the sequence diagram's topology.*

**1. Synchronous Chain Cascade (Tight Coupling)**

- **Visual Signature:** Sequence arrows chaining deeply (A → B → C → D) without returning, keeping all component lifelines active simultaneously.
- **Impact:** End-to-end availability is the product of every link's availability, so it drops multiplicatively with chain depth (A_total = A_A × A_B × A_C × A_D). If D slows down, threads back up across all upstream components instantly.

**2. Unbounded Retry Loops**

- **Visual Signature:** An activation line looping back onto its own component labeled "Retry on Fail" without a distinct queue or circuit breaker boundary.
- **Impact:** During downstream degradation, upstream nodes multiply traffic volume, creating a self-inflicted DDoS attack.

## Appendix B: API & Data Diff Analysis Guide

### 1. Pre-Build Spec & Contract Simulation

- **Manual/Mock Spec Creation:** Write the proposed OpenAPI spec or AsyncAPI event schema *before* writing any code.
- **Local CLI Diff Run:** Run a local CLI diff (e.g., `oasdiff` for HTTP or `jsonschema-diff` for message queues) comparing your local draft spec against the current production spec file.
- **Changelog Injection:** Copy the CLI diff output text or markdown directly into the "Data/API Changes" section of your design document.

### 2. Backward Compatibility & Consumer Safety

- **No Field Removals:** Confirm no existing fields, HTTP headers, queue routing keys, or message properties are being deleted.
- **Strict Type Retention:** Verify no data types are changing (e.g., a number field changing to a string).
- **No New Required Fields:** Ensure all newly proposed fields in HTTP requests or incoming queue messages are marked optional.
- **Enum Append Safety:** Confirm no new values are added to existing enums unless you have verified that existing consumer code handles unknown/default values without crashing.
- **HTTP Error / Queue DLQ Safety:** Verify no HTTP status codes are changing, and no new unhandled exceptions will cause messages to reject and flood the Dead Letter Queue (DLQ).

### 3. Payload & Schema Structural Diff

- **Visual Side-by-Side Diff:** Paste a mock JSON payload comparison (Current vs. Proposed) into the design document for both HTTP payloads and message queue events.
- **Consumer Null-Pointer Check:** Evaluate how the proposed fields will impact existing consumers. If a consumer reads a message before upgrading, will missing new fields cause a runtime null pointer?
- **Deserialization Check:** Ensure structural changes (like converting a single object field into an array) will not cause immediate deserialization failures in existing consumer libraries.

### 4. Broker & Protocol Specific Validation

- **Topic Compatibility (e.g., Kafka):** If altering an existing topic payload, verify the proposed schema meets `BACKWARD` or `FULL` compatibility rules.
- **Routing Key Impact (e.g., RabbitMQ):** If changing payload fields that determine message routing (e.g., headers or routing keys), explicitly map out which queues will be impacted.
- **Event Versioning Trigger:** Determine if the proposed changes are significant enough to warrant a new topic or exchange entirely, rather than modifying the existing one.

### 5. Manual Consumer Compatibility Verification

- **Repo Schema Sync:** If schemas live in separate repos, pull down the latest main-branch specs from dependent repos to ensure you are diffing against actual production reality, not an outdated local copy.
- **Consumer Code Inspection:** Search the codebase of downstream consumer repos for references to fields you are altering. Locate their deserialization models to verify if they use strict parsing (which crashes on unknown fields) or lenient parsing.
- **Manual Payload Injection:** Craft a mock JSON file containing your proposed new payload format. Feed this payload into the consumer service's unit tests or local test harness to verify it passes parsing and business logic without errors.
- **Staging Shadow Test Plan:** Document a plan to publish a few sample "proposed format" messages into a staging topic or queue to observe if existing staging consumers throw unhandled parsing errors.

### 6. Cross-Team Sign-Off & Rollout Plan

- **Downstream Team Review:** If contract compatibility isn't enforced in CI/CD, share the design doc spec with the code owners of all dependent services for explicit sign-off.
- **Independent Provider Deployment:** Verify the service processing the messages or hosting the HTTP endpoint can be safely deployed *first*, without requiring immediate upstream or downstream consumer updates.
- **Rollout/Feature Flag Strategy:** Outline how the new payloads will be safely introduced (e.g., standard dark launching, additive dual-publishing to queues, or feature-flagging the code path).
