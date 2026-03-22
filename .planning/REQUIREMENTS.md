# Requirements: Academic Portfolio Website

**Defined:** 2026-03-22
**Core Value:** Visitors can quickly find and navigate to the author's scholarly publications and data work, presented in a way that's credible to academics and accessible to everyone.

## v1 Requirements

Requirements for initial release. Each maps to roadmap phases.

### Identity

- [x] **IDEN-01**: User can view about/bio page with professional photo, affiliation, and background
- [x] **IDEN-02**: Homepage displays 3-5 sentence research interests summary
- [ ] **IDEN-03**: Each publication has a plain-language summary accessible to non-academic visitors

### Publications

- [ ] **PUBL-01**: Publications page lists works grouped by type (peer-reviewed articles, book chapters, working papers)
- [ ] **PUBL-02**: Each publication links to DOI and/or PDF where available
- [ ] **PUBL-03**: Working papers / preprints displayed as a distinct section
- [ ] **PUBL-04**: Publications link to associated Dataverse/ICPSR datasets where applicable

### CV

- [ ] **CV-01**: CV page displays academic CV viewable in the browser
- [ ] **CV-02**: Visitor can download CV as PDF

### Contact

- [ ] **CONT-01**: Contact page displays email address
- [ ] **CONT-02**: Contact page links to ORCID, Google Scholar, and other professional profiles

### Design

- [x] **DSGN-01**: Distill.pub-inspired typography and layout (rich type scale, whitespace, content-forward)
- [x] **DSGN-02**: Responsive design works on mobile and desktop
- [x] **DSGN-03**: Clean navigation with 5-6 items (Home, Publications, CV, Contact)

### Infrastructure

- [x] **INFR-01**: Static site built with Quarto, deployed to GitHub Pages
- [x] **INFR-02**: Custom domain configured with HTTPS

## v2 Requirements

Deferred to future release. Tracked but not in current roadmap.

### Content

- **MEDIA-01**: Media mentions / press section with past coverage
- **TEACH-01**: Teaching page with syllabi and course descriptions
- **SPEAK-01**: Speaking engagements page

## Out of Scope

| Feature | Reason |
|---------|--------|
| Separate data projects page | Dataverse/ICPSR links integrated directly into publications |
| Blog / writing section | High maintenance burden; not requested for v1 |
| Interactive data visualizations on-site | Data hosted on external platforms; no need to duplicate |
| CMS or admin panel | Static site; content managed via code/files |
| User accounts or authentication | Public-facing read-only site |
| Comment sections or contact forms | Email link is sufficient; avoids server dependency |
| Analytics / visitor tracking | Privacy implications; low value for primary goal |
| Google Scholar auto-sync | Unofficial API is brittle; manually curated list is more reliable |

## Traceability

Which phases cover which requirements. Updated during roadmap creation.

| Requirement | Phase | Status |
|-------------|-------|--------|
| IDEN-01 | Phase 1 | Complete |
| IDEN-02 | Phase 1 | Complete |
| IDEN-03 | Phase 2 | Pending |
| PUBL-01 | Phase 2 | Pending |
| PUBL-02 | Phase 2 | Pending |
| PUBL-03 | Phase 2 | Pending |
| PUBL-04 | Phase 2 | Pending |
| CV-01 | Phase 3 | Pending |
| CV-02 | Phase 3 | Pending |
| CONT-01 | Phase 3 | Pending |
| CONT-02 | Phase 3 | Pending |
| DSGN-01 | Phase 1 | Complete |
| DSGN-02 | Phase 1 | Complete |
| DSGN-03 | Phase 1 | Complete |
| INFR-01 | Phase 1 | Complete |
| INFR-02 | Phase 1 | Complete |

**Coverage:**
- v1 requirements: 16 total
- Mapped to phases: 16
- Unmapped: 0

---
*Requirements defined: 2026-03-22*
*Last updated: 2026-03-22 after roadmap creation*
