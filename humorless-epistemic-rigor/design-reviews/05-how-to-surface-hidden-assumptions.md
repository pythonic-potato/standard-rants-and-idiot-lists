# How To Surface Hidden Assumptions

## Overview

Most design mistakes are not caused by bad reasoning.

They are caused by reasoning from assumptions that were never identified, documented, or challenged.

Hidden assumptions are difficult to spot because they often feel like facts to the people making them.

The goal of these techniques is to make assumptions visible so they can be discussed, validated, or challenged — not to eliminate them.

## Inversion

For each major design choice, ask: *"What would cause me to change my mind?"* or *"I would choose a different design if I learned that ______."*

The answer often reveals an assumption.

Example: *"I would not choose RabbitMQ if message ordering wasn't important."*

Hidden assumption: *Downstream consumers require FIFO ordering.*

## Pre-Mortem

Imagine it is six months after deployment and the design has failed.

Ask: *"What happened?"*

The explanations people generate often reveal hidden assumptions about:

- Reliability
- Performance
- User behavior
- Operational processes
- Future growth

Example: *"The system failed because payload sizes grew beyond what we planned for."*

Hidden assumption: *Payload sizes will remain within current limits.*

## Compare Alternatives

Compare two reasonable solutions and ask: *"What must be true for Design A to be preferable to Design B?"*

The differences between viable alternatives are often assumptions rather than facts.

Example: *"We chose RabbitMQ instead of CPP because ordering matters."*

Hidden assumption: *Consumers require ordered delivery.*

## Pair Authoring

Ask another engineer to read the design and independently write down the assumptions they believe the design is making.

Compare their list to your own.

Any surprises are worth investigating.

This technique is particularly effective because authors are often blind to assumptions that have become part of their mental model.

## Ask "How Do We Know That?"

For every major claim, ask: *"How do we know this is true?"*

Possible answers include:

- Measurement
- Documentation
- Stakeholder input
- Prior incidents
- Personal belief

If the answer is unclear, the claim may actually be an assumption.

This technique works particularly well when reviewing requirements, forecasts, and operational expectations.

## Find the Missing Requirement

When someone says *"This design obviously won't work,"* ask: *"Which requirement does it violate?"*

The answer often uncovers an unstated requirement that has been influencing the discussion.

Many apparent design disagreements are actually disagreements about hidden requirements.

## Look for Absolute Language

Pay attention to statements like:

- "Always"
- "Never"
- "Everyone knows"
- "Obviously"
- "Of course"

These phrases often indicate assumptions that have not yet been examined.

When you encounter one, ask: *"What evidence supports that claim?"*

## Examine Judgmental Language

Pay attention to words that express a judgment rather than an observable fact.

Examples include:

- Better
- Worse
- Simpler
- More complex
- Elegant
- Ugly
- Risky
- Safe
- Scalable
- Over-engineered
- Robust
- Obvious

When you encounter one, ask: *"What specifically makes it better?"* or *"According to which requirement or goal?"*

Example: *"This solution is too complex."*

Possible hidden assumptions:

- The team lacks experience with the technology.
- Operational overhead is a priority.
- Development speed is more important than flexibility.
- The expected scale does not justify the added complexity.

Example: *"Kafka would be a better choice."*

Possible hidden assumptions:

- Reusing existing operational expertise is valuable.
- Long-term scalability is important.
- Message durability is a key requirement.

Judgmental language is often a useful signal that someone has identified a real concern but has not yet fully articulated the reasoning behind it.

Try to replace judgments with the assumptions, requirements, risks, or tradeoffs that produced them.

---

No single technique will find every hidden assumption.

Use whichever technique feels most natural for the problem at hand. The technique itself matters less than the result: assumptions made visible before they become production incidents.
