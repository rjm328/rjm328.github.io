---
phase: 05-hero-design-polish
plan: 02
subsystem: ui
tags: [scss, typography, color-palette, spacing, quarto, github-pages]

# Dependency graph
requires:
  - phase: 05-hero-design-polish-01
    provides: "Hero subtitle redesign and Director line placement in trestles header"
provides:
  - "Darkened body/link palette for improved WCAG contrast against cream background"
  - "Gold (#C4813D) h2 underlines sitewide for consistent accent usage"
  - "Tightened spacing across pub entries, CV sections, and paragraphs (30-40% reduction)"
  - "Refined heading hierarchy: h1 1.75rem > h2 1.25rem > h3 1.05rem"
  - "Reduced line-height to 1.55 for Distill.pub-style information density"
affects: ["06-publications-data", "07-analytics", "08-final-qa"]

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "Gold accent extended from border-only use to h2 underlines sitewide"
    - "SCSS spacing tightened by ~35% across all component classes"
    - "Heading scale set as explicit rem values overriding Bootstrap cosmo defaults"

key-files:
  created: []
  modified:
    - "custom.scss"

key-decisions:
  - "Body text darkened to #2D2926 (was #3D3632) — passes WCAG AA against cream #FAF8F5"
  - "Link color darkened to #7A4F30 (was #8B5E3C) — improved readability, maintains warm terracotta character"
  - "Gold h2 border-bottom: 2px solid #C4813D — extends accent from working-papers border to all section headings"
  - "One fix round required: initial Director line placement in index.qmd body was rejected; moved to trestles subtitle header area (commit 9089737)"

patterns-established:
  - "SCSS rules: comment each block with phase tag (/* Phase 5 DSGN-04 */) for future traceability"
  - "Heading scale: explicit rem overrides in custom.scss, not Bootstrap defaults"

requirements-completed: [DSGN-04]

# Metrics
duration: ~45min
completed: 2026-03-22
---

# Phase 5 Plan 02: Typography & Spacing Polish Summary

**Darkened palette (#2D2926 body, #7A4F30 links), gold h2 underlines sitewide, and 30-40% spacing reduction for Distill.pub-style information density**

## Performance

- **Duration:** ~45 min (including one fix round after user review)
- **Started:** 2026-03-22
- **Completed:** 2026-03-22
- **Tasks:** 3 (2 auto, 1 checkpoint)
- **Files modified:** 1 (custom.scss)

## Accomplishments

- Darkened body text to #2D2926 and links to #7A4F30 for improved readability against cream background
- Extended gold accent (#C4813D) from working-papers border to h2 headings across all four pages
- Tightened pub-entry from 2rem/1.5rem to 1.25rem/1rem, cv-section from 2.5rem/1.5rem to 1.5rem/1rem
- Set heading hierarchy to 1.75rem > 1.25rem > 1.05rem, line-height to 1.55, paragraph margin to 0.75rem
- Fixed Director line placement (moved from body content into trestles subtitle header) after user rejected initial position
- Deployed to GitHub Pages via manual git push to gh-pages branch

## Task Commits

Each task was committed atomically:

1. **Task 1: Improve palette contrast and extend gold accent** - `893bc22` (feat)
2. **Task 2: Tighten spacing and refine heading hierarchy sitewide** - `33558dd` (feat)
3. **Task 3 fix: Move Director line into trestles header, reduce subtitle font size** - `9089737` (fix)

**Plan metadata:** (this commit — docs: complete plan)

## Files Created/Modified

- `custom.scss` — Updated `scss:defaults` (3 color variables) and `scss:rules` (h2 with gold border, heading scale, spacing tightening, line-height, paragraph margins)

## Decisions Made

- Used #2D2926 for body text (darker than the existing #3D3632) to pass WCAG AA contrast ratio against cream #FAF8F5
- Gold h2 underline (2px solid #C4813D, 0.3rem padding-bottom) chosen over alternative decorations to unify the gold accent system established in Plan 01
- Director line placement required a fix round: first attempt placed it in index.qmd body text (correct semantic location), but user rejected visual result; moved into trestles subtitle area in header with font-size 0.88rem to prevent wrapping

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 1 - Bug] Director line placement rejected by user at checkpoint; moved to trestles header**
- **Found during:** Task 3 (visual review checkpoint)
- **Issue:** Director line appeared in body content area, visually separated from hero name/subtitle
- **Fix:** Moved Director line into the subtitle field mechanism in `index.qmd` and reduced subtitle font-size to 0.88rem to prevent wrapping on narrow viewports
- **Files modified:** `index.qmd`, `custom.scss`
- **Verification:** User approved after fix
- **Committed in:** `9089737` (fix commit between checkpoint and resume)

---

**Total deviations:** 1 auto-fixed (1 Rule 1 bug — placement rejection requiring adjustment)
**Impact on plan:** Fix was necessary to meet user's visual approval. No scope creep.

## Issues Encountered

- `quarto publish gh-pages --no-prompt` failed with "Multiple previous publishes exist" — caused by a stale local `gh-pages` branch alongside the remote. Resolved by deleting the local branch and pushing the rendered `_site/` directory directly via git worktree.

## User Setup Required

None — no external service configuration required. Site deployed to https://rjm328.github.io/

## Next Phase Readiness

- All four pages now have consistent gold h2 underlines, darker readable text, and tighter spacing
- Design system is stable; Phase 6 (publications/data work) can proceed without SCSS conflicts
- No blockers

---
*Phase: 05-hero-design-polish*
*Completed: 2026-03-22*
