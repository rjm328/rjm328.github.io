# Roadmap: Academic Portfolio Website

## Overview

Four phases, derived from the natural dependency order of the work. The base layout and design must exist before any content page can be built. Publications and data content — the highest-value sections for both audience types — come next, with the content architecture (YAML schema, single source of truth) established before any entries are added. CV and Contact follow, reusing the publications schema already in place. A final QA and launch phase verifies everything is correct before the URL is shared.

## Phases

**Phase Numbering:**
- Integer phases (1, 2, 3): Planned milestone work
- Decimal phases (2.1, 2.2): Urgent insertions (marked with INSERTED)

Decimal phases appear between their surrounding integers in numeric order.

- [x] **Phase 1: Foundation** - Quarto project with Distill-inspired design live, About/Home page published, custom domain with HTTPS (completed 2026-03-22)
- [ ] **Phase 2: Publications and Data** - Publications page with grouped entries, DOI/PDF links, and dataset cross-links
- [ ] **Phase 3: CV and Contact** - Browser-viewable CV with PDF download, contact page with professional profile links
- [ ] **Phase 4: QA and Launch** - All links verified, mobile tested, CV and publications cross-checked, site announced

## Phase Details

### Phase 1: Foundation
**Goal**: The site is live with a working design and real content on the About/Home page
**Depends on**: Nothing (first phase)
**Requirements**: INFR-01, INFR-02, DSGN-01, DSGN-02, DSGN-03, IDEN-01, IDEN-02
**Success Criteria** (what must be TRUE):
  1. Visitor can reach the site at the custom domain over HTTPS from any browser
  2. About/Home page displays professional photo, affiliation, and a 3-5 sentence research interests summary
  3. Navigation with 5-6 items (Home, Publications, CV, Contact) is visible and functional on both desktop and mobile
  4. Distill.pub-inspired typography (Source Serif 4, DM Sans, generous whitespace, narrow centered column) is applied site-wide
  5. Page renders correctly on a real mobile device at 375px width (not just browser devtools)
**Plans**: 2 plans

Plans:
- [x] 01-01-PLAN.md — Scaffold Quarto project with SCSS theme, navbar, and stub pages
- [x] 01-02-PLAN.md — Inject real content, deploy to GitHub Pages, verify live site

### Phase 2: Publications and Data
**Goal**: Visitors can browse all scholarly work organized by type, with links to full text and associated datasets
**Depends on**: Phase 1
**Requirements**: PUBL-01, PUBL-02, PUBL-03, PUBL-04, IDEN-03
**Success Criteria** (what must be TRUE):
  1. Publications page lists works in distinct sections: peer-reviewed articles, book chapters, working papers/preprints
  2. Each publication entry links to a DOI and/or PDF where one exists
  3. Working papers are displayed as their own section, visually distinct from published work
  4. Publications that have associated Dataverse/ICPSR datasets link to those repositories directly from the entry
  5. Each publication displays a plain-language summary readable by a non-academic visitor (journalist, policymaker)
**Plans**: 2 plans

Plans:
- [ ] 02-01-PLAN.md — Create publications.yml data file and publication SCSS styles
- [ ] 02-02-PLAN.md — Write publications.qmd page, deploy, and verify live result

### Phase 3: CV and Contact
**Goal**: Visitors can view and download the full academic CV, and can reach the author through email and professional profiles
**Depends on**: Phase 2
**Requirements**: CV-01, CV-02, CONT-01, CONT-02
**Success Criteria** (what must be TRUE):
  1. CV page displays the full academic CV readable in the browser without downloading anything
  2. Visitor can download the CV as a PDF from a clearly labeled button on the CV page
  3. Contact page displays the author's email address directly (not hidden behind a form)
  4. Contact page links to ORCID, Google Scholar, and other professional profiles
**Plans**: TBD

### Phase 4: QA and Launch
**Goal**: Every page, link, and cross-reference is verified correct before the URL is shared publicly
**Depends on**: Phase 3
**Requirements**: (validation phase — covers all 16 v1 requirements)
**Success Criteria** (what must be TRUE):
  1. Every DOI, Dataverse/ICPSR link, and PDF link resolves correctly when clicked from a logged-out browser on a separate network
  2. CV PDF content matches the publications page (no entries present in one but missing from the other)
  3. Both https://yourdomain.com and https://www.yourdomain.com load correctly with valid HTTPS certificates
  4. All pages display correctly on a real mobile device (not just devtools simulation)
**Plans**: TBD

## Progress

**Execution Order:**
Phases execute in numeric order: 1 → 2 → 3 → 4

| Phase | Plans Complete | Status | Completed |
|-------|----------------|--------|-----------|
| 1. Foundation | 2/2 | Complete   | 2026-03-22 |
| 2. Publications and Data | 1/2 | In Progress|  |
| 3. CV and Contact | 0/TBD | Not started | - |
| 4. QA and Launch | 0/TBD | Not started | - |
