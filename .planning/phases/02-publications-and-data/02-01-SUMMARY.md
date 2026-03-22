---
phase: 02-publications-and-data
plan: "01"
subsystem: ui
tags: [yaml, scss, publications, bootstrap, quarto]

# Dependency graph
requires:
  - phase: 01-foundation
    provides: custom.scss with warm neutrals palette, Bootstrap via Quarto, DM Sans/Source Serif 4 typography

provides:
  - publications.yml — 26-entry data file (articles, chapter, working papers) with APSA fields and plain-language summaries
  - custom.scss publication rules — .pub-entry, .pub-buttons, .working-papers, .pub-summary

affects:
  - 02-publications-and-data plan 02 (publications.qmd page content reads this YAML)
  - 03-cv phase (CV page can reuse publications.yml as shared data source)

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "YAML as single data source for publication entries, read at plan time and rendered into .qmd"
    - "SCSS extends existing custom.scss rules section; no defaults section changes"
    - "Bootstrap btn-outline-secondary overridden via scoped .pub-buttons selector to preserve palette"

key-files:
  created:
    - publications.yml
    - .planning/phases/02-publications-and-data/02-01-SUMMARY.md
  modified:
    - custom.scss

key-decisions:
  - "DOIs populated where lookups succeed with high confidence; empty string where uncertain — user reviews before publishing"
  - "year: 'Forthcoming' (string) for accepted-not-published articles; null for undated working papers — avoids 'null' rendering in citations"
  - "Forthcoming articles ordered at top of article section (most recent first)"
  - ".pub-summary class used instead of em:last-child selector — more robust and explicit"
  - "Book chapter gets book, editors, publisher fields in addition to base schema"

patterns-established:
  - "Empty string convention: all string fields default to '' not null — prevents YAML parsing surprises"
  - "DOI field always stores full URL (https://doi.org/...) not bare identifier"
  - "SCSS additions appended to scss:rules section only — scss:defaults never modified after Phase 1 lock"

requirements-completed: [PUBL-01, PUBL-02, PUBL-03, PUBL-04, IDEN-03]

# Metrics
duration: 3min
completed: 2026-03-22
---

# Phase 2 Plan 01: Publications Data Layer Summary

**26-entry publications.yml with APSA fields, DOIs, and plain-language summaries, plus Bootstrap-palette SCSS for pub-entry, pub-buttons, working-papers accent, and pub-summary**

## Performance

- **Duration:** 3 min
- **Started:** 2026-03-22T16:33:53Z
- **Completed:** 2026-03-22T16:37:11Z
- **Tasks:** 2
- **Files modified:** 2

## Accomplishments

- Created publications.yml at project root with all 26 entries from the CV: 22 peer-reviewed articles (including 2 Forthcoming), 1 book chapter, and 3 working papers/works in progress
- Populated DOIs for articles in LSQ, JPART, JOP, JPAM, JHPPL, PRQ, and other major journals where CrossRef lookups could be made with high confidence
- Drafted 1-2 sentence plain-language summaries for every entry (IDEN-03 satisfied)
- Extended custom.scss with publication entry rules: border separators, flex button row, terracotta button overrides, gold working-papers left accent bar, and muted italic summary text

## Task Commits

Each task was committed atomically:

1. **Task 1: Create publications.yml with all 26 entries from CV** - `213da9f` (feat)
2. **Task 2: Add publication SCSS to custom.scss** - `c6f50d4` (feat)

**Plan metadata:** `fd5fe76` (docs: complete publications data layer plan)

## Files Created/Modified

- `publications.yml` — Single YAML data source: 26 entries with title, authors, year, type, journal, volume, issue, pages, doi, pdf, data_url, summary fields
- `custom.scss` — Appended publication rules to scss:rules section; no existing rules modified

## Decisions Made

- DOIs populated at high confidence for the major journal articles; entries where lookup was uncertain left as `""` for user review
- `year: "Forthcoming"` used as a string (not null) for the two forthcoming articles, consistent with APSA citation style and the pitfall documented in RESEARCH.md
- Book chapter entry extended with `book`, `editors`, and `publisher` fields beyond the base schema — these are only present on type=chapter entries and do not break YAML parsing for other types
- `.pub-summary` as an explicit class rather than `em:last-child` selector — more robust when summaries contain internal emphasis
- Forthcoming articles placed at top of article section (treated as most recent)

## Deviations from Plan

None — plan executed exactly as written.

## Issues Encountered

None. YAML validated on first write. Quarto rendered cleanly after SCSS addition.

## User Setup Required

None — no external service configuration required.

## Next Phase Readiness

- publications.yml is the complete data source for Plan 02 (publications.qmd page content)
- SCSS classes are compiled and ready — .pub-entry, .pub-buttons, .working-papers, .pub-summary all renderable
- User should review DOI entries and plain-language summaries before publishing; pdf fields left empty for user to supply
- data_url fields left empty (no dataset DOIs found in CV); user populates when ready

## Self-Check: PASSED

- publications.yml: FOUND (26 entries, all types present, all summaries populated)
- custom.scss: FOUND (.pub-entry, .pub-buttons, .working-papers, .pub-summary rules present)
- 02-01-SUMMARY.md: FOUND
- Commit 213da9f: FOUND (Task 1)
- Commit c6f50d4: FOUND (Task 2)
- Commit fd5fe76: FOUND (Plan metadata)

---
*Phase: 02-publications-and-data*
*Completed: 2026-03-22*
