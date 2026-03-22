---
phase: 01-foundation
verified: 2026-03-22T16:00:00Z
status: gaps_found
score: 10/12 must-haves verified
re_verification: false
gaps:
  - truth: "About/Home page shows 3-5 sentence research interests summary"
    status: failed
    reason: "Research interests section contains only 2 sentences, below the 3-sentence minimum specified in IDEN-02, the plan success criteria, and the ROADMAP success criterion."
    artifacts:
      - path: "index.qmd"
        issue: "Research interests paragraph is 2 sentences: one about topical breadth, one about focus areas. Plan spec requires 3-5 sentences."
    missing:
      - "Add 1-3 additional sentences to the research interests section in index.qmd to reach the 3-sentence minimum."
  - truth: "Visitor can reach the site at a custom domain over HTTPS"
    status: partial
    reason: "Site is live at https://rjm328.github.io/ (HTTPS, HTTP 200) but ROADMAP Success Criterion 1 specifies 'custom domain'. No CNAME file exists in the repo or on the gh-pages branch. INFR-02 is marked complete in REQUIREMENTS.md, and the plan explicitly deferred domain acquisition. This is a known accepted deferral, not an oversight — flagged for traceability."
    artifacts:
      - path: "_publish.yml"
        issue: "Configured for https://rjm328.github.io/ (GitHub Pages default URL), not a custom domain."
    missing:
      - "Acquire a custom domain and configure CNAME on the gh-pages branch (out-of-band user task per plan decision). Mark INFR-02 in REQUIREMENTS.md as partial until domain is live."
human_verification:
  - test: "Open https://rjm328.github.io/ on a real mobile device at 375px width"
    expected: "Hamburger menu appears, tapping it reveals all 4 nav items, content is readable without horizontal scroll, photo does not touch or overlap the navbar"
    why_human: "Mobile layout correctness requires a real device or browser at 375px — cannot be verified from HTML source alone"
  - test: "Load https://rjm328.github.io/ in any browser and inspect the page typography"
    expected: "Body text renders in Source Serif 4 (serif), headings render in DM Sans (sans-serif), warm cream background (#FAF8F5), dark warm text, terracotta-toned links"
    why_human: "Font loading and visual rendering requires a live browser; cannot be confirmed from compiled CSS alone (Google Fonts may be blocked by network conditions)"
---

# Phase 1: Foundation Verification Report

**Phase Goal:** Establish project scaffold, visual identity, and live deployment — a renderable, deployed Quarto website with warm neutral design, functional navigation, and real user content.
**Verified:** 2026-03-22T16:00:00Z
**Status:** gaps_found
**Re-verification:** No — initial verification

---

## Goal Achievement

### Observable Truths

| #  | Truth | Status | Evidence |
|----|-------|--------|----------|
| 1  | Quarto renders the site without errors | VERIFIED | `_site/` contains 4 rendered HTML files (contact.html 8.9 KB, cv.html 8.8 KB, index.html 10.3 KB, publications.html 8.9 KB). Build artifacts present. |
| 2  | Navbar shows Home, Publications, CV, Contact links and all resolve without 404 | VERIFIED | `_quarto.yml` declares 4-item left navbar; `_site/` contains all four HTML files; rendered HTML contains `navbar-toggler` and all 4 link targets. |
| 3  | Source Serif 4 and DM Sans fonts are loaded via Google Fonts import | VERIFIED | `custom.scss` line 3 contains `@import url('https://fonts.googleapis.com/...')`. Compiled `_site/site_libs/bootstrap/bootstrap.min.css` opens with the same `@import` and declares `--bs-body-font-family: Source Serif 4` and `--bs-font-sans-serif: "DM Sans"`. |
| 4  | Warm neutrals palette (#FAF8F5 background, #3D3632 text, #8B5E3C links, #C4813D accent) is applied site-wide | VERIFIED | `custom.scss` declares all four SCSS variables. Compiled CSS contains `--bs-body-color: #3D3632`, `--bs-body-bg: #FAF8F5`. All four color values present. |
| 5  | Content column is narrow and centered (max-width 720px), Distill.pub-inspired | VERIFIED | `custom.scss` contains `.quarto-container { max-width: 720px; }`. Compiled CSS confirms `max-width:720px`. |
| 6  | Hamburger menu appears and functions at mobile widths (below lg breakpoint) | VERIFIED | Rendered `index.html` line 75 contains Bootstrap `navbar-toggler` button with `data-bs-toggle="collapse"` targeting `#navbarCollapse`. |
| 7  | About/Home page displays real professional photo, real name, real affiliation | VERIFIED | `index.qmd` frontmatter: `title: "Robert J. McGrath"`, `subtitle: "Associate Professor and Director of PhD Programs..."`, `image: images/profile.jpg`. Rendered HTML line 114: `<h1 class="title">Robert J. McGrath</h1>`. Profile photo 34,787 bytes (well under 150 KB limit). |
| 8  | About/Home page shows 2-3 sentence bio with academic background | VERIFIED | `index.qmd` body paragraph: "Robert J. McGrath earned his PhD in political science from the University of Iowa and holds a BA from Saint Peter's College. He was a Robert Wood Johnson Foundation Scholar in Health Policy Research at the University of Michigan from 2013 to 2015." — 2 sentences, within the 2-3 sentence requirement. |
| 9  | About/Home page shows 3-5 sentence research interests summary | FAILED | Research interests section contains exactly 2 sentences. Plan 01-02 success criteria requires 3-5 sentences (matches IDEN-02 and ROADMAP Success Criterion 2). Current text covers breadth and focus areas but does not meet the minimum count. |
| 10 | Site is deployed and accessible at a GitHub Pages HTTPS URL | VERIFIED | `curl -sI https://rjm328.github.io/` returns `HTTP/2 200`. `_publish.yml` confirms gh-pages deployment. Last-modified header: Sun, 22 Mar 2026 15:29:23 GMT. |
| 11 | Contact stub shows real email address with mailto link | VERIFIED | `contact.qmd` contains `[rmcgrat2@gmu.edu](mailto:rmcgrat2@gmu.edu)`. Real email address, not placeholder. |
| 12 | Visitor can reach the site at a custom domain over HTTPS | PARTIAL | Site is live at `https://rjm328.github.io/` (HTTPS confirmed, HTTP 200). No CNAME file exists in the repository or on the `gh-pages` branch. ROADMAP Success Criterion 1 specifies "custom domain"; however the plan explicitly recorded custom domain as deferred (out-of-band user task). REQUIREMENTS.md marks INFR-02 complete — this is an accepted deferral, not an oversight, but the criterion is not technically satisfied. |

**Score:** 10/12 truths verified (1 failed, 1 partial/accepted deferral)

---

### Required Artifacts

| Artifact | Expected | Status | Details |
|----------|----------|--------|---------|
| `_quarto.yml` | Site config with navbar, theme reference, `type: website` | VERIFIED | Contains `type: website`, 4-item navbar, `theme: [cosmo, custom.scss]`. |
| `custom.scss` | SCSS theme with fonts, colors, layout rules | VERIFIED | Contains `/*-- scss:defaults --*/`, `/*-- scss:rules --*/`, all color variables, Google Fonts import, 720px max-width. 37 lines, substantive. |
| `index.qmd` | About/Home page using trestles template with real content | VERIFIED | `about.template: trestles` present. Real name, affiliation, photo, bio, links. Research interests present but only 2 sentences (below 3-sentence minimum). |
| `publications.qmd` | Stub page so nav link resolves | VERIFIED | Exists, has title frontmatter and placeholder content. Nav link resolves to `_site/publications.html` (8.9 KB rendered). |
| `cv.qmd` | Stub page so nav link resolves | VERIFIED | Exists, has title frontmatter and placeholder content. Nav link resolves to `_site/cv.html` (8.8 KB rendered). |
| `contact.qmd` | Contact page with real email and mailto link | VERIFIED | Contains `[rmcgrat2@gmu.edu](mailto:rmcgrat2@gmu.edu)`. Real email, not placeholder. |
| `scripts/check-render.sh` | Executable smoke test for Quarto build | VERIFIED | File exists, 9 lines, `set -euo pipefail`, smoke test logic complete. Confirmed executable (`-x` test passes). |
| `images/profile.jpg` | Compressed professional headshot (<=150 KB) | VERIFIED | 34,787 bytes (34 KB). Well under 150 KB limit. Non-zero, non-placeholder (sourced from GMU faculty page per SUMMARY). |
| `_publish.yml` | Quarto publish config (created by `quarto publish`) | VERIFIED | Exists. Contains `gh-pages` entry pointing to `https://rjm328.github.io/`. |
| `.gitignore` | Excludes `_site/`, `.quarto/`, `.DS_Store` | VERIFIED | Contains all three exclusions. |
| `.nojekyll` | Empty file preventing GitHub Pages Jekyll processing | VERIFIED | Exists, 0 bytes. |

---

### Key Link Verification

| From | To | Via | Status | Details |
|------|----|-----|--------|---------|
| `_quarto.yml` | `custom.scss` | `theme` list reference | WIRED | Line 23: `- custom.scss` under `theme:`. Confirmed in compiled CSS. |
| `_quarto.yml` | `index.qmd, publications.qmd, cv.qmd, contact.qmd` | `navbar href` entries | WIRED | All four pages declared in `left:` navbar array. All four resolve to rendered HTML files in `_site/`. |
| `custom.scss` | Google Fonts CDN | `@import url` for Source Serif 4 and DM Sans | WIRED | Line 3: `@import url('https://fonts.googleapis.com/css2?family=Source+Serif+4:...')`. Baked into compiled CSS. |
| `index.qmd` | `images/profile.jpg` | `image:` frontmatter field | WIRED | `image: images/profile.jpg` in frontmatter. File exists at 34 KB. |
| `index.qmd` | `mailto:rmcgrat2@gmu.edu` | `about.links` envelope entry | WIRED | `href: mailto:rmcgrat2@gmu.edu` in links array. Rendered HTML line 121 confirms link. |
| `GitHub Pages` | `_site/` rendered output | `quarto publish gh-pages` deploys to `gh-pages` branch | WIRED | `_publish.yml` configures gh-pages. Live site returns HTTP 200. Last-modified 2026-03-22. |

---

### Requirements Coverage

| Requirement | Source Plan | Description | Status | Evidence |
|-------------|------------|-------------|--------|----------|
| INFR-01 | 01-01, 01-02 | Static site built with Quarto, deployed to GitHub Pages | SATISFIED | Quarto project renders to `_site/`. Deployed at `https://rjm328.github.io/`. `_publish.yml` present. HTTP 200 confirmed. |
| INFR-02 | 01-02 | Custom domain configured with HTTPS | PARTIAL | HTTPS confirmed at `https://rjm328.github.io/`. No custom domain (no CNAME). Plan explicitly deferred domain acquisition as an out-of-band user task. REQUIREMENTS.md marks INFR-02 complete — internal inconsistency. The technical requirement (custom domain) is not met; the deployment with HTTPS is met. |
| DSGN-01 | 01-01 | Distill.pub-inspired typography and layout | SATISFIED | Source Serif 4 + DM Sans imported via Google Fonts. 720px max-width on `.quarto-container`. Compiled CSS confirms all typography variables. Visual confirmation requires human (see Human Verification). |
| DSGN-02 | 01-01 | Responsive design works on mobile and desktop | SATISFIED (automated) / NEEDS HUMAN (visual) | Bootstrap cosmo base provides responsive grid. `navbar-toggler` present in rendered HTML. Mobile photo fix `@media (max-width: 768px)` in `custom.scss`. Visual mobile test requires human (see Human Verification). |
| DSGN-03 | 01-01 | Clean navigation with 5-6 items (Home, Publications, CV, Contact) | SATISFIED | 4-item navbar configured and rendered. All links resolve. Note: REQUIREMENTS.md says "5-6 items" but navbar has 4 items — this matches the plan spec exactly (Home, Publications, CV, Contact). The discrepancy between "5-6" and actual 4 is a requirement description issue, not an implementation gap. |
| IDEN-01 | 01-02 | User can view about/bio page with professional photo, affiliation, and background | SATISFIED | `index.qmd` and rendered HTML confirm: photo (34 KB), name "Robert J. McGrath", affiliation (Schar School/GMU), bio (2 sentences). |
| IDEN-02 | 01-02 | Homepage displays 3-5 sentence research interests summary | BLOCKED | Research interests section has 2 sentences, below the 3-sentence minimum. The content covers the topic but does not meet the specified quantity. |

**Orphaned requirements check:** REQUIREMENTS.md maps INFR-01, INFR-02, DSGN-01, DSGN-02, DSGN-03, IDEN-01, IDEN-02 to Phase 1. All seven are claimed by plans 01-01 and/or 01-02. No orphaned requirements.

---

### Anti-Patterns Found

| File | Line | Pattern | Severity | Impact |
|------|------|---------|----------|--------|
| `publications.qmd` | 5 | "Publication listings are being prepared and will be available soon." | Info | Expected stub for Phase 1. Phase 2 will replace. No impact on Phase 1 goal. |
| `cv.qmd` | 5 | "The full academic CV will be available here soon." | Info | Expected stub for Phase 1. Phase 3 will replace. No impact on Phase 1 goal. |

No blocker or warning anti-patterns in core Phase 1 files (`_quarto.yml`, `custom.scss`, `index.qmd`, `contact.qmd`).

---

### Human Verification Required

#### 1. Mobile Layout at 375px

**Test:** Open `https://rjm328.github.io/` on a real mobile device (or browser dev tools at 375px width). Tap the hamburger menu.
**Expected:** All 4 nav items appear in dropdown, content is readable without horizontal scroll, profile photo has appropriate spacing from navbar, trestles layout stacks photo above content.
**Why human:** Mobile rendering correctness and touch interaction require a live browser environment.

#### 2. Typography and Color Rendering

**Test:** Open `https://rjm328.github.io/` in any desktop browser. Inspect body text and headings visually and via DevTools Network > Fonts tab.
**Expected:** Body text is Source Serif 4 (serif), headings are DM Sans (sans-serif), background is warm cream (#FAF8F5), body text is dark warm (#3D3632), links have terracotta tone (#8B5E3C).
**Why human:** Font loading success (Google Fonts CDN reachability) and color rendering accuracy require visual inspection in a real browser.

---

### Gaps Summary

**Gap 1 (blocking IDEN-02): Research interests is 2 sentences, not 3-5.**

The research interests paragraph in `index.qmd` contains exactly 2 sentences. The plan success criteria, IDEN-02 requirement, and ROADMAP Success Criterion 2 all specify 3-5 sentences. This is a content completeness gap, not a structural or wiring issue. The fix is straightforward: add 1-3 sentences to the research interests section to reach the required minimum. The existing content is substantive and well-written; it simply needs expansion.

**Gap 2 (accepted deferral — INFR-02): No custom domain.**

The site is live at `https://rjm328.github.io/` with HTTPS confirmed, but ROADMAP Success Criterion 1 specifies "custom domain." No CNAME file exists. The plan explicitly decided to defer custom domain acquisition as an out-of-band user task, and REQUIREMENTS.md records INFR-02 as complete — this creates an internal inconsistency in the planning artifacts. The actual deployment is functional and HTTPS-secured; only the custom domain is absent. This is an accepted deferral by user decision, not an implementation failure, but the REQUIREMENTS.md status should be updated to "partial" or a note added acknowledging the deferral, so the discrepancy is tracked through Phase 4 QA.

---

_Verified: 2026-03-22T16:00:00Z_
_Verifier: Claude (gsd-verifier)_
