# The Process: Engineering Design Workflow

## Overview

The design process separates *understanding the problem* from *evaluating solutions*.

Teams frequently jump to discussing solutions before they agree on the problem being solved. This process intentionally avoids that failure mode by reviewing the problem definition before generating or evaluating design alternatives.

The process has six steps.

At any point, if the team discovers a fundamental disagreement about requirements, assumptions, or the problem statement itself, the process either halts or restarts from the first step.

## Step 1: Describe the problem

The author completes the following sections of the design document (see the [Design Document Template](08-design-document-template.md)), following the rules in [Writing Design Docs Effectively](03-writing-design-docs-effectively.md):

- TL;DR
- Context & Problem
- What do we need? (Goals, Non-Goals, Requirements)

Focus on:

- Describing the current state accurately.
- Identifying what is broken or insufficient.
- Surfacing assumptions and uncertainties.
- Capturing requirements from stakeholders.

When complete, the **author notifies the team** that the document is ready for review.

## Step 2: Review problem description

### Part A: Team Review

Reviewers focus only on:

- TL;DR
- Context & Problem
- What do we need?

Using the rules in [Reviewing Designs Constructively](04-reviewing-designs-constructively.md), reviewers should **evaluate**:

1. Is the current system described accurately?
2. Is the problem statement complete?
3. Are any goals missing?
4. Are any non-goals missing?
5. Are any requirements missing, incorrect, or insufficiently specific?
6. How will each requirement be evaluated?

### Part B: Author Revisions

The **author** incorporates feedback into the document (see "Discussions Must Round-Trip Into the Document" in [Writing Design Docs Effectively](03-writing-design-docs-effectively.md)).

If feedback changes the team's understanding of the problem, the document should be updated accordingly.

When revisions are complete, the **author notifies reviewers**.

### Part C: Repeat or Proceed

Continue Step 2 while review is producing new information, such as:

- Missing requirements
- Missing stakeholders
- Incorrect assumptions about the current system
- Missing context about the problem
- Clarifications to goals or non-goals

Perform up to two review/revision cycles.

Proceed to Step 3 when the team agrees that the problem statement, goals, non-goals, and requirements are sufficiently complete to evaluate solutions.

If significant disagreement remains after two rounds, the review has likely uncovered a deeper disagreement about:

- The problem being solved
- Requirements
- Constraints
- Stakeholder needs
- Foundational assumptions

When this happens, the **manager** should **determine** what additional information is **needed to resolve** the disagreement. This may require stakeholder interviews, experiments, data collection, or additional investigation.

Once the underlying disagreement is resolved, restart the process from Step 1.

## Step 3: Generate candidate solutions

The **author** schedules a one-hour solution-generation session.

At least **one business day before** the meeting:

- The **author distributes** the approved problem statement.
- **All team members** independently **generate** one to three **candidate solutions**.

During the meeting, the team:

1. Reviews proposed solutions.
2. Deduplicates and consolidates similar ideas.
3. Selects two to four candidate solutions for detailed evaluation.

Note: The current state must always be included as one candidate solution.

The team also finalizes the analyses (see the [Analysis Menu](06-analysis-menu.md)) needed to evaluate each requirement.

The output of this step is:

- A set of candidate solutions.
- A set of analyses to use to evaluate those solutions.
    - Note that these analyses are not themselves requirements. They are the methods the team will use to determine whether each solution satisfies the documented requirements.

## Step 4: Describe Candidate Solutions

The author completes the Candidate Solutions section of the design document.

Every solution should be evaluated using the same analyses, presented in the same order, and presented at the same level of abstraction.

The author should not:

- Nominate a preferred solution.
- Assess which solution is best.

During this phase the author should document open questions, assumptions, and risks.

When complete, the **author schedules** a solution-review meeting and **notifies reviewers**.

## Step 5: Review Candidate Solutions

### How Feedback Evolves

Review comments are the raw inputs. When a reviewer identifies a non-nitpick issue, it should be captured in the Design Review Log and refined through discussion.

Typical progression:

Comment → Concern → Open Question, Assumption, or Risk → Decision, Deferral, or Dismissal

### Part A: Individual Review

**Before the meeting, reviewers:**

- Read the entire document.
- Leave actionable feedback (see [Reviewing Designs Constructively](04-reviewing-designs-constructively.md)).
- Add concerns to the Design Review Log when appropriate.
- Vote in the Evaluation Matrix where sufficient information exists. Valid votes are:
    - Yes
    - No
    - Unknown (additional information is required before deciding)

When possible, reviewers should identify the assumption (see [How To Surface Hidden Assumptions](05-how-to-surface-hidden-assumptions.md)), question, analysis, or risk preventing a decision.

**Before the meeting, the author:**

- Updates the document with substantive responses to feedback.
- Updates the Design Review Log with any new assumptions, questions, risks, or decisions.

### Part B: Group Review

The **manager facilitates** the review meeting.

The goal of this meeting is to **identify what information is still needed**; selecting a solution comes later.

The **team reviews**:

- Unresolved reviewer feedback/comments (turning them into concerns and assigning follow-up actions, deferring/dismissing)
- In-progress work on open questions, assumptions, and risks
- Initial evaluation criteria voting results

The team may:

- Create new open questions, assumptions, or risks.
- Request additional analyses.
- Assign follow-up investigations (either to the author, or to other team members)

The **manager records and shares** required follow-up actions with the team.

### Part C: Follow-Up Revisions

**Author** and **reviewers** complete assigned **follow-up actions**.

All outcomes should be reflected in:

- Concerns
- Open Questions
- Assumptions
- Risks
- Decisions

Important conclusions should never exist only in comments, meetings, or chat conversations.

### Part D: Repeat or Proceed

Continue Steps 5A–C while review is producing new information, such as:

- New requirements
- New assumptions
- New risks
- New evidence
- New analyses

A review has likely stalled when the same concerns persist across multiple review cycles without new evidence, analysis, or proposed changes.

When this happens, the **manager should determine** whether the team needs:

- More information (experiments, prototypes, stakeholder input, etc.)
- Better articulation of the underlying concern, assumption, or requirement
- A decision between competing tradeoffs

Proceed to Step 6 when major concerns have been addressed and the team has enough information to make an informed decision.

Note: the goal of review is to reduce uncertainty enough to make a well-informed decision, not to eliminate it.

## Step 6: Decide

### Part A: Final Evaluation and Selection

Each reviewer submits final votes in the Evaluation Matrix.

For each requirement:

- Yes = 1
- Unknown = 0
- No = -1

The score for each candidate solution is the weighted sum of all reviewer votes across all requirements.

The candidate solution with the highest total score is selected.

If the team believes the result is not actionable due to unresolved uncertainty, the process returns to Step 5.

### Part B: Record the Decision

The author updates the document with:

- The selected solution
- The completed Evaluation Matrix
- The rationale for the decision
- Accepted risks
- Deferred concerns and open questions

The decision is not complete until it has been documented.

The approved design document becomes the authoritative record of the decision.
