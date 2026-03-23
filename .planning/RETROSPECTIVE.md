# Project Retrospective

*A living document updated after each milestone. Lessons feed forward into future planning.*

## Milestone: v1.0 — Academic Portfolio Website

**Shipped:** 2026-03-22
**Phases:** 4 | **Plans:** 8 | **Sessions:** 1

### What Was Built
- Complete academic portfolio site live at https://rjm328.github.io/
- Publications page with 26 entries, 22 CrossRef-verified DOIs, 3 Dataverse [Data] buttons, plain-language summaries
- Browser-viewable CV with 4 sections (Education, Positions, Publications summary, Awards) and PDF download
- Contact page with email, office address, department affiliation, ORCID/Scholar/GitHub/LinkedIn
- Distill.pub-inspired warm neutral design (Source Serif 4, DM Sans, cream/terracotta/gold palette)

### What Worked
- YAML single source of truth for publications — clean separation of data from presentation
- Per-phase discuss/plan/execute/verify cycle caught issues early (DOI errors caught at Phase 2 checkpoint)
- Parallel plan execution in Wave 1 of Phase 3 (CV + Contact pages built simultaneously)
- CrossRef API for DOI verification — reliable, rate-limited, title-matching approach

### What Was Inefficient
- All 20 AI-generated DOIs in Phase 2 were wrong — required full correction pass via CrossRef API. Should have verified DOIs at creation time, not after deployment
- publications.qmd is static Markdown (not templated from YAML) — data_url changes in YAML required manual mirroring into .qmd. A Quarto shortcode or include pattern would avoid this
- Phase 3 completion status in ROADMAP.md showed "Planning complete" instead of "Complete" — minor state tracking gap

### Patterns Established
- CrossRef API (`api.crossref.org/works?query.title=...&query.author=...`) as mandatory DOI verification
- `.pub-buttons .btn-outline-secondary` terracotta button pattern reused across Publications, CV, and Contact pages
- `custom.scss` append-only pattern — new phases add rules, never modify existing ones
- CV PDF as authoritative source for data extraction (Claude reads PDF, user reviews output)

### Key Lessons
1. Never trust AI-generated DOIs — always verify via CrossRef API before publishing
2. Static Markdown pages that render from YAML data need a templating layer to stay in sync
3. The discuss-phase workflow is highly effective for capturing user preferences before planning
4. Phase 4 (QA) benefits from research that pre-verifies what it can — DOIs were already confirmed before execution

### Cost Observations
- Model mix: ~20% opus (orchestration), ~80% sonnet (research, planning, execution, verification)
- Sessions: 1 (entire v1.0 built in single session)
- Notable: Parallel agent execution in Phase 3 Wave 1 saved significant time

---

## Milestone: v1.1 — Polish & Data

**Shipped:** 2026-03-23
**Phases:** 4 | **Plans:** 6 | **Sessions:** 1

### What Was Built
- Hero subtitle redesigned (shortened + Director line separated in trestles header)
- Palette contrast improved (darker text/links), gold h2 underlines, tighter Distill-inspired spacing
- Collapsible publications by type and year (HTML5 details/summary, zero JS)
- Timeline-style CV layout (CSS Grid, dates left, content right)
- 3 new Dataverse deposits found and linked (total: 6 of 26 papers)
- Search-to-collapsed-section MutationObserver fix
- GitHub username updated rjm328 → robert-mcgrath

### What Worked
- Skipping research for a polish milestone — all tech decisions were straightforward CSS/HTML
- Single-plan phases (6, 7) were fast to plan and execute
- User checkpoints caught the Director line placement issue before it shipped
- Dataverse API search found deposits that v1.0's web search missed

### What Was Inefficient
- Director line initially placed in body text instead of trestles subtitle header — required a fix round at checkpoint
- publications.qmd static file problem persists — every data_url change requires editing both YAML and QMD
- Search fix required two iterations (hash-based approach didn't work, MutationObserver did)
- v1.0 ROADMAP.md showed Phase 7 as "Planned" even though Phase 3 was complete — state tracking still imperfect

### Patterns Established
- HTML5 details/summary for collapsible content — zero JS, native cross-browser
- CSS Grid for timeline layouts (120px date + 1fr content)
- MutationObserver for detecting Quarto search highlights in collapsed sections
- Inline HTML in Quarto YAML subtitle field for multi-line header content

### Key Lessons
1. Visual checkpoints are essential for design work — automated checks can't catch "this looks wrong"
2. The trestles template subtitle field accepts inline HTML — useful for structured header content
3. Quarto search and collapsed details elements don't play well together — requires custom JS
4. Dataverse API (`dataverse.harvard.edu/api/search`) is more reliable than web searches for finding deposits

### Cost Observations
- Model mix: ~20% opus (orchestration), ~80% sonnet (execution)
- Sessions: 1 (continued from v1.0 session)
- Notable: Skipping research saved significant time for a polish milestone

---

## Cross-Milestone Trends

### Process Evolution

| Milestone | Sessions | Phases | Key Change |
|-----------|----------|--------|------------|
| v1.0 | 1 | 4 | Initial process — DOI verification lesson established |
| v1.1 | 1 | 4 | Skipped research for polish; visual checkpoints critical for design work |

### Cumulative Quality

| Milestone | Tests | Coverage | Zero-Dep Additions |
|-----------|-------|----------|-------------------|
| v1.0 | N/A (static site) | 16/16 requirements | 0 (Quarto built-in) |
| v1.1 | N/A (static site) | 10/10 requirements | 0 (HTML5 details/summary, CSS Grid) |

### Top Lessons (Verified Across Milestones)

1. AI-generated identifiers (DOIs, URLs) must be verified against authoritative APIs before use
2. Visual checkpoints are essential — automated checks catch structure but not aesthetics
3. publications.qmd static file is a maintenance burden — both milestones hit sync issues between YAML and QMD
