# Academic Portfolio Website

## What This Is

A personal academic website for Robert J. McGrath, Associate Professor at George Mason University's Schar School of Policy and Government. The site showcases 26 publications (with CrossRef-verified DOIs and plain-language summaries), a browser-viewable CV, and professional contact information. Built with Quarto and hosted on GitHub Pages with a Distill.pub-inspired warm neutral design.

## Core Value

Visitors can quickly find and navigate to the author's scholarly publications and data work, presented in a way that's credible to academics and accessible to everyone.

## Requirements

### Validated

- About/bio page with research interests and background — v1.0
- Publications page linking to journal articles, book chapters, working papers — v1.0
- Data links integrated into publications (Dataverse cross-links on 3 papers) — v1.0
- CV page viewable in browser and downloadable as PDF — v1.0
- Contact page with email, office address, and professional profile links — v1.0
- Modern academic aesthetic — Distill.pub-inspired warm neutrals, Source Serif 4 + DM Sans — v1.0
- Free hosting on GitHub Pages — v1.0
- Responsive design works on mobile and desktop — v1.0
- Plain-language summaries on all 26 publications — v1.0

### Active

- [ ] Landing page hero redesign — shortened subtitle, Director info separated
- [ ] Publications collapsible sections by type and year, most recent expanded by default
- [ ] CV page timeline-style layout with better section spacing and entry formatting
- [ ] General design polish — typography, spacing, colors across all pages
- [ ] Deeper Dataverse/ICPSR data link search for remaining publications
- [ ] Custom domain with HTTPS (domain not yet purchased — deferred to v1.2)
- [ ] PDF self-hosting (author-accepted manuscripts — deferred to v1.2)

## Current Milestone: v1.1 Polish & Data

**Goal:** Refine the site's visual quality and expand data repository links

**Target features:**
- Landing page hero redesign (shortened subtitle + Director info)
- Collapsible publications sections (by type, then year)
- Timeline-style CV layout
- General typography/spacing/color polish
- Deeper data repository link search

### Out of Scope

- Blog/writing section — not requested for v1
- Interactive data visualizations hosted on-site — data work links to external platforms
- CMS or admin panel — static site, content managed via code/files
- User accounts or authentication — public-facing read-only site
- Comment sections or contact forms — email link is sufficient
- Analytics / visitor tracking — privacy implications
- Google Scholar auto-sync — unofficial API is brittle

## Context

- Site live at https://robert-mcgrath.github.io/ — all 4 pages functional
- 1,008 lines of source code (Quarto YAML/QMD/SCSS)
- Tech stack: Quarto 1.9.36 + GitHub Pages, cosmo base theme + custom.scss
- 26 publications in publications.yml (single source of truth), 22 with DOIs, 3 with Dataverse [Data] buttons
- CV parsed from RJM-CV-v.oct25.pdf into 4 HTML sections
- Dual audience: academic peers (APSA citations, DOI links) and general public (plain-language summaries)

## Constraints

- **Budget**: Free hosting (GitHub Pages); custom domain is acceptable cost when purchased
- **Maintenance**: YAML-driven publications — easy to add entries without deep technical knowledge
- **Performance**: Static site — fast load times, no server dependency
- **Accessibility**: Must work for both technical and non-technical audiences

## Key Decisions

| Decision | Rationale | Outcome |
|----------|-----------|---------|
| Quarto + GitHub Pages | Free, fast, version-controlled, academic ecosystem | ✓ Good |
| Link to external data platforms | Data on Dataverse/ICPSR; no need to duplicate | ✓ Good |
| Distill.pub warm neutrals design | User's aesthetic preference; scholarly but approachable | ✓ Good |
| YAML single source of truth | publications.yml reusable across pages; easy to maintain | ✓ Good |
| APSA citation format | Standard for political science; credible to field | ✓ Good |
| CrossRef API for DOI verification | AI-generated DOIs were all wrong; API lookup is mandatory | ✓ Good |
| mailto: contact, no form | Keeps GitHub Pages viable; no server dependency | ✓ Good |
| Custom domain deferred | Domain not purchased; site works at github.io URL | — Pending |

---
*Last updated: 2026-03-22 after v1.1 milestone start*
