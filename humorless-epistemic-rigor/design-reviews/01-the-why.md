# The Why: Design Review Rationale

## Rationale

We design as a team, and we design before we build.

This process exists to help us make better technical decisions, surface hidden assumptions, and create a durable record of why those decisions were made.

The workflow, templates, review guidelines, analysis menus, and example documents in this guide are not goals unto themselves. They exist to make design discussions easier, faster, and more productive by giving the team a common vocabulary and a shared process for evaluating ideas.

## Design as a Team

The whole team lives with a design choice: maintaining it, integrating with it, supporting it during incidents, and reasoning about it over time.

We're on-call for all of our team's services, regardless of who originally built them.

That shared responsibility gives everyone the right—and the responsibility—to write and critique design proposals.

To execute quickly and safely, we need a shared understanding of how our systems work.

Therefore, a design must be understandable by everyone responsible for implementing and maintaining it.

**The purpose of design review is not to obtain permission.**

**The purpose of design review is to build shared understanding and improve the quality of decisions.**

## Design Before Building

Writing a design down forces assumptions, requirements, alternatives, and tradeoffs into the open.

The earlier we discover a missing requirement, incorrect assumption, or unacceptable tradeoff, the cheaper it is to address.

Many design mistakes are easy to fix in a document and expensive to fix in production.

Design reviews help us identify those mistakes before implementation begins.

## Prototypes are Evidence, Not Decisions

Experiments and prototypes help us gather evidence.

Design reviews help us make decisions.

PoCs are often the fastest way to answer important technical questions, such as:

- Is this approach technically feasible?
- What performance characteristics can we expect?
- How operationally complex is this solution?
- What failure modes emerge in practice?

A successful prototype demonstrates that a particular approach *can* work. It does not necessarily demonstrate that it is the *best* approach, nor does it evaluate alternatives that were never built.

Likewise, a failed prototype demonstrates that a particular implementation failed. It does not necessarily demonstrate that the underlying idea is impossible.

Design reviews use evidence from experiments alongside requirements, risks, assumptions, alternatives, and tradeoffs to determine which solution is most appropriate.

## When to Use This Process

Not every change requires a formal design review.

This process is most valuable when a change:

- Has multiple viable solutions.
- Introduces significant complexity.
- Creates new operational responsibilities.
- Requires coordination across teams.
- Has meaningful cost, reliability, or security implications.
- Is difficult or expensive to reverse.

Examples include:

- New services
- Major architectural changes
- Significant migrations
- New infrastructure dependencies
- Cross-team integrations
- Changes that affect multiple teams or systems

This process is usually unnecessary for:

- Small bug fixes
- Routine maintenance
- Minor refactors
- Localized implementation changes
- Changes with an obvious and low-risk solution

Design review exists to spend effort where the cost of a poor decision is high enough to justify it — a targeting rule, not a brake on delivery.
