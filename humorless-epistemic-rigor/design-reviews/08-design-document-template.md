# Design Document Template

| Status | Author | Created | Last Updated | Selected Solution |
| --- | --- | --- | --- | --- |
| DRAFT |  |  |  | TBD |

## TL;DR

*Two to four sentences. What are we building, why, and what's the headline of the proposed approach? A reader should be able to stop here and know whether they need to read the rest.*

…

## Context and Problem

### Current State

*Describe the current system, process, or situation. Include only the background necessary for a reasonably informed engineer to understand the problem. Link to additional context rather than duplicating it.*

…

**Current-State System Context Diagram**

*Insert diagram here. For worked diagram examples (Mermaid), see the [Example Design Document](09-example-design-document.md).*

### Problem Statement

*What is broken, missing, expensive, risky, or otherwise motivating this proposal?*

…

### Goals

*Describe what success looks like. What are we trying to accomplish?*

1. …
2. …
3. …

### Non-Goals

*Things explicitly out of scope. What are we intentionally* not *trying to accomplish?*

1. …
2. …
3. …

### Requirements

*Define the constraints that any acceptable solution must satisfy. What needs to be true of any acceptable solution?*

| ID | Requirement |
| --- | --- |
| Req-1 |  |
| Req-2 |  |
| Req-3 |  |

## Candidate Solutions

*Analyze all candidate solutions using* **the same set** *of analyses and diagrams (see the [Analysis Menu](06-analysis-menu.md)). Include the current approach ("status quo") as a candidate solution. (See the [Example Design Document](09-example-design-document.md).)*

### Candidate Solution: Status Quo

**High-Level Summary** — *A paragraph or two summarizing the approach.*

**System Context Diagram** — *Insert diagram here.*

**Relevant Analyses** — *Insert analyses selected from the Analysis Menu.*

### Candidate Solution #1: [Name]

**High-Level Summary** — *A paragraph or two summarizing the approach.*

**System Context Diagram** — *Insert diagram here.*

**Relevant Analyses** — *Insert analyses selected from the Analysis Menu.*

### Candidate Solution #2: [Name]

**High-Level Summary** — *A paragraph or two summarizing the approach.*

**System Context Diagram** — *Insert diagram here.*

**Relevant Analyses** — *Insert analyses selected from the Analysis Menu.*

## Evaluation Matrix

*The Evaluation Matrix captures how well each candidate solution satisfies the documented requirements.*

*Using the evidence gathered through analyses, each reviewer independently votes: Yes (1), Unknown (0), or No (-1) for every requirement / solution pair.*

| Requirement | Assess With | Current System | Solution #1 | Solution #2 |
| --- | --- | --- | --- | --- |
| Req-1 |  |  |  |  |
| Req-2 |  |  |  |  |
| Req-3 |  |  |  |  |
| **Score** |  |  |  |  |

## Final Recommendation

*The Final Recommendation identifies the selected solution, summarizes why it was chosen, and highlights any significant tradeoffs or remaining risks.*

### Selected Solution

**TBD**

**Key Reasons**

- …
- …
- …

**Accepted Tradeoffs**

- …
- …
- …

## Design Review Log

### Concerns

*Reviewer concerns are observations that may indicate a missing assumption, unresolved question, hidden dependency, unstated requirement, or design risk.*

**Valid Statuses:** OPEN, IN PROGRESS, RESOLVED, DISMISSED, DEFERRED

| ID | Status | Concern | Raised By | Assigned To | Addressed By |
| --- | --- | --- | --- | --- | --- |
| C-1 | OPEN |  |  |  |  |

### Open Questions

*Questions whose answers could materially change the design, requirements assessment, implementation plan, or risk profile.*

**Valid Statuses:** OPEN, IN PROGRESS, RESOLVED, DISMISSED

| ID | Status | Question | Owner | Outcome |
| --- | --- | --- | --- | --- |
| Q-1 | OPEN |  |  |  |

### Assumptions

*Assumptions are statements we currently believe to be true and are using as inputs to the design. Each assumption should include supporting evidence (see "What IS supporting evidence for an assumption?" in the [Example Design Document](09-example-design-document.md)). Confidence reflects the strength of the supporting evidence, not the importance of the assumption.*

| ID | Assumption | Confidence | Evidence |
| --- | --- | --- | --- |
| A-1 |  | LOW / MEDIUM / HIGH |  |

### Risks

*Risks are potential negative outcomes that may occur even if the design is implemented correctly and all assumptions prove true.*

**RISK-1: [Name]**

**Impact:** LOW / MEDIUM / HIGH · **Likelihood:** LOW / MEDIUM / HIGH

*Description*

…

*Mitigation*

- …
- …
- …

*Residual Risk*

…

## Decisions

*A running log of decisions made during the design and review of this document.*

*This is the home for "why we chose X over Y" content that would otherwise become trapped in meetings, comment threads, or chat discussions.*

### Decision 1

…

*Reasoning & Supporting Evidence*

…

### Decision 2

…

*Reasoning & Supporting Evidence*

…
