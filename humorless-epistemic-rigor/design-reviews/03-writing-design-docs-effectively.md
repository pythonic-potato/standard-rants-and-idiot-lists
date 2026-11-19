# Writing Design Docs Effectively

## Overview

A design document exists to enable informed decision-making; describing a solution is only the vehicle.

A good design document helps reviewers understand the problem, evaluate alternatives, identify risks, challenge assumptions, and understand why a decision was made.

To accomplish this, every design document should be **easy to understand**, **easy to review**, and **updated in response to feedback**. Authors are expected to engage with criticism, resolve concerns, and ensure the document—not a comment thread or meeting—is the authoritative record of the discussion.

## 1. Make the Design Understandable

Reviewers cannot critique what they cannot understand.

Your first responsibility as an author is to make the document easy to read, navigate, and reason about.

### 1a. Lead With Context

Write for the reviewer with the least context, not the most.

Explain:

- What problem exists today.
- Why the current state is insufficient.
- What success looks like.
- What is explicitly out of scope.

Define important terms before using them.

A reviewer should understand the problem before being asked to evaluate a solution.

### 1b. Make the Document *Readable* Before You Make It "*Right*"

A technically correct document that nobody can follow is not useful.

Prefer:

- Clear structure.
- Descriptive headings.
- Short sections.
- Progressive disclosure.
- Linked references instead of long historical digressions.

If a reviewer asks *"What does this mean?"* or *"Why does this matter?"*, treat that as evidence that the document should be improved.

Update the document itself rather than repeatedly explaining the same concept in comment threads.

### 1c. Use Diagrams Deliberately

Diagrams are often more effective than prose.

If you cannot draw a concept clearly, you may not yet understand it clearly.

Every diagram should answer a single question.

Examples:

- System context
- Request flow
- Failure handling
- Deployment topology
- Data ownership

If a diagram is doing multiple jobs, split it into multiple diagrams.

### 1d. Maintain Consistent Levels of Abstraction in Diagrams

Pair "before" and "after" views at the same level of abstraction.

For example:

- System-context diagram vs system-context diagram
- Sequence diagram vs sequence diagram
- Deployment diagram vs deployment diagram

Mismatched abstraction levels make alternatives difficult to compare and frequently mislead reviewers.

## 2. Make the Design Reviewable

A review can only be as good as the information available to reviewers.

Your job is to expose the assumptions, requirements, alternatives, and tradeoffs that produced your solution — not merely to document it.

### 2a. Surface Requirements Explicitly

Requirements are not things the design should do.

Requirements are the criteria used to evaluate potential solutions.

Your goal is to discover the requirements you do not know yet, not to collect the ones you already do.

Ask stakeholders: *"What would make this design unacceptable to you?"*

Examples:

- Product
- SRE
- Security
- Compliance
- Downstream consumers
- Other engineering teams

Make requirements:

- Specific
- Testable
- Sourced

Good: *"p99 latency must remain below 50ms at 1,000 QPS. Source: SRE review on May 12."*

Less helpful: *"Must be fast."*

Late-stage objections are often requirements that should have been captured earlier.

### 2b. Surface Assumptions Explicitly

Every design depends on assumptions.

Most design reviews fail because those assumptions remain implicit.

Before sharing a design document, deliberately look for hidden assumptions.

Document them.

Tag each assumption with a confidence level — **LOW**, **MEDIUM**, or **HIGH** — where confidence reflects the strength of the supporting evidence, not the importance of the assumption. (For what counts as evidence at each level, see "What IS supporting evidence for an assumption?" in the [Example Design Document](09-example-design-document.md).)

Treat any material LOW-confidence assumption as either:

- An open question that needs investigation.
- A documented risk.
- An explicitly accepted uncertainty.

Do not allow undocumented beliefs to quietly become design decisions.

### 2c. Steelman Alternatives

Your job is to help the team make the best decision, not to prove your preferred solution correct.

Every serious alternative should be presented in its strongest form.

When rejecting an alternative:

- Explain why it was attractive.
- Explain what requirements it satisfied.
- Explain why it ultimately lost.

A rejected alternative should still look reasonable.

If the alternative appears obviously foolish, reviewers will assume it was not evaluated fairly.

## 3. Resolve Feedback Responsibly

Review is complete when the document accurately captures the team's understanding and decisions, not when the comments stop.

### 3a. Every Criticism Gets a Substantive Response

A substantive response does one of the following:

- Updates the design.
- Points to where the concern is already addressed.
- Provides evidence that the concern does not apply.
- Accepts the concern as a deliberate tradeoff.

A substantive response is not:

- *"That doesn't matter."*
- *"That's an edge case."*
- *"That doesn't actually happen."*

Confidence is not evidence.

Reasoning and evidence belong in the document.

### 3b. Discussions Must Round-Trip Into the Document

The design document is the source of truth.

It is not enough to address feedback in:

- Comment threads
- Chat conversations
- Meetings
- Direct messages

If a discussion changes the team's understanding of the design, the document must be updated.

Future readers should not need access to chat history to understand the design.

Common examples:

**1. Clarifying Questions**

A clarifying question is evidence that the document was unclear.

Update the document to answer the question, then notify the reviewer.

**2. Critiques and Pushback**

A critique must result in one of the following:

- A design change.
- A documented concern.
- An open question.
- A documented risk.
- An explicitly rejected concern with rationale.

Concerns should not disappear into comment threads.

**3. Suggested Alternatives**

Every serious alternative proposed during review should be reflected in Alternatives Considered.

Steelman the alternative before rejecting it.

Future readers should understand:

- Why it was attractive.
- Why it was rejected.

**4. Challenged Assumptions**

When an assumption is challenged:

- Add it if it is missing.
- Update its confidence level.
- Add supporting evidence.
- Convert it into an open question if necessary.

The document should reflect the team's current understanding.

**5. Decisions Made During Discussion**

When a decision is made during review, record it in Decisions & Rationale.

Future readers should be able to answer:

- What was decided?
- Why was it decided?
- What alternatives were considered?
- What tradeoffs were accepted?

without reading the comment thread.
