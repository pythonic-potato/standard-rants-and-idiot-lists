# Reviewing Designs Constructively

## Overview

Design review improves the quality of decisions by identifying incorrect assumptions, missing requirements, overlooked risks, and better alternatives — not by determining whose preferred solution wins.

Your feedback should help the author improve the document, the design, or the decision-making process.

Here are specific, concrete techniques to better **articulate your concerns/disagreements**, **provide actionable feedback**, and **resolve discussions in a timely fashion**.

## 1. Understand the Disagreement

### 1a. Find the Assumption

When you disagree with a conclusion, look for the assumption that produced it (see [How To Surface Hidden Assumptions](05-how-to-surface-hidden-assumptions.md)).

Most design disagreements are not actually disagreements about the final design. They are disagreements about requirements, assumptions, constraints, risk tolerance, or expected future conditions (to name but a few).

Surfacing assumptions helps teams make disagreements explicit and testable.

Arguing only about conclusions often produces circular discussions.

Less helpful: *"We shouldn't use Carrier Pigeons."*

More helpful: *"This proposal assumes message payloads will remain below the CPP payload limit. I don't think we have evidence supporting that assumption."*

### 1b. Separate Preferences from Problems

A design does not need to be your preferred design to be an acceptable design.

Treating preferences as blockers creates unnecessary conflict and slows decision-making.

Before posting feedback, decide which category it belongs to and label it accordingly.

- **Blocker**: The proposal appears incorrect, unsafe, incomplete, or unable to satisfy a requirement.
- **Preference**: You believe an alternative approach would be better, but the proposed approach may still be acceptable.
- **Nit**: A minor issue that does not materially affect the design.
- **Curious**: A question intended to improve understanding rather than challenge the proposal.

*"Blocker: This approach cannot satisfy requirement Req-3 because it removes FIFO ordering."*

*"Preference: I would prefer Kafka here because we already operate it elsewhere."*

*"Nit: This diagram would be easier to read if the message buses used consistent colors."*

*"Curious: Why did we choose a push model instead of polling?"*

### 1c. Prefer Evidence Over Confidence

Strong opinions are not substitutes for evidence.

When possible, support feedback using:

1. Empirical data
2. Measurements or experiments
3. Existing documentation
4. Prior incidents
5. Production experience

A weakly-held opinion backed by data is generally more useful than a strongly-held opinion backed only by intuition.

## 2. Give Actionable Feedback

### 2a. Own Your Feedback

If you believe a design has a flaw, explain the flaw yourself.

Avoid comments such as:

- "You should ask the DevOps team."
- "I don't know if this is right, but somebody should check."
- "This feels wrong."

Instead, identify the concern, assumption, requirement, or risk that prompted your reaction.

It is acceptable to be uncertain. **It is not helpful to delegate the act of reasoning to someone else.**

If you suspect a problem but cannot fully articulate it yet, record it as a concern in the Design Review Log. The review process should help refine concerns into assumptions, open questions, risks, or decisions (the lifecycle described in "How Feedback Evolves" in [The Process](02-the-process.md)).

Good: *"I'm concerned this design assumes consumers tolerate duplicate messages. Do we have evidence that they do?"*

Less helpful: *"I think DevOps should weigh in on this."*

### 2b. State Your Acceptance Criteria

Be specific about what would change your mind.

"This feels off" and "I'm not sure about this" are observations, not actionable feedback.

The author should be able to do something concrete with every comment you leave.

A useful question to ask yourself before posting a comment: what evidence would cause me to accept this design?

If you cannot answer that question, your concern may not yet be fully formed.

Good: *"I'd accept this if we measured throughput under expected peak load."*

Good: *"This appears to violate invariant Y unless we add mechanism Z."*

Also good: *"If we can demonstrate that no consumers require ordering guarantees, I no longer have concerns about removing FIFO delivery."*

Less helpful: *"I'm not convinced."*

### 2c. Challenge the Design, Not the Author

Critique ideas directly and professionally.

Focus discussion on evidence, reasoning, assumptions, and requirements.

Good: *"This requirement appears inconsistent with requirement Req-4."*

Also good: *"I believe assumption A-2 is unsupported."*

Less helpful: *"This design wasn't thought through."*

Quite unhelpful: *"You clearly didn't consider failure modes."*

## 3. Be Responsive

### 3a. Close the Loop

Reviewing a design is not complete when you leave a comment.

If an author asks follow-up questions, provides evidence, or updates the proposal, review those updates promptly.

Explicitly indicate whether:

- Your concern remains open
- Additional information is required
- The concern has been resolved
- You disagree but accept the documented tradeoff

Do not leave important review threads unresolved for days without follow-up.

Future readers should be able to determine the outcome of a discussion without reconstructing it from chat messages and comment history.

### 3b. Acknowledge When a Concern Is Resolved

When an author addresses your feedback, explicitly say so. Silence forces authors and future readers to guess whether a concern remains open.

Design reviews move forward when concerns are either:

- Resolved
- Dismissed
- Deferred

If a concern has been adequately addressed, say so directly.

Good: *"The load test results address my concern."*

Good: *"I still prefer a different approach, but I agree the proposal satisfies the requirements."*

Good: *"My concern has been resolved by Decision D-4."*

Less helpful: *(No response after the author updates the document.)*
