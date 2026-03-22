# Phase 2: Publications and Data - Context

**Gathered:** 2026-03-22
**Status:** Ready for planning

<domain>
## Phase Boundary

Publications page listing all scholarly work grouped by type (peer-reviewed articles, book chapters, working papers/preprints), with DOI/PDF links, Dataverse/ICPSR dataset cross-links, and plain-language summaries per entry. Data sourced from a single YAML file extracted from the user's CV PDF.

</domain>

<decisions>
## Implementation Decisions

### Publication data source
- Single `publications.yml` file as the structured data source
- Fields per entry: title, authors, year, type, journal/book, doi, pdf, data_url, summary
- Entries extracted from user's existing CV (PDF format) — Claude parses CV during execution
- 10–25 publications total across all types
- YAML chosen for maintainability and reuse in Phase 3 (CV page)

### Page structure and grouping
- Grouped by publication type: Peer-Reviewed Articles, Book Chapters, Working Papers/Preprints
- Within each group, entries ordered reverse-chronologically (most recent first)
- Working papers visually distinct as their own section (PUBL-03)

### Citation format
- APSA-style citations: Author(s). Year. "Title." Journal Volume(Issue): Pages.
- All coauthors listed in full on every entry (no truncation)

### Link presentation
- Small icon buttons below each citation: [DOI], [PDF], [Data]
- DOI and PDF buttons appear on all entries where available
- Data button appears only on entries with a data_url in YAML
- Data links point to formal repositories only (Dataverse, ICPSR) — no GitHub repos

### Plain-language summaries
- 1–2 sentence summaries displayed inline below each entry's link buttons
- Tone: accessible but authoritative — written as if explaining to a smart journalist
- Claude drafts summaries from paper titles/abstracts; user reviews before publishing
- Every publication gets a summary (IDEN-03)

### Claude's Discretion
- Exact SCSS styling for publication entries (spacing, typography, button design)
- How to visually distinguish working papers section from published work
- Entry card/container design (if any)
- How to handle entries missing optional fields (no DOI, no PDF, no data_url)
- Responsive layout adjustments for mobile

</decisions>

<code_context>
## Existing Code Insights

### Reusable Assets
- `custom.scss`: Warm neutrals palette and typography already defined — publication page inherits these
- `_quarto.yml`: Navbar already has "Publications" link pointing to `publications.qmd`
- `publications.qmd`: Stub page exists with placeholder text — will be replaced

### Established Patterns
- cosmo base theme + custom.scss overlay — new styles extend this pattern
- 720px max-width centered content column (`.quarto-container`)
- Source Serif 4 for body text, DM Sans for headings — citations will use body font
- Trestles template used for homepage — publications page will use standard page layout

### Integration Points
- `publications.qmd` already linked in navbar — just needs content replacement
- YAML data file will be referenced by publications.qmd (Quarto supports YAML data files)
- Publication data will be reused in Phase 3 for CV page cross-referencing
- Link color (#8B5E3C terracotta) applies to DOI/PDF/Data buttons automatically

</code_context>

<specifics>
## Specific Ideas

- APSA citation style chosen because it's standard for political science — user's primary field
- Summaries should feel like a research brief, not a press release: "This study finds that..." not "Scientists discovered that..."
- User's CV PDF is the authoritative source for publication list — extract during execution rather than asking user to manually enter data

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 02-publications-and-data*
*Context gathered: 2026-03-22*
