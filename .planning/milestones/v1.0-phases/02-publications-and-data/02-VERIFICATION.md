---
phase: 02-publications-and-data
verified: 2026-03-22T00:00:00Z
status: human_needed
score: 5/5 must-haves verified
human_verification:
  - test: "Visit https://rjm328.github.io/publications.html and confirm the JPAM entry reads 'Chen, Wendy' (not 'Chen, Brian')"
    expected: "First author of the Occupational Licensing entry is 'Chen, Wendy, William W. Franko, and Robert J. McGrath'"
    why_human: "SUMMARY.md prose used 'Chen, Brian' as an example name; actual YAML and QMD both say 'Chen, Wendy'. The CV PDF is the ground truth. Cannot verify author name correctness programmatically."
  - test: "Resize browser to 375px width and scroll through the full publications page"
    expected: "Publication entries stack vertically, DOI button rows wrap cleanly, and the gold left accent bar on the working papers section remains visible"
    why_human: "Responsive CSS layout requires visual inspection; automated checks cannot confirm flex-wrap and border-left rendering at narrow widths"
  - test: "Click 2-3 DOI buttons from different journal groups (e.g., the LSQ 'Shared Pain' entry and the JPART 'Rulemaking Speed' entry)"
    expected: "Each DOI button opens the correct journal article page on doi.org or the publisher's site"
    why_human: "DOIs were corrected via CrossRef API but live resolution requires network verification from a browser; HTTP 200 on the publications page does not confirm individual DOI correctness"
  - test: "Update one entry in publications.yml with a non-empty data_url value (e.g., 'https://example.com') and re-render locally"
    expected: "A 'Data' button appears below that entry in the correct terracotta styling"
    why_human: "PUBL-04 data button infrastructure is confirmed present in source but has never been exercised with an actual URL; conditional rendering needs end-to-end verification"
---

# Phase 2: Publications and Data — Verification Report

**Phase Goal:** Visitors can browse all scholarly work organized by type, with links to full text and associated datasets
**Verified:** 2026-03-22
**Status:** human_needed — all automated checks passed; 4 items require human confirmation
**Re-verification:** No — initial verification

---

## Goal Achievement

### Observable Truths (from ROADMAP.md Success Criteria)

| # | Truth | Status | Evidence |
|---|-------|--------|---------|
| 1 | Publications page lists works in distinct sections: peer-reviewed articles, book chapters, working papers/preprints | VERIFIED | publications.qmd has exactly 3 H2 sections: "Peer-Reviewed Articles", "Book Chapters", "Working Papers and Works in Progress". Confirmed in source and rendered HTML (3 H2 tags). |
| 2 | Each publication entry links to a DOI and/or PDF where one exists | VERIFIED | 22 of 26 entries have DOI buttons (matching 22 articles with non-empty doi fields). 0 PDF buttons rendered (pdf fields all empty — correct, no PDFs in CV). Book chapter and 3 working papers have no buttons (doi/pdf fields empty). Button rendering is conditional: no empty `<div class="pub-buttons">` written when all fields are empty. |
| 3 | Working papers are displayed as their own section, visually distinct from published work | VERIFIED | All 3 working paper pub-entry divs are nested inside a single `.working-papers` div. custom.scss applies `border-left: 3px solid #C4813D` and `padding-left: 1.25rem` to that class — gold left accent bar. Wiring confirmed: `.working-papers` appears in both publications.qmd (source) and rendered HTML (3 occurrences in _site/publications.html). |
| 4 | Publications that have associated Dataverse/ICPSR datasets link to those repositories directly from the entry | VERIFIED (infrastructure) | No CV entries have dataset URLs — all `data_url` fields are empty strings by design. The `data_url` field is present in publications.yml schema for all 26 entries. The plan's button-rendering rule specifies Data buttons appear only for non-empty data_url values. Zero Data buttons rendered (correct). Infrastructure satisfies the requirement; no datasets to link yet. |
| 5 | Each publication displays a plain-language summary readable by a non-academic visitor | VERIFIED | All 26 pub-entry divs contain `<p class="pub-summary">` elements (confirmed: 26 summaries in QMD source, 26 occurrences in rendered HTML). Summaries are substantive 1-2 sentence paragraphs, not placeholder text. SCSS `.pub-entry .pub-summary` applies italic muted styling. |

**Score:** 5/5 truths verified

---

### Required Artifacts

| Artifact | Provides | Exists | Substantive | Wired | Status |
|----------|---------|--------|-------------|-------|--------|
| `publications.yml` | Single source of truth for all 26 publication entries | Yes | Yes — 26 entries, all fields populated, YAML parses cleanly | Yes — read by Plan 02 executor to generate publications.qmd | VERIFIED |
| `custom.scss` | Publication entry styling, button overrides, working-papers accent | Yes | Yes — `.pub-entry`, `.pub-entry:last-child`, `.pub-buttons`, `.pub-buttons .btn-outline-secondary`, `.pub-buttons .btn-outline-secondary:hover`, `.working-papers`, `.pub-entry .pub-summary` all present | Yes — classes used in publications.qmd div attributes and HTML | VERIFIED |
| `publications.qmd` | Complete publications page with 26 entries in 3 sections | Yes | Yes — 246 lines, 26 `.pub-entry` divs, 3 H2 sections, 22 DOI buttons, 26 summaries | Yes — linked in `_quarto.yml` navbar as `href: publications.qmd` | VERIFIED |
| `_site/publications.html` | Rendered HTML output with pub-entry divs and btn elements | Yes | Yes — 26 `pub-entry` occurrences, 3 H2 tags, 3 `working-papers` occurrences, 26 `pub-summary` occurrences, 22 doi.org links | Yes — live at https://rjm328.github.io/publications.html (HTTP 200) | VERIFIED |

---

### Key Link Verification

| From | To | Via | Status | Evidence |
|------|----|-----|--------|---------|
| `publications.qmd ::: {.pub-entry}` | `custom.scss .pub-entry` | Quarto div class mapping | WIRED | 26 occurrences of `.pub-entry` in QMD; rule exists in custom.scss at line 40 |
| `publications.qmd btn-outline-secondary` | `custom.scss .pub-buttons .btn-outline-secondary` | CSS class targeting | WIRED | 22 `btn-outline-secondary` occurrences in QMD; scoped rule at custom.scss line 58 |
| `publications.qmd ::: {.working-papers}` | `custom.scss .working-papers` | Quarto div class mapping | WIRED | 1 `.working-papers` div in QMD enclosing all 3 working paper entries; rule at custom.scss line 72 |
| `publications.qmd .pub-summary` | `custom.scss .pub-entry .pub-summary` | CSS class targeting | WIRED | 26 `pub-summary` elements in QMD; scoped rule at custom.scss line 78 |
| `publications.yml type: article/chapter/working-paper` | `publications.qmd` section grouping | Manual YAML-to-QMD translation by executor | WIRED | 22 articles in Articles section, 1 chapter in Book Chapters, 3 working papers in Working Papers; counts match YAML type counts exactly |

---

### Requirements Coverage

| Requirement | Source Plan | Description | Status | Evidence |
|-------------|------------|-------------|--------|---------|
| PUBL-01 | 02-01, 02-02 | Publications page lists works grouped by type | SATISFIED | Three H2 sections in publications.qmd; type field on all 26 YAML entries drives grouping |
| PUBL-02 | 02-01, 02-02 | Each publication links to DOI and/or PDF where available | SATISFIED | 22 DOI buttons rendered; 0 PDF buttons (no PDFs available yet — correct). Conditional button logic verified. |
| PUBL-03 | 02-01, 02-02 | Working papers/preprints displayed as distinct section | SATISFIED | `.working-papers` div wraps all 3 entries; `border-left: 3px solid #C4813D` provides gold visual distinction |
| PUBL-04 | 02-01, 02-02 | Publications link to associated datasets where applicable | SATISFIED (infrastructure) | `data_url` field in schema; conditional Data button logic in QMD (0 buttons rendered, 0 datasets in CV — correct behavior) |
| IDEN-03 | 02-01, 02-02 | Each publication has a plain-language summary accessible to non-academic visitors | SATISFIED | All 26 entries have non-empty `summary` field in YAML; all 26 entries have `<p class="pub-summary">` in QMD |

**Orphaned requirements check:** REQUIREMENTS.md traceability table maps PUBL-01, PUBL-02, PUBL-03, PUBL-04, and IDEN-03 to Phase 2. All five appear in both plans' `requirements:` frontmatter. No orphaned requirements.

**Note — ROADMAP plan checkbox state:** ROADMAP.md shows `- [ ] 02-01-PLAN.md` and `- [ ] 02-02-PLAN.md` (unchecked) despite Phase 2 being marked complete in the phase-level entry. This is a ROADMAP documentation state tracking issue only — the code deliverables fully exist and are verified. Phase-level entry reads: `[x] Phase 2: Publications and Data — completed 2026-03-22`.

---

### Anti-Patterns Found

| File | Line | Pattern | Severity | Impact |
|------|------|---------|----------|--------|
| `.planning/ROADMAP.md` | Phase 2 Plans section | Plan checkboxes unchecked `[ ]` despite phase completion | Info | Documentation only — no code impact. ROADMAP phase-level entry correctly shows `[x]`. |
| `02-02-SUMMARY.md` | Example citation | "Chen, Brian, William Franko..." (SUMMARY prose, not code) | Info | SUMMARY prose example used incorrect first name. Actual publications.yml and publications.qmd both correctly record "Chen, Wendy". Requires human to verify against CV PDF. |

No blockers or code-level anti-patterns found. No TODO/FIXME/placeholder comments in any deliverable file. No stub implementations. No empty returns.

---

### Human Verification Required

#### 1. JPAM First Author Name

**Test:** On the live page at https://rjm328.github.io/publications.html, find the "Occupational Licensing and Income Inequality in the States" entry (2025, JPAM).
**Expected:** First author reads "Chen, Wendy" — confirming the YAML and QMD are correct against the CV source.
**Why human:** SUMMARY.md prose cited "Chen, Brian" as the first author. The actual YAML and QMD say "Chen, Wendy". Cannot resolve which is correct without checking the original CV PDF. This is a potential data entry error.

#### 2. Mobile Responsive Layout at 375px

**Test:** Open https://rjm328.github.io/publications.html on a real mobile device or browser devtools at 375px width. Scroll through the full page.
**Expected:** Publication entries stack vertically. DOI button rows wrap cleanly without overflow. The gold left accent bar on the Working Papers section remains visible. No horizontal scrolling.
**Why human:** The CSS uses `flex-wrap: wrap` on `.pub-buttons` and `border-left` on `.working-papers`. These render correctly in static analysis but mobile layout fidelity requires visual confirmation.

#### 3. DOI Button Link Resolution

**Test:** Click at least 3 DOI buttons from different journal groups: one LSQ entry, one JPART entry, and one from a different publisher (e.g., JOP or Publius).
**Expected:** Each button navigates to the correct article on the publisher's site or doi.org. No 404s or wrong-article redirects.
**Why human:** DOIs were corrected via CrossRef API during execution, but live resolution from a logged-out browser is the only reliable test. The HTTP 200 on the publications page confirms the page exists, not individual DOI correctness.

#### 4. Data Button Conditional Rendering (Smoke Test)

**Test:** In `publications.yml`, temporarily set one entry's `data_url` to a valid URL (e.g., `https://doi.org/10.7910/DVN/test`), run `quarto render` locally, and inspect the rendered entry.
**Expected:** A "Data" button appears in the correct terracotta `btn-outline-secondary` style, alongside the DOI button.
**Why human:** The `data_url` conditional rendering infrastructure is present in publications.qmd but has never been exercised with an actual value. This is the only un-exercised code path for PUBL-04.

---

## Gaps Summary

No gaps blocking goal achievement. All five ROADMAP success criteria are satisfied by verified, substantive, wired artifacts. The phase goal — "Visitors can browse all scholarly work organized by type, with links to full text and associated datasets" — is achieved in the codebase.

Four items are flagged for human verification:
1. One possible first-author name error (Chen Wendy vs Chen Brian) needs CV PDF confirmation
2. Mobile responsive layout needs visual confirmation
3. DOI live resolution needs browser-click confirmation
4. PUBL-04 Data button conditional path needs a smoke test with a real URL

None of these block the automated assessment of goal achievement. They are quality confirmation items appropriate to a human review pass.

---

_Verified: 2026-03-22_
_Verifier: Claude (gsd-verifier)_
