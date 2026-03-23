# Academic Portfolio Website

## What This Is

A personal academic website for Robert J. McGrath, Associate Professor at George Mason University's Schar School of Policy and Government. The site showcases 26 publications with collapsible navigation by type and year, CrossRef-verified DOIs, plain-language summaries, 6 Dataverse data links, a timeline-style CV, and professional contact information. Built with Quarto and hosted on GitHub Pages with a Distill.pub-inspired warm neutral design.

## Core Value

Visitors can quickly find and navigate to the author's scholarly publications and data work, presented in a way that's credible to academics and accessible to everyone.

## Requirements

### Validated

- About/bio page with research interests and background — v1.0
- Publications page linking to journal articles, book chapters, working papers — v1.0
- CV page viewable in browser and downloadable as PDF — v1.0
- Contact page with email, office address, and professional profile links — v1.0
- Free hosting on GitHub Pages — v1.0
- Responsive design works on mobile and desktop — v1.0
- Plain-language summaries on all 26 publications — v1.0
- Hero subtitle redesigned with Director line separated — v1.1
- Collapsible publications sections by type and year — v1.1
- Timeline-style CV layout (dates left, content right) — v1.1
- Tighter Distill.pub-inspired typography, improved palette contrast — v1.1
- 6 Dataverse data links discovered and integrated — v1.1
- Search navigates to collapsed publication entries — v1.1

### Active

- [ ] Custom domain with HTTPS (domain not yet purchased)
- [ ] PDF self-hosting (author-accepted manuscripts)

### Out of Scope

- Blog/writing section — not requested
- Interactive data visualizations hosted on-site — data work links to external platforms
- CMS or admin panel — static site, content managed via code/files
- User accounts or authentication — public-facing read-only site
- Comment sections or contact forms — email link is sufficient
- Analytics / visitor tracking — privacy implications
- Google Scholar auto-sync — unofficial API is brittle

## Context

- Site live at https://robert-mcgrath.github.io/ — all 4 pages functional
- 1,479 lines of source code (Quarto YAML/QMD/SCSS)
- Tech stack: Quarto 1.9.36 + GitHub Pages, cosmo base theme + custom.scss
- 26 publications in publications.yml, 22 with DOIs, 6 with Dataverse [Data] buttons
- Collapsible publications: HTML5 details/summary, zero JavaScript dependency
- CV timeline layout: CSS Grid (120px date column + 1fr content)
- GitHub username: robert-mcgrath (changed from rjm328 during v1.1)

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
| HTML5 details/summary for collapsible sections | Zero JS, native browser support, works in Chrome/Firefox/Safari | ✓ Good |
| CSS Grid for CV timeline | Clean two-column layout, mobile-responsive via breakpoint | ✓ Good |
| Tighter spacing (Distill.pub reference) | Information-dense, not magazine-style whitespace | ✓ Good |
| Custom domain deferred | Domain not purchased; site works at github.io URL | — Pending |

---
*Last updated: 2026-03-23 after v1.1 milestone*
