---
phase: 02-publications-and-data
plan: "02"
subsystem: ui
tags: [quarto, publications, apsa, html, css, github-pages, doi, crossref]

# Dependency graph
requires:
  - phase: 02-publications-and-data plan 01
    provides: publications.yml (26-entry YAML data source), custom.scss with .pub-entry/.pub-buttons/.working-papers/.pub-summary rules

provides:
  - publications.qmd — Complete publications page with 26 entries in three sections, APSA citations, conditional link buttons, and plain-language summaries
  - https://rjm328.github.io/publications.html — Live deployed page

affects:
  - 03-cv phase (can link to publications page from CV)
  - Any future publications updates (edit publications.yml and re-render)

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "YAML-to-QMD manual rendering: publications.yml is read at plan execution time and hand-translated into .qmd Markdown + inline HTML"
    - "Conditional button rendering: DOI/PDF/Data buttons only written if their field is a non-empty string"
    - "Nested Quarto div classes: .working-papers contains .pub-entry divs for cascading CSS (accent bar wraps all working paper entries)"
    - "Direct gh-pages worktree push when quarto publish has --no-prompt/multiple-entries conflict"

key-files:
  created:
    - publications.qmd
    - .planning/phases/02-publications-and-data/02-02-SUMMARY.md
  modified: []

key-decisions:
  - "22 peer-reviewed articles + 1 book chapter + 3 working papers = 26 entries total, matching publications.yml exactly"
  - "Forthcoming articles listed first in peer-reviewed section (most-recent-first convention)"
  - "Working papers wrapped in single .working-papers div enclosing all three .pub-entry divs — accent bar applies to full section"
  - "quarto publish gh-pages used worktree approach due to --no-prompt multiple-publish conflict; _publish.yml unchanged"

patterns-established:
  - "Button rendering: never write <div class='pub-buttons'> unless at least one button exists; never write button for empty-string field"
  - "APSA author format: first author inverted (Last, First M.), subsequent authors normal (First M. Last)"
  - "Book chapter citation: Authors. Year. 'Title.' In *Book*, ed. Editor. Publisher."
  - "Working paper citation: Authors. 'Title.' *Working paper.* / *Work in progress.* / *Book manuscript in progress.*"

requirements-completed: [PUBL-01, PUBL-02, PUBL-03, PUBL-04, IDEN-03]

# Metrics
duration: ~35min
completed: 2026-03-22
---

# Phase 2 Plan 02: Publications Page Summary

**26-entry publications.qmd with APSA citations, 22 CrossRef-validated DOI buttons, gold working-papers accent bar, and italic plain-language summaries — user-approved at https://rjm328.github.io/publications.html**

## Performance

- **Duration:** ~35 min
- **Started:** 2026-03-22T16:40:09Z
- **Completed:** 2026-03-22
- **Tasks:** 2 completed (1 auto + 1 human-verify, user approved)
- **Files modified:** 1

## Accomplishments

- Replaced stub `publications.qmd` with complete 246-line page containing all 26 entries from publications.yml
- Structured into three sections: Peer-Reviewed Articles (22 entries), Book Chapters (1 entry), Working Papers and Works in Progress (3 entries)
- Applied APSA citation format throughout: inverted first author, journal in italics, volume(issue): pages
- Rendered conditional DOI buttons on 22 entries (20 corrected via CrossRef API + 2 new for Forthcoming articles); no PDF or Data buttons (fields currently empty)
- Wrapped all 3 working paper entries in `.working-papers` div for gold left accent bar (PUBL-03)
- Added `<p class="pub-summary">` italic summaries to every entry (IDEN-03)
- Quarto render: clean build, 26 pub-entry divs, 3 H2 sections, 26 summaries, 20 DOI links confirmed
- Deployed to GitHub Pages via git worktree push to gh-pages branch; live at https://rjm328.github.io/publications.html (HTTP 200 confirmed)

## Task Commits

Each task was committed atomically:

1. **Task 1: Write publications.qmd with all entries and deploy** - `c79b1e6` (feat)
2. **Task 1 deviation: correct all DOIs via CrossRef** - `e267470` (fix)
3. **Task 1 deviation: regenerate publications.qmd with corrected DOIs** - `7f77807` (fix)
4. **Task 2: human-verify checkpoint** - N/A (user approved; no code change)

**Plan metadata:** (docs commit made after user approval)

## Files Created/Modified

- `publications.qmd` — Complete publications page: 22 articles, 1 chapter, 3 working papers; APSA citations; conditional DOI buttons; italic summaries for all 26 entries

## Decisions Made

- Working papers wrapped in a single `.working-papers` div that encloses all three `.pub-entry` divs — this gives the entire section the left gold accent bar, which is the correct visual treatment
- `quarto publish gh-pages --no-prompt` failed with "multiple previous publishes" error (Quarto 1.2.475 limitation with single _publish.yml entry); resolved by using git worktree to push _site directly to gh-pages branch — functionally identical result

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] Used git worktree instead of quarto publish for deployment**
- **Found during:** Task 1 (deploy step)
- **Issue:** `quarto publish gh-pages --no-prompt` exited with error "Multiple previous publishes exist (specify one with --id when using --no-prompt)" — Quarto 1.2.475 bug with single-entry _publish.yml
- **Fix:** Created git worktree pointing to origin/gh-pages, copied _site contents, committed, pushed HEAD:gh-pages
- **Files modified:** None (gh-pages branch only)
- **Verification:** HTTP 200 from https://rjm328.github.io/publications.html confirmed
- **Committed in:** c79b1e6 (Task 1 commit)

---

**2. [Rule 1 - Bug] All original DOI values were hallucinated and required CrossRef correction**
- **Found during:** Task 1 (after initial publications.qmd generation)
- **Issue:** The AI-generated DOI values written into publications.qmd were plausible-looking but incorrect — none resolved to the actual papers. 20 existing entries had wrong DOIs; 2 Forthcoming entries had no DOI and needed new ones sourced.
- **Fix:** Queried CrossRef API for each article by title and first author; replaced all DOI values with verified CrossRef-returned URLs. Two Forthcoming articles (High Hurdles, Shared Pain) had DOIs retrieved from CrossRef early-access records.
- **Files modified:** publications.qmd
- **Verification:** Each replaced DOI resolves correctly via doi.org
- **Committed in:** `e267470`, `7f77807`

---

**Total deviations:** 2 auto-fixed (1 blocking — deployment method; 1 bug — hallucinated DOIs)
**Impact on plan:** Both fixes were necessary for correctness. DOI fix is critical — without it, every DOI button would link to nonexistent or wrong papers. No scope creep.

## Issues Encountered

- `quarto publish gh-pages --no-prompt` failed with Quarto 1.2.475 bug requiring `--id` flag when _publish.yml has a single entry with no explicit ID. Workaround via git worktree is equivalent and leaves no artifacts.
- All AI-generated DOI values required CrossRef verification and replacement. For future publications page updates, DOIs should be validated against CrossRef before committing.

## User Setup Required

None — no external service configuration required.

## Next Phase Readiness

- publications.qmd is live and browsable — Phase 2 requirements PUBL-01 through PUBL-04 and IDEN-03 satisfied
- PDF links can be added to publications.yml when PDFs are available (pdf field already in schema, button will appear automatically on re-render + re-deploy)
- Data buttons will appear automatically when data_url fields are populated in publications.yml
- Phase 3 (CV) can reference publications.yml as shared data source and link to the publications page

## Self-Check: PASSED

- publications.qmd: FOUND (22 DOI buttons with CrossRef-validated URLs, 3 sections, 26 summaries)
- Commit c79b1e6: FOUND (Task 1 — feat: write publications.qmd)
- Commit e267470: FOUND (fix: correct all DOIs via CrossRef lookup)
- Commit 7f77807: FOUND (fix: regenerate publications.qmd with corrected DOIs)
- https://rjm328.github.io/publications.html: HTTP 200 confirmed; user approved

---
*Phase: 02-publications-and-data*
*Completed: 2026-03-22*
