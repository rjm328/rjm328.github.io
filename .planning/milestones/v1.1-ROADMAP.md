# Roadmap: Academic Portfolio Website

## Milestones

- ✅ **v1.0 Academic Portfolio** - Phases 1-4 (shipped 2026-03-22)
- ✅ **v1.1 Polish & Data** - Phases 5-8 (completed 2026-03-23)

## Phases

<details>
<summary>✅ v1.0 Academic Portfolio (Phases 1-4) - SHIPPED 2026-03-22</summary>

Phases 1-4 delivered the full site: foundation, content, publications, and deployment.
See MILESTONES.md for accomplishments.

</details>

### ✅ v1.1 Polish & Data (Completed 2026-03-23)

**Milestone Goal:** Refine the site's visual quality and expand data repository links

- [x] **Phase 5: Hero & Design Polish** - Landing page hero redesign and sitewide typography/spacing refinements (completed 2026-03-23)
- [x] **Phase 6: Publications Navigation** - Collapsible publication sections grouped by type and year (completed 2026-03-23)
- [x] **Phase 7: CV Timeline Layout** - Timeline-style CV with clear visual hierarchy (completed 2026-03-23)
- [x] **Phase 8: Data Repository Links** - Thorough data link search and [Data] button population (completed 2026-03-23)

## Phase Details

### Phase 5: Hero & Design Polish
**Goal**: Visitors see a visually refined landing page and consistent polish across all pages
**Depends on**: Phase 4 (v1.0 complete)
**Requirements**: HERO-01, HERO-02, DSGN-04
**Success Criteria** (what must be TRUE):
  1. Landing page subtitle reads "Associate Professor, Schar School of Policy and Government, George Mason University" with the Director line visually separated below
  2. Name, title, and Director line have proper spacing — no crowding or misalignment
  3. Typography, spacing, and color are consistent and polished across About, Publications, CV, and Contact pages
**Plans:** 2/2 plans complete
Plans:
- [ ] 05-01-PLAN.md — Hero subtitle redesign and Director line separation
- [ ] 05-02-PLAN.md — Sitewide typography, spacing, and color polish

### Phase 6: Publications Navigation
**Goal**: Visitors can quickly find publications by type and year without being overwhelmed by a long list
**Depends on**: Phase 5
**Requirements**: PUBS-01, PUBS-02, PUBS-03
**Success Criteria** (what must be TRUE):
  1. Publications page shows three top-level collapsible sections: Articles, Chapters, Working Papers — each with a visible expand/collapse toggle
  2. Within each section, entries are grouped by year with their own collapsible year subgroups
  3. The most recent year group (2025/2026/Forthcoming) is expanded by default when the page loads; all other year groups and sections are collapsed
  4. Collapsing and expanding sections works correctly across Chrome, Firefox, and Safari
**Plans:** 1/1 plans complete
Plans:
- [ ] 06-01-PLAN.md — Collapsible sections and year-grouped entries with details/summary

### Phase 7: CV Timeline Layout
**Goal**: Visitors can read the CV with a clear visual structure that separates dates from content
**Depends on**: Phase 5
**Requirements**: CVFX-01, CVFX-02
**Success Criteria** (what must be TRUE):
  1. CV entries display with dates on the left and content details on the right in a consistent two-column timeline layout
  2. CV sections have visible separators and adequate vertical spacing so each section is clearly distinct from the next
**Plans:** 1 plan
Plans:
- [ ] 07-01-PLAN.md — Timeline-style two-column layout with CSS Grid and enhanced section separators

### Phase 8: Data Repository Links
**Goal**: All discoverable data associated with the author's publications is linked directly from the publications page
**Depends on**: Phase 5
**Requirements**: DATA-01, DATA-02
**Success Criteria** (what must be TRUE):
  1. All 26 publications have been checked against Dataverse, ICPSR, and journal supplementary materials for associated datasets
  2. Every discovered data repository URL is populated in publications.yml
  3. Publications with verified data links display a [Data] button that opens the correct repository URL
**Plans:** 2/2 plans complete
Plans:
- [x] 08-01-PLAN.md — Deep search all publications for data repository deposits and user review (3 new deposits found, DATA-01/DATA-02 satisfied)

## Progress

**Execution Order:** 5 → 6 → 7 → 8
(Phases 6, 7 both depend on Phase 5; they can execute in either order)

| Phase | Milestone | Plans Complete | Status | Completed |
|-------|-----------|----------------|--------|-----------|
| 1-4. Foundation-Deployment | v1.0 | 8/8 | Complete | 2026-03-22 |
| 5. Hero & Design Polish | 2/2 | Complete   | 2026-03-23 | - |
| 6. Publications Navigation | 1/1 | Complete   | 2026-03-23 | - |
| 7. CV Timeline Layout | v1.1 | 1/1 | Complete | 2026-03-23 |
| 8. Data Repository Links | 2/2 | Complete   | 2026-03-23 | 2026-03-23 |
