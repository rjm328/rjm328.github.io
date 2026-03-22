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

## Cross-Milestone Trends

### Process Evolution

| Milestone | Sessions | Phases | Key Change |
|-----------|----------|--------|------------|
| v1.0 | 1 | 4 | Initial process — DOI verification lesson established |

### Cumulative Quality

| Milestone | Tests | Coverage | Zero-Dep Additions |
|-----------|-------|----------|-------------------|
| v1.0 | N/A (static site) | 16/16 requirements | 0 (Quarto built-in) |

### Top Lessons (Verified Across Milestones)

1. AI-generated identifiers (DOIs, URLs) must be verified against authoritative APIs before use
