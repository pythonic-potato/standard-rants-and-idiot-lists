# Oddly Specific Formatting Rules

## Overview

These recommendations may seem oddly specific, but they exist to make design documents easier to read and review.

Design reviews often involve long documents containing requirements, diagrams, analyses, alternatives, assumptions, risks, and supporting evidence. Most readers are not interested in every section at the same level of detail.

Good document structure helps readers:

- Understand the overall shape of the document.
- Quickly find the information they care about.
- Read high-level conclusions before diving into supporting details.
- Avoid becoming overwhelmed by large amounts of information.

Whenever possible, organize documents according to the principle of *progressive disclosure*: present the most important information first, then allow readers to reveal additional detail only when they need it.

The techniques below are stated as principles, each with example implementations for Confluence (where this process grew up) and GitHub-flavored Markdown (where you may be reading it). They apply in whatever wiki or doc tool your team uses.

## Floating Table of Contents

**Principle:** readers should be able to see the document's skeleton at a glance and jump straight to the section they care about.

Implementations:

- **Confluence:** a table-of-contents macro, or a floating-TOC app.
- **GitHub-flavored Markdown:** rendered files get a built-in heading outline (the outline icon at the top of the file view) — free, as long as your headings are accurate. For very long documents, an explicit linked TOC at the top works anywhere Markdown renders.

## Collapsible Sections

Humans only understand about one paragraph of text at a time. Use the [principle of progressive disclosure](https://ixdf.org/literature/topics/progressive-disclosure) to make your analyses readable.

**Principle:** the "thesis statement" of each sub-section should always be visible, but supporting data and reasoning should be hidden unless/until the reader requests them.

Implementations:

- **Confluence:** type `/expand` while editing and hit Enter to add an expand macro; put the supporting information in the body of the macro.
- **GitHub-flavored Markdown:** use a `<details>` block with the thesis in the `<summary>`:

```html
<details>
<summary>Thesis: the cache hit rate, not the database, is the bottleneck.</summary>

Supporting data and reasoning go here, hidden until the reader opens the block.

</details>
```
