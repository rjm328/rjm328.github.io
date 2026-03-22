---
phase: 04-qa-and-launch
plan: "01"
subsystem: infra
tags: [quarto, github-pages, doi-verification, crossref-api, harvard-dataverse, publications, qa]

# Dependency graph
requires:
  - phase: 01-foundation
    provides: site structure, custom.scss, navigation, GitHub Pages deployment
  - phase: 02-publications-and-data
    provides: publications.yml with 22 verified DOIs, publications.qmd static page
  - phase: 03-cv-and-contact
    provides: cv.qmd, contact.qmd, CV PDF, all profile links

provides:
  - QA verification confirming all 22 DOIs resolve correctly via CrossRef API
  - 3 Harvard Dataverse data_url fields populated in publications.yml (race-regs, rulemaking-speed, occupational-licensing)
  - [Data] buttons rendered in publications.qmd and _site/publications.html for the 3 papers
  - Confirmed: all internal navigation links, CV PDF, external profile links, publication counts all verified correct

affects:
  - site-deployment
  - future-phases

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "CrossRef API verification: title-match (not just HTTP status) required to confirm DOI correctness"
    - "Harvard Dataverse API search: api.crossref.org/works/{doi} and dataverse.harvard.edu/api/search for dataset discovery"
    - "publications.qmd is static file — data_url changes in publications.yml must be manually mirrored into .qmd"

key-files:
  created: []
  modified:
    - publications.yml
    - publications.qmd

key-decisions:
  - "Found 3 public Dataverse deposits (race-regs, rulemaking-speed, occupational-licensing) — data_url populated for all 3; remaining 19 articles confirmed as having no findable public deposits"
  - "publications.qmd is a static file — data_url changes in publications.yml do NOT auto-propagate; both files must be updated together"

patterns-established:
  - "DOI verification pattern: always verify via CrossRef title-match, not HTTP status — title confirmed for all 22"
  - "Data repository lookup: Harvard Dataverse API (api/search + subtree=lsq) is the most productive search path for political science journals"

requirements-completed:
  - PUBL-02
  - PUBL-04
  - IDEN-01
  - IDEN-02
  - IDEN-03
  - PUBL-01
  - PUBL-03
  - CV-01
  - CV-02
  - CONT-01
  - CONT-02
  - DSGN-03
  - INFR-01

# Metrics
duration: 6min
completed: 2026-03-22
---

# Phase 4 Plan 01: QA and Launch Summary

**Full-site QA passed with 22/22 DOIs verified via CrossRef API and 3 public Harvard Dataverse deposits discovered and linked**

## Performance

- **Duration:** 6 min
- **Started:** 2026-03-22T22:47:24Z
- **Completed:** 2026-03-22T22:53:55Z
- **Tasks:** 2 of 2
- **Files modified:** 2 (publications.yml, publications.qmd)

## Accomplishments

- All 22 DOIs verified against CrossRef API — 22/22 PASS with exact title matches (minor variants: "US" vs "U.S." accepted)
- Discovered and linked 3 public Harvard Dataverse replication datasets: DVN/HVMSDE (A Race for the Regs), DVN/6PXABK (Rulemaking Speed), DVN/OACTQG (Occupational Licensing); [Data] buttons now render for these 3 papers
- All link audit checks passed: 4/4 internal pages, CV PDF (86,791 bytes), 5/5 external profile links in contact.html, 22 DOI hrefs in publications.html, 4/4 nav items, 26/26 pub-summary instances
- CV count cross-check confirmed: 22 articles / 1 chapter / 3 working papers — exact match with cv.qmd count statements
- Research interests: 4 sentences (within 3-5 target); profile photo present in index.html
- Site builds cleanly with no errors before and after all changes

## Task Commits

1. **Task 1: DOI verification, link audit, and CV cross-check** — verification only, no files modified (all checks passed)
2. **Task 2: Data repository URL lookup and publications.yml update** - `7465da7` (feat)

**Plan metadata:** (docs commit below)

## Files Created/Modified

- `/Users/rmcgrath/Library/CloudStorage/Dropbox/Documents/Website/publications.yml` — Added data_url for 3 papers: Occupational Licensing (DVN/OACTQG), Rulemaking Speed (DVN/6PXABK), A Race for the Regs (DVN/HVMSDE)
- `/Users/rmcgrath/Library/CloudStorage/Dropbox/Documents/Website/publications.qmd` — Added [Data] buttons for the same 3 papers in the rendered HTML page

## Decisions Made

- Data repository lookup found 3 public deposits on Harvard Dataverse; all 3 verified by author name in dataset metadata. Remaining 19 articles confirmed as not having findable public Dataverse/ICPSR deposits (journals older than ~2018 did not have mandatory replication requirements; targeted searches returned no results).
- publications.qmd is a static file — the [Data] buttons must be manually added when data_url is populated in publications.yml (they do not auto-propagate). Both files must be kept in sync for future updates.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Added [Data] buttons directly to publications.qmd after discovering YAML data_url fields do not auto-propagate**
- **Found during:** Task 2 (data repository URL lookup and update)
- **Issue:** publications.qmd is a static hand-written file from Phase 2 — changes to publications.yml data_url fields have no effect on the rendered HTML. The [Data] buttons did not appear after updating publications.yml alone.
- **Fix:** Added `<a href="..." class="btn btn-outline-secondary btn-sm">Data</a>` to the pub-buttons divs for the 3 affected entries in publications.qmd
- **Files modified:** publications.qmd
- **Verification:** `grep -c 'href="https://doi.org/10.7910/DVN'` in _site/publications.html returned 3 (expected 3)
- **Committed in:** 7465da7 (Task 2 commit)

---

**Total deviations:** 1 auto-fixed (Rule 1 — bug/missing sync between YAML source and static .qmd)
**Impact on plan:** Required fix for correctness — data_url fields would have been populated but invisible to users without this fix. No scope creep.

## Issues Encountered

- OpenICPSR blocked API access via Cloudflare challenge — searched Harvard Dataverse only. All 3 deposits found were on Harvard Dataverse, consistent with journal practices.
- The "Does Partisan Conflict" (Boushey & McGrath 2020, JPART) paper was searched exhaustively but no public replication deposit found — left as data_url: "" per plan guidance.
- LSQ Dataverse only had one deposit for McGrath ("A Race for the Regs") — "Party Effects in State Legislative Committees" (McGrath & Ryan 2019) has no public deposit in the LSQ collection.

## User Setup Required

None — no external service configuration required.

## Next Phase Readiness

- Site is QA-verified and ready for sharing: https://rjm328.github.io/
- All 13 requirements for Phase 4 plan 01 confirmed satisfied
- Custom domain (INFR-02) remains deferred — to be configured after domain purchase
- PDF self-hosting (pdf: "" fields) deferred to future task when author-accepted manuscripts are available
- If additional publications are added, both publications.yml AND publications.qmd must be updated together

---
*Phase: 04-qa-and-launch*
*Completed: 2026-03-22*

## Self-Check: PASSED

- publications.yml: FOUND
- publications.qmd: FOUND
- 04-01-SUMMARY.md: FOUND
- Commit 7465da7 (Task 2): FOUND
- data_url populated: 3/26 (correct — 3 verified Dataverse deposits found)
- Data buttons in rendered HTML: 3 (correct)
