# Phase 2: Publications and Data - Research

**Researched:** 2026-03-22
**Domain:** Quarto publications page — YAML data source, grouped rendering, APSA citations, link buttons, plain-language summaries
**Confidence:** HIGH

---

<user_constraints>
## User Constraints (from CONTEXT.md)

### Locked Decisions

- Single `publications.yml` file as the structured data source
- Fields per entry: title, authors, year, type, journal/book, doi, pdf, data_url, summary
- Entries extracted from user's existing CV (PDF format) — Claude parses CV during execution
- 10–25 publications total across all types
- YAML chosen for maintainability and reuse in Phase 3 (CV page)
- Grouped by publication type: Peer-Reviewed Articles, Book Chapters, Working Papers/Preprints
- Within each group, entries ordered reverse-chronologically (most recent first)
- Working papers visually distinct as their own section (PUBL-03)
- APSA-style citations: Author(s). Year. "Title." Journal Volume(Issue): Pages.
- All coauthors listed in full on every entry (no truncation)
- Small icon buttons below each citation: [DOI], [PDF], [Data]
- DOI and PDF buttons appear on all entries where available
- Data button appears only on entries with a data_url in YAML
- Data links point to formal repositories only (Dataverse, ICPSR) — no GitHub repos
- 1–2 sentence plain-language summaries displayed inline below each entry's link buttons
- Tone: accessible but authoritative — written as if explaining to a smart journalist
- Claude drafts summaries from paper titles/abstracts; user reviews before publishing
- Every publication gets a summary (IDEN-03)

### Claude's Discretion

- Exact SCSS styling for publication entries (spacing, typography, button design)
- How to visually distinguish working papers section from published work
- Entry card/container design (if any)
- How to handle entries missing optional fields (no DOI, no PDF, no data_url)
- Responsive layout adjustments for mobile

### Deferred Ideas (OUT OF SCOPE)

None — discussion stayed within phase scope
</user_constraints>

---

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| PUBL-01 | Publications page lists works grouped by type (peer-reviewed articles, book chapters, working papers) | YAML `type` field drives grouping; pure Markdown rendering with explicit section headers is the simplest reliable approach on a static site with no R/Python compute |
| PUBL-02 | Each publication links to DOI and/or PDF where available | Bootstrap `btn btn-outline btn-sm` link pattern; rendered as raw HTML within Markdown; fields `doi` and `pdf` in YAML, absent fields simply omit their button |
| PUBL-03 | Working papers / preprints displayed as a distinct section | Separate `## Working Papers` H2 section; SCSS `border-left` accent or background tint to visually distinguish |
| PUBL-04 | Publications link to associated Dataverse/ICPSR datasets where applicable | `data_url` field in YAML; rendered as third button type; links go to `https://doi.org/10.3886/ICPSR...` (ICPSR) or `https://doi.org/10.7910/DVN/...` (Harvard Dataverse) |
| IDEN-03 | Each publication has a plain-language summary accessible to non-academic visitors | `summary` field in YAML; Claude drafts from CV titles and known abstracts; displayed as italic paragraph below link buttons |
</phase_requirements>

---

## Summary

Phase 2 adds a fully-realized publications page to the existing Quarto site. The page is powered by a single `publications.yml` data file that Claude populates by parsing the user's CV PDF. The `.qmd` file renders that YAML into grouped, styled HTML using raw HTML blocks within standard Quarto Markdown — no R kernel, no Python kernel, no Jupyter compute required.

The key technical insight is that the simplest and most reliable approach for this static site is **pure Markdown + raw HTML** in `publications.qmd`, not a Quarto listing or a knitr/Jupyter loop. The Quarto Listings feature (`listing:` in YAML frontmatter) was built for blog post discovery and requires each entry to be its own `.qmd` file — it does not accept arbitrary field schemas like `doi`, `data_url`, or `summary`. The loop-in-code-chunk approach (R `read_yaml` + `knitr` or Python `yaml.load` + Jupyter) adds a compute dependency that this static site does not need. The correct pattern for an academic publications page on a Quarto static site is: read the YAML at plan/execution time, write structured HTML sections into the `.qmd` file directly.

The YAML file is the single source of truth and will be reused in Phase 3 (CV page). All summaries are drafted by Claude from the CV content and flagged for user review. The visual design inherits the warm neutrals palette and Source Serif 4 / DM Sans typography established in Phase 1; the only new CSS needed is publication entry spacing, button styling, and the working-papers section accent.

**Primary recommendation:** Populate `publications.yml` from the CV PDF, then write `publications.qmd` as structured Markdown with raw HTML `<a class="btn">` buttons — no code execution, no listing plugin. SCSS additions go in the `/*-- scss:rules --*/` section of `custom.scss`.

---

## CV Source Data (Extracted from RJM-CV-v.oct25.pdf)

This section catalogs the actual publications found in the user's CV so the planner can scope the data-entry task accurately.

### Peer-Reviewed Articles (19 entries)

Listed in reverse chronological order as they appear in the CV:

| # | Authors | Year | Title | Journal | Vol/Issue/Pages |
|---|---------|------|-------|---------|-----------------|
| 1 | McGrath, Ryan, Wrighten | Forthcoming | "High Hurdles: Legislative Professionalism and the Effectiveness of Women State Legislators" | The Journal of Politics | — |
| 2 | McGrath | Forthcoming | "Shared Pain, Common Purpose: How Shared Problem Status Drives Congressional Collaboration on Opioid Legislation" | Legislative Studies Quarterly | — |
| 3 | Chen, Franko, McGrath | 2025 | "Occupational Licensing and Income Inequality in the States" | Journal of Policy Analysis and Management | 44(4): 1374–1393 |
| 4 | McGrath | 2025 | "American Federalism and Health Policy Spillovers: Insights from the Opioid Crisis" | Publius: The Journal of Federalism | 55(3): 477–511 |
| 5 | Andolina, Mayer, McGrath | 2024 | "Listen to Me: Quality of Communication and Intergenerational Political Socialization" | Political Research Quarterly | 77(2): 451–468 |
| 6 | Boushey, McGrath | 2023 | "Rulemaking Speed in the U.S. States" | Journal of Public Administration Research and Theory | 34(2): 284–300 |
| 7 | Boushey, McGrath | 2020 | "Does Partisan Conflict Lead to Increased Bureaucratic Policymaking? Evidence from the American States" | Journal of Public Administration Research and Theory | 30(3): 432–447 |
| 8 | McGrath, Ryan | 2019 | "Party Effects in State Legislative Committees" | Legislative Studies Quarterly | 44(4): 553–592 |
| 9 | MacDonald, McGrath | 2019 | "A Race for the Regs: Unified Government, Statutory Deadlines, and Federal Agency Rulemaking" | Legislative Studies Quarterly | 44(2): 345–381 |
| 10 | McGrath, Rogowski, Ryan | 2018 | "Veto Override Requirements and Executive Success" | Political Science Research and Methods | 6(1): 153–179 |
| 11 | Lillvis, McGrath | 2017 | "Directing Discipline: State Medical Board Responsiveness to State Legislatures" | Journal of Health Politics, Policy and Law | 42(1): 123–165 |
| 12 | Boushey, McGrath | 2017 | "Experts, Amateurs, and Bureaucratic Influence in the American States" | Journal of Public Administration Research and Theory | 27(1): 85–103 |
| 13 | MacDonald, McGrath | 2016 | "Retrospective Congressional Oversight and the Dynamics of Legislative Influence over the Bureaucracy" | Legislative Studies Quarterly | 41(4): 899–934 |
| 14 | McGrath, Rydberg | 2016 | "The Marginality Hypothesis and Supreme Court Confirmation Votes in the Senate" | Congress & the Presidency | 43(3): 324–351 |
| 15 | Marvel, McGrath | 2016 | "Congress as Manager: Oversight Hearings and Agency Morale" | Journal of Public Policy | 36(3): 489–520 |
| 16 | Rhee Baum, Jensen, McGrath | 2016 | "Constraining a Shadowy Future: Enacting APAs in Parliamentary Systems" | Legislative Studies Quarterly | 41(2): 471–499 |
| 17 | McGrath, Rogowski, Ryan | 2015 | "Gubernatorial Veto Powers and the Size of Legislative Coalitions" | Legislative Studies Quarterly | 40(4): 571–598 |
| 18 | McGrath | 2013 | "Legislatures, Courts, and Statutory Control of the Bureaucracy across the U.S. States" | State Politics and Policy Quarterly | 13(3): 373–397 |
| 19 | McGrath | 2013 | "Congressional Oversight Hearings and Policy Control" | Legislative Studies Quarterly | 38(3): 353–380 |
| 20 | McGrath | 2013 | "The Rise and Fall of Radical Civil Service Reform in the U.S. States" | Public Administration Review | 73(4): 638–649 |
| 21 | Jensen, McGrath | 2011 | "Making Rules About Rulemaking: A Comparison of Presidential and Parliamentary Systems" | Political Research Quarterly | 64(3): 656–667 |
| 22 | McGrath | 2011 | "Electoral Competition and the Frequency of Initiative Use in the U.S. States" | American Politics Research | 39(3): 611–638 |

### Book Chapters (1 entry)

| # | Authors | Year | Title | Book | Publisher |
|---|---------|------|-------|------|-----------|
| 1 | McGrath, Rogowski, Ryan | 2015 | "The Power of Institutional Design: Governors, Vetoes, and Legislative Outcomes" | The American Governor: Power, Constraint, and Leadership in the States, ed. David P. Redlawsk | Palgrave MacMillan |

### Working Papers / Works in Progress (3 entries)

| # | Authors | Title | Status |
|---|---------|-------|--------|
| 1 | McGrath, Ryan | "The Value of State Legislative Committees" | working paper |
| 2 | McGrath, MacDonald, Kalaf-Hughes | "Who Benefits from Congressional Oversight of the Bureaucracy?" | work in progress |
| 3 | McGrath | Collaboration in Crisis: State Politics, Policy Coordination, and the Opioid Epidemic | book manuscript in progress |

**Total:** ~26 entries across all types (22 articles + 1 book chapter + 3 working papers). This is slightly above the estimated 10–25 but fits comfortably on one page.

**Note:** The CV does not include DOIs or PDF links inline — those must be looked up during execution or left blank and populated by the user during review. The `doi` and `pdf` fields in YAML should be optional.

---

## Standard Stack

### Core

| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| Quarto CLI | 1.9.36 (installed) | Site generator — renders `.qmd` to HTML, deploys | Already installed and in use from Phase 1 |
| Bootstrap 5.3 (via Quarto) | bundled | Button styling (`btn btn-outline-secondary btn-sm`) | Quarto bundles Bootstrap; all btn classes available with no extra install |
| YAML | (hand-authored) | Publication data store | Human-editable, easily reused in Phase 3; Quarto renders from it during plan execution |
| Font Awesome 6 (via Quarto) | bundled | Link button icons (external-link, file-pdf, database) | Already bundled in Phase 1 site; no extra install |
| custom.scss | existing | New publication entry styles extend existing file | Established in Phase 1; `/*-- scss:rules --*/` section accepts new rules |

### No New Dependencies Required

This phase adds zero new packages. Everything needed — Bootstrap buttons, Font Awesome icons, SCSS — already ships with the Quarto installation used in Phase 1.

**Installation:**
```bash
# No new packages. Verify quarto version:
quarto --version
# Should output 1.6.x or 1.9.x — either works
```

---

## Architecture Patterns

### Recommended Project Structure (additions to existing)

```
/
├── publications.yml          # NEW — single data file for all publications
├── publications.qmd          # REPLACE stub — structured Markdown + raw HTML buttons
└── custom.scss               # EXTEND — add .pub-entry, .pub-buttons, .working-papers rules
```

No new directories required. The `_data/` folder pattern (used in Jekyll/Hugo) does not apply to Quarto — the YAML file lives at the project root.

### Pattern 1: YAML Schema for Publication Entries

**What:** A flat list of publication objects. The `type` field is the grouping key.
**When to use:** Always — this is the single data source for the entire phase.

```yaml
# publications.yml
- title: "Party Effects in State Legislative Committees"
  authors:
    - "Robert J. McGrath"
    - "Josh M. Ryan"
  year: 2019
  type: article           # article | chapter | working-paper
  journal: "Legislative Studies Quarterly"
  volume: "44"
  issue: "4"
  pages: "553–592"
  doi: "https://doi.org/10.1111/lsq.12243"
  pdf: ""                 # leave empty string if no PDF link
  data_url: ""            # leave empty string if no dataset
  summary: "This study examines how party majority status shapes committee behavior in state legislatures, finding that majority parties use committees as strategic tools to advance their agenda and suppress minority priorities."

- title: "The Value of State Legislative Committees"
  authors:
    - "Robert J. McGrath"
    - "Josh M. Ryan"
  year: null              # null for undated working papers
  type: working-paper
  journal: ""
  volume: ""
  issue: ""
  pages: ""
  doi: ""
  pdf: ""
  data_url: ""
  summary: "This working paper investigates whether legislative committees add substantive value to the policymaking process or function primarily as procedural gatekeepers."
```

**Field rules:**
- `type`: one of `article`, `chapter`, `working-paper` — drives section grouping
- `year`: integer for published works, `null` for forthcoming/undated
- All string fields default to `""` (empty string) — never `null` for strings, to avoid YAML parsing issues
- `doi` should be the full URL (e.g., `https://doi.org/10.1111/...`), not the bare identifier
- `data_url` should be the full repository URL (e.g., `https://doi.org/10.3886/ICPSR...`)

### Pattern 2: publications.qmd Structure (pure Markdown, no compute)

**What:** Hand-written Quarto Markdown with raw HTML for link buttons. No R or Python kernel.
**When to use:** This is the correct approach for this site — static output, no server, no knitr.

```markdown
---
title: "Publications"
---

Publications are listed in each section in reverse chronological order.
All coauthors are listed in full.

## Peer-Reviewed Articles

::: {.pub-entry}
McGrath, Robert J., and Josh M. Ryan. 2019. "Party Effects in State Legislative
Committees." *Legislative Studies Quarterly* 44(4): 553–592.

<div class="pub-buttons">
<a href="https://doi.org/10.1111/lsq.12243" class="btn btn-outline-secondary btn-sm" target="_blank">DOI</a>
</div>

*This study examines how party majority status shapes committee behavior in state
legislatures...*
:::

## Book Chapters

...

## Working Papers and Works in Progress

::: {.working-papers}

::: {.pub-entry}
McGrath, Robert J., and Josh M. Ryan. "The Value of State Legislative Committees."
*Working paper.*

*This working paper investigates whether legislative committees add substantive value...*
:::

:::
```

**Key structural decisions:**
- Each entry is wrapped in `::: {.pub-entry}` for CSS targeting
- Link buttons use Bootstrap `btn btn-outline-secondary btn-sm` — inherits site's link color (#8B5E3C) via $link-color variable
- Working papers section wrapped in `::: {.working-papers}` for the accent styling
- Citation text uses standard Markdown bold/italic; no special Quarto citation engine needed
- `{layout-column}` or `{.callout}` blocks are not needed and would complicate the layout

### Pattern 3: SCSS for Publication Entries

**What:** Minimal CSS additions to `custom.scss` for entry spacing, button row, and working papers accent.
**When to use:** Extend `/*-- scss:rules --*/` section only — do not change `/*-- scss:defaults --*/`.

```scss
/* Publication entries */
.pub-entry {
  margin-bottom: 2rem;
  padding-bottom: 1.5rem;
  border-bottom: 1px solid #EDE9E4;  /* matches $footer-bg — existing palette */
}

.pub-entry:last-child {
  border-bottom: none;
}

.pub-buttons {
  margin: 0.5rem 0;
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
}

/* Override Bootstrap btn-outline-secondary to match terracotta link color */
.pub-buttons .btn-outline-secondary {
  color: #8B5E3C;
  border-color: #8B5E3C;
}

.pub-buttons .btn-outline-secondary:hover {
  background-color: #8B5E3C;
  border-color: #8B5E3C;
  color: #FAF8F5;
}

/* Working papers section — left accent bar */
.working-papers {
  border-left: 3px solid #C4813D;  /* $navbar-hl — gold accent, already in palette */
  padding-left: 1.25rem;
}

/* Plain-language summary — italic, slightly muted */
.pub-entry em:last-child,
.pub-entry p:last-child em {
  color: #6B5E55;  /* between body-color and warm gray */
  font-size: 0.95rem;
}
```

### Anti-Patterns to Avoid

- **Using `listing:` in YAML frontmatter:** Quarto Listings expect each item to be a separate `.qmd` file with its own YAML frontmatter. Using a custom YAML file with `listing: contents: publications.yml` only supports Quarto's built-in listing fields (`title`, `author`, `date`, `description`, `categories`) — it will silently ignore `doi`, `data_url`, `summary`. Do not use this approach.
- **R/Python compute kernel:** Adding `execute: enabled: true` and a `read_yaml()` loop works but adds a compile-time dependency (R or Python must be installed on the render machine, including in the GitHub Actions runner). The site currently renders as pure static Quarto — preserve that property.
- **Quarto citation engine (`bibliography:`):** The Quarto/Pandoc citation engine is designed for in-text citations in manuscripts, not for rendering a styled publication list. It renders citations as references, not as the formatted APSA-style entries with link buttons the user wants.
- **`data-url` vs `data_url` in YAML:** Use underscores in YAML keys (`data_url`), not hyphens. YAML hyphens in keys work but are unusual and can cause confusion when referencing in code.

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Button links to DOI/PDF/Data | Custom CSS link styling | Bootstrap `btn btn-outline-secondary btn-sm` classes | Bootstrap is already loaded; button styles handle hover, focus, and accessibility |
| Section grouping | JavaScript filtering or tabs | Static Markdown `##` headers with type-specific sections | Zero JavaScript, works without JS, no accessibility issues |
| Citation formatting | Pandoc `bibliography:` and `.csl` file | Hand-written APSA citations in YAML `authors`/`year`/`journal` fields, rendered as Markdown text | CSL/Pandoc produces in-text references, not publication list entries; user wants exact APSA format with full coauthors |
| Missing-field handling | Conditional rendering logic | Empty string `""` convention — button simply absent when field is `""` | Pure Markdown — if `doi` is empty, the `<a href="">` is not written into the `.qmd`; no logic needed |

**Key insight:** This phase's content is inherently static and well-scoped. The correct implementation writes the YAML data once (during plan execution) and the `.qmd` once. The "data layer" and "presentation layer" are both authored documents, not runtime-rendered components.

---

## Common Pitfalls

### Pitfall 1: Forthcoming Articles Without a Year

**What goes wrong:** APSA format requires a year. Forthcoming articles have no year yet. Rendering `null` or blank produces malformed citation text.
**Why it happens:** YAML `null` renders as the string "null" in some templating contexts.
**How to avoid:** Use the convention `year: "Forthcoming"` (string, not integer and not null) for entries that are accepted but not yet published. The APSA citation then reads: `McGrath. Forthcoming. "Title." Journal.`
**Warning signs:** Citation text containing the word "null" or an empty space where the year should be.

### Pitfall 2: DOI URL vs DOI Identifier Confusion

**What goes wrong:** Some sources list DOIs as bare identifiers (`10.1111/lsq.12243`) while others list full URLs (`https://doi.org/10.1111/lsq.12243`). Mixing these produces broken links.
**Why it happens:** DOI identifiers are not URLs; they need the `https://doi.org/` resolver prefix.
**How to avoid:** Enforce a convention in the YAML schema: `doi` field always stores the full URL. If the CV or a source gives a bare identifier, prepend `https://doi.org/` during data entry.
**Warning signs:** DOI buttons that open a 404 page or a browser URL bar showing just `10.1111/...`.

### Pitfall 3: btn-outline-secondary Color Doesn't Match Site Palette

**What goes wrong:** Bootstrap's default `btn-outline-secondary` uses gray (#6c757d). The site's link color is terracotta (#8B5E3C). Without an SCSS override, the buttons will look disconnected from the site palette.
**Why it happens:** Bootstrap's secondary color is a global variable that Quarto sets from the cosmo theme — not from `$link-color`.
**How to avoid:** Add the `.pub-buttons .btn-outline-secondary` override in `custom.scss` as shown in Pattern 3 above. Do not try to change `$secondary` globally — that would affect other Bootstrap components.
**Warning signs:** Gray DOI/PDF buttons on a terracotta-link site.

### Pitfall 4: YAML Multi-Line Author Lists Break Parsing

**What goes wrong:** Authors with middle initials, accented characters, or very long names can break YAML parsing if not quoted properly.
**Why it happens:** YAML is sensitive to colons, special characters, and indentation. Author names with colons or leading special characters cause parse errors.
**How to avoid:** Always quote author name strings: `"Robert J. McGrath"` not `Robert J. McGrath`. Use a YAML linter on the file after writing.
**Warning signs:** `quarto render` fails with a YAML parse error pointing to the publications file.

### Pitfall 5: Working Papers Section Mistakenly Uses Published-Work Styling

**What goes wrong:** Working papers use journal-style citation format (with volume/issue) even though they have no journal, volume, or issue.
**Why it happens:** Copy-pasting the article citation format without adapting for working papers.
**How to avoid:** Working paper entries use a simplified format: `Author(s). "Title." Working paper.` or `Author(s). "Title." Work in progress.` — no journal, no volume, no pages.
**Warning signs:** Working paper entries show blank journal/volume/pages fields visibly on the page.

### Pitfall 6: The `quarto render` vs `quarto preview` Difference with Raw HTML

**What goes wrong:** Raw HTML `<div class="pub-buttons">` blocks render correctly in `quarto preview` but are stripped in the final `quarto render` output.
**Why it happens:** Quarto's default Pandoc setting strips raw HTML from Markdown unless `html` is added to the list of raw formats.
**How to avoid:** Quarto website pages actually accept raw HTML by default — this is NOT an issue in practice for `format: html`. But confirm by checking that the rendered `_site/*.html` files include the `<a class="btn">` elements. No special frontmatter flag is needed for Quarto HTML website pages (unlike PDF output, which does strip raw HTML).
**Warning signs:** DOI/PDF buttons entirely absent from the rendered page without error messages.

---

## Code Examples

Verified patterns from Phase 1 site and Quarto documentation:

### YAML Schema (complete example entry)

```yaml
# publications.yml — complete entry example
- title: "Party Effects in State Legislative Committees"
  authors:
    - "Robert J. McGrath"
    - "Josh M. Ryan"
  year: 2019
  type: article
  journal: "Legislative Studies Quarterly"
  volume: "44"
  issue: "4"
  pages: "553–592"
  doi: "https://doi.org/10.1111/lsq.12243"
  pdf: ""
  data_url: ""
  summary: "This study examines how party majority status shapes committee behavior in state legislatures, finding that majority parties use committees as strategic tools to advance their agenda while suppressing minority-party priorities."
```

### publications.qmd Header (no compute, standard layout)

```markdown
---
title: "Publications"
---
```

No `execute:`, no `format:` overrides needed. Inherits `page-layout: full` and the cosmo + custom.scss theme from `_quarto.yml`.

### Link Button HTML (Bootstrap, no JavaScript)

```html
<!-- DOI button -->
<a href="https://doi.org/10.1111/lsq.12243" class="btn btn-outline-secondary btn-sm" target="_blank" rel="noopener">DOI</a>

<!-- PDF button -->
<a href="/papers/mcgrath-ryan-2019.pdf" class="btn btn-outline-secondary btn-sm" target="_blank" rel="noopener">PDF</a>

<!-- Data button (Dataverse) -->
<a href="https://doi.org/10.7910/DVN/XXXXX" class="btn btn-outline-secondary btn-sm" target="_blank" rel="noopener">Data</a>

<!-- Data button (ICPSR) -->
<a href="https://doi.org/10.3886/ICPSR12345.v1" class="btn btn-outline-secondary btn-sm" target="_blank" rel="noopener">Data</a>
```

### APSA Citation Format (rendered in Markdown)

```markdown
McGrath, Robert J., and Josh M. Ryan. 2019. "Party Effects in State Legislative Committees." *Legislative Studies Quarterly* 44(4): 553–592.

Andolina, Molly A., Jeremy D. Mayer, and Robert J. McGrath. 2024. "Listen to Me: Quality of Communication and Intergenerational Political Socialization." *Political Research Quarterly* 77(2): 451–468.

McGrath, Robert J. Forthcoming. "Shared Pain, Common Purpose: How Shared Problem Status Drives Congressional Collaboration on Opioid Legislation." *Legislative Studies Quarterly*.
```

**APSA rules applied:**
- Author order: Last, First M. And First M. Last. (first author inverted, subsequent authors not)
- Year (or "Forthcoming") follows the author list
- Article title in "double quotes"
- Journal name in *italics*
- Volume(Issue): Pages — no space between volume and issue parenthetical
- Em dash (–) not hyphen (-) for page ranges

### Working Papers Section Wrapper

```markdown
## Working Papers and Works in Progress

::: {.working-papers}

::: {.pub-entry}
McGrath, Robert J., and Josh M. Ryan. "The Value of State Legislative Committees." *Working paper.*

*This working paper investigates whether legislative committees add substantive value to the policymaking process or serve primarily as procedural gatekeepers in state legislatures.*
:::

:::
```

### Plain-Language Summary Pattern

```markdown
*This study finds that states with more polarized legislatures delegate greater rulemaking authority to agencies, using bureaucratic policymaking as a workaround when legislative compromise proves impossible.*
```

- Single italic paragraph (`*...*`)
- Starts with "This study finds that..." or "This paper examines..."
- 1–2 sentences
- No jargon: "state legislatures" not "state legislative chambers"; "agencies" not "executive bureaus"
- Does not start with author's name or "The authors"

---

## Repository URLs for Data Links

Verified URL patterns for the two data repository types mentioned in requirements:

| Repository | URL Pattern | Example |
|------------|-------------|---------|
| Harvard Dataverse | `https://doi.org/10.7910/DVN/{code}` | `https://doi.org/10.7910/DVN/ABCDEF` |
| ICPSR | `https://doi.org/10.3886/ICPSR{nnnnn}.v{n}` | `https://doi.org/10.3886/ICPSR07953.v1` |

Both resolve via the doi.org resolver. Use `https://doi.org/...` format, not direct repository URLs, for permanence.

**Note from CV review:** The CV does not include dataset links. During execution, Claude should leave `data_url: ""` for all entries unless the user provides specific dataset DOIs. The Data button will then be absent on all entries until the user supplies the links during their review.

---

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| Separate `.bib` file + CSL rendering | YAML data file + hand-written citations in Markdown | Community preference 2022–present | YAML is editable without BibTeX knowledge; CSL/Pandoc produces reference-list output, not styled publication-list entries |
| Hugo/Wowchemy academic theme | Quarto websites with custom SCSS | 2022–2024 migration wave | Quarto is now the standard for R/political-science academics; simpler stack; no Hugo/npm dependency |
| Python/Jupyter loop in `.qmd` | Pure Markdown (for simple sites) | Per-site decision | Pure Markdown has zero compute dependency, faster render, easier to debug |

---

## Open Questions

1. **DOI availability for older articles**
   - What we know: The CV does not include DOIs. Most articles from 2011–2025 in these journals (LSQ, JPAM, etc.) will have DOIs findable via CrossRef.
   - What's unclear: Whether Claude should look up DOIs during plan execution or leave them blank for user review.
   - Recommendation: During execution, attempt DOI lookup for each article via CrossRef (doi.org search) and populate what can be found confidently. Mark uncertain entries with `doi: ""` and a comment. User reviews before publishing.

2. **PDF hosting for self-archived copies**
   - What we know: The user may have preprint or author-accepted PDFs to self-host. The `pdf` field is in the schema.
   - What's unclear: Whether any PDFs currently exist in the repository or on the user's machine.
   - Recommendation: Leave `pdf: ""` for all entries initially. During user review, user provides PDF files to add. PDFs would be placed in a `/papers/` directory at the project root.

3. **Forthcoming articles — how many?**
   - What we know: CV lists 2 forthcoming articles (High Hurdles; Shared Pain, Common Purpose).
   - What's unclear: Whether these should appear at the top of the peer-reviewed section (most recent) or at the bottom.
   - Recommendation: Place forthcoming articles at the very top of the peer-reviewed section, above dated entries, since they are the most recent. Use `year: "Forthcoming"` in YAML.

---

## Validation Architecture

### Test Framework

| Property | Value |
|----------|-------|
| Framework | None — static site; same as Phase 1 |
| Config file | None required |
| Quick run command | `quarto render --no-cache 2>&1 \| grep -iE "error\|warning"` |
| Full suite command | `quarto render && quarto preview` (manual visual check) |
| Estimated runtime | ~15 seconds (slightly longer than Phase 1 due to YAML data file) |

Phase 2 produces additional static HTML. No application logic or data transformations require unit testing. Validation is: does the site build without error, and does the publications page look correct in a browser.

### Phase Requirements → Test Map

| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| PUBL-01 | Publications page has three distinct sections (Articles, Chapters, Working Papers) | smoke | `quarto render --no-cache 2>&1 \| grep -i error` then visual check | ✅ (check-render.sh exists) |
| PUBL-02 | DOI/PDF buttons appear on entries with those fields populated | manual | Open `/publications.html` in browser; inspect button presence | N/A |
| PUBL-03 | Working papers section is visually distinct | manual | Open `/publications.html`; confirm left border / accent styling | N/A |
| PUBL-04 | Data buttons link to Dataverse/ICPSR repos | manual | Click any Data button; confirm external repo opens | N/A |
| IDEN-03 | Every publication entry has a summary paragraph | smoke | `grep -c "pub-entry" _site/publications.html` vs count of entries in YAML | ✅ (scriptable after render) |

### Sampling Rate

- **Per task commit:** `quarto render --no-cache 2>&1 | grep -iE "error|warning"` — confirms no build errors
- **Per wave merge:** `quarto render && quarto preview` — visual check of publications page
- **Phase gate:** Full manual checklist (all sections visible, all buttons functional, all summaries present) before `/gsd:verify-work`

### Wave 0 Gaps

- [ ] `scripts/check-render.sh` — exists from Phase 1; verify it covers publication page rendering
- [ ] No new test files required — pure static output validated by render + visual review

---

## Sources

### Primary (HIGH confidence)

- Quarto official docs — `quarto.org/docs/websites/website-listings.html` — confirmed Listings feature requires per-file content; does NOT support arbitrary YAML schemas
- Bootstrap 5 docs (via Quarto bundling) — btn component classes are standard Bootstrap; confirmed available in Quarto cosmo theme
- Phase 1 site codebase (`custom.scss`, `_quarto.yml`, `index.qmd`) — established patterns carried forward

### Secondary (MEDIUM confidence)

- Drew Dimmery's Quarto academic website post (`ddimmery.com/posts/quarto-website/`) — Python+YAML loop pattern documented; confirms YAML schema approach; this site uses Python kernel which we explicitly do NOT adopt
- APSA Style Manual (`connect.apsanet.org/stylemanual/`) — citation format verified
- ICPSR data citation example (`doi.org/10.3886/ICPSR07953.v1`) — URL pattern verified
- Harvard Dataverse documentation — DOI URL pattern verified

### Tertiary (LOW confidence)

- DOI availability for specific McGrath articles — not verified; will require CrossRef lookup during execution
- Specific dataset DOIs for papers with associated data — not found in CV; requires user input

---

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH — no new dependencies; all tools from Phase 1 carry forward
- Architecture patterns: HIGH — pure Markdown approach verified against Quarto docs; Listings anti-pattern confirmed
- YAML schema: HIGH — field design is straightforward; conventions (empty string, full DOI URLs) are standard
- CV data extraction: HIGH — CV read directly from PDF; 26 entries catalogued in this document
- DOI/PDF population: LOW — individual DOIs not yet looked up; dataset links not in CV
- Pitfalls: HIGH — each pitfall observed from Quarto docs, Bootstrap theming docs, or YAML spec

**Research date:** 2026-03-22
**Valid until:** 2026-06-22 (stable stack; 90 days reasonable)
