# Project Research Summary

**Project:** Personal academic portfolio website (social scientist)
**Domain:** Static academic portfolio — Distill.pub-inspired, publications-first
**Researched:** 2026-03-22
**Confidence:** HIGH

## Executive Summary

This is a content-forward static website for a social science academic with a dual audience: hiring committees and peer researchers on one hand, journalists and policymakers on the other. Research across all four domains converges on a single clear recommendation: use Quarto 1.9.36 as the static site generator, deploy to GitHub Pages (or Netlify if a private repo or contact form is needed), and structure all content in Markdown and YAML files from day one. Quarto is the current state of the art for academic static sites because it provides first-class academic primitives (publications listings via YAML, about-page templates, citation rendering, Font Awesome icons) without requiring Node.js, Ruby, or any dependency management beyond the Quarto CLI binary itself.

The recommended approach is to build in strict dependency order: base layout and global CSS first, then the About/Home page as a pipeline validation, then publications and data projects, then CV, then contact, with deployment wired only once content is stable. The Distill.pub aesthetic — narrow centered column, generous margins, rich type scale using Source Serif 4 and DM Sans — should be established in a single `custom.scss` file during the foundation phase rather than retrofitted later. Every content section should be driven by structured YAML or Markdown frontmatter, not prose hardcoded into templates.

The two most significant risks are structural rather than technical: (1) the CV PDF and website publications list will silently diverge unless a single source of truth is established before any content is entered, and (2) the site will serve neither audience well if the home page defaults to academic jargon. Both risks are fully preventable but only if addressed in the content architecture phase, before writing begins. Over-engineering the tool selection is a third named risk — the technology decision should be timeboxed and a real page with real content should be live at the end of the first work session.

## Key Findings

### Recommended Stack

Quarto 1.9.36 is the dominant tool for academic portfolio sites in 2025–2026 and is the clear recommendation. It ships with Pandoc, Bootstrap 5.3 SASS variables, Font Awesome 6, and a native `quarto publish` command that deploys directly to GitHub Pages or Netlify. No Ruby, no npm, no Node version manager required — the single binary install eliminates the dependency-management friction that makes Jekyll/al-folio and Hugo/Hugo Blox painful for solo maintainers. The Distill.pub aesthetic is achievable through a single `custom.scss` file using Bootstrap SASS variables without touching HTML.

**Core technologies:**
- **Quarto 1.9.36:** Static site generator and publishing framework — purpose-built for academic publishing; handles publications listings, about-page templates, citations, and theming natively
- **GitHub Pages:** Free static hosting — zero cost, no bandwidth quota for pre-built sites, native `quarto publish gh-pages` support; requires public repo
- **Netlify (alternative):** Free hosting with form handling — prefer over GitHub Pages if repo must stay private, if deploy previews are wanted, or if a contact form is needed
- **SCSS via Quarto/Bootstrap 5.3:** Theming — single `custom.scss` achieves Distill.pub aesthetic using 1,400+ Bootstrap SASS variables
- **Source Serif 4 + DM Sans (Google Fonts):** Typography — variable-weight serif for body text, clean sans for UI; closest Google Fonts match to Distill.pub's own typography

### Expected Features

The feature research distinguishes clearly between what hiring committees and journalists require at launch versus what adds value incrementally.

**Must have (table stakes — launch blockers):**
- About/bio page with professional photo — first stop for every visitor; missing = incomplete
- Publications list grouped by type (articles, chapters, working papers) with DOI/PDF links — primary reason most visitors arrive
- Data projects page with external repository links (Dataverse, ICPSR, OSF DOIs) — first-class output, differentiates this researcher from typical academic sites
- CV page with both HTML view and PDF download — search committees require this
- Contact page with email and professional profile links (ORCID, Google Scholar) — journalist and collaborator pathway
- Responsive design, mobile and desktop — non-negotiable for modern credibility
- Distill.pub-inspired typography — establishes the visual identity; must be decided upfront, not retrofitted

**Should have (add after core is live — v1.x):**
- Working papers / preprints subsection — signals active pipeline to hiring committees
- Plain-language research summaries alongside journal abstracts — serves the journalist/policymaker audience explicitly; key to the dual-audience goal
- Media mentions section — reduces friction for journalist outreach once 3+ credible mentions exist

**Defer (v2+):**
- Speaking engagements page — low priority unless actively seeking invitations
- Teaching page with syllabi — out of scope unless students are a target audience
- Blog/writing section — high maintenance burden; an abandoned blog signals neglect; only add with committed publication cadence

**Anti-features to avoid permanently:**
- Automatically synced publications from Google Scholar API (unofficial, rate-limited, brittle)
- Hosted interactive data visualizations (unnecessary duplication; data lives on Dataverse/ICPSR)
- Comment sections, user accounts, CMS/admin panel (adds server dependency and complexity a static site solves)
- Social media feed embeds (third-party scripts slow load; feeds break)

### Architecture Approach

The architecture is a pure static site: Markdown and YAML content files feed into Quarto's build layer at deploy time, producing flat HTML files served directly from a CDN with no runtime server, database, or API calls. The key structural insight is to separate content (`.md` files with YAML frontmatter), structured data (`*.yml` data files for navigation, CV, and social links), templates (Quarto layouts), and static assets (images, PDF) into distinct directories from the start — this separation makes content updates possible without touching templates, and makes structured data reusable across pages.

**Major components:**
1. **Base layout + global CSS** — HTML shell with nav and footer; Distill-inspired column system (`l-body`, `l-middle`, `l-page` classes); inherited by every page; must be correct before any content page is built
2. **Content collections** — One `.md` file per publication or data project, YAML frontmatter carrying typed metadata (title, year, venue, DOI, PDF URL, type); the generator reads frontmatter as structured data and renders list pages automatically
3. **YAML data files** — Structured data for navigation order, social profile links, and optionally CV entries; changing a nav item or social link requires editing one file, not touching any template
4. **Static assets passthrough** — CV PDF, headshot, and any paper PDFs committed directly to the repo and served as-is; these are not processed by the generator
5. **CI/CD pipeline** — `quarto publish gh-pages` or GitHub Actions deploy step; wired only after content is stable; rollback is `git revert`

**Build order dictated by architecture:**
Base layout → Global CSS → About/Home (pipeline validation) → Publications → Data Projects → CV → Contact → Deployment

### Critical Pitfalls

1. **CV / publications divergence** — Designate a single YAML source of truth for publication metadata before entering any content; derive both the publications page and the CV from it. Fixing this after the fact costs a full audit of both assets. Address in the content architecture phase.

2. **Dual audience tone collapse** — Design separate entry points: the home page hero section in plain language for the public, the About page for academic depth, and a one-sentence lay summary per publication. Do not attempt to write one bio that serves both audiences simultaneously. Address in the content writing phase.

3. **Over-engineering the build** — Timebox the technology decision. The first phase ends when a real page with real content is live — not when infrastructure scaffolding is complete. Quarto's native academic primitives eliminate most custom configuration needs; resist the urge to optimize themes before content exists.

4. **Custom domain SSL failure** — Configure all DNS records first (four apex A records + www CNAME), wait the full 24–48 hours for propagation, then enable HTTPS enforcement. Test both `https://yourdomain.com` and `https://www.yourdomain.com` from a separate device before announcing the URL.

5. **Publications page as data dump** — Design the publications page schema (categories, sort order, required metadata fields) before adding any entries. A flat copy-paste from a CV document — unsorted, unlinked, uncategorized — is worse than nothing for both audiences.

## Implications for Roadmap

Based on the combined research, a 4-phase structure is recommended. The architecture research's explicit build-order dependency graph, the pitfalls' phase-to-prevention mapping, and the features' MVP definition all converge on the same ordering.

### Phase 1: Foundation and Infrastructure

**Rationale:** Every subsequent page inherits the base layout and CSS. Building content before the shell is correct means rebuilding it twice. The pitfalls research flags over-engineering as the primary risk for this phase — the deliverable is a working pipeline with one real page live, not a perfect design system.

**Delivers:** Quarto project initialized; base layout (nav, footer, head); global CSS with Distill-inspired column system and typography (Source Serif 4, DM Sans); About/Home page with real content (bio, research interests, headshot) live on GitHub Pages or Netlify; custom domain configured with HTTPS verified.

**Addresses:** About/bio page with professional photo; research interests on homepage; navigation structure (5 items); responsive baseline.

**Avoids:** Over-engineering the build (real content live at end of phase, not infrastructure skeleton); custom domain SSL failure (DNS + HTTPS configuration as a hard gate before Phase 2).

**Research flag:** Standard patterns — Quarto project setup and `quarto publish gh-pages` are well-documented; no additional research needed.

### Phase 2: Publications and Data Content

**Rationale:** Publications and data projects are the highest-value sections for both audience types and have the most structural dependencies. The content architecture (YAML schema, publication categories, single source of truth) must be established at the start of this phase, before any entries are added, to avoid both the CV divergence pitfall and the publications-as-data-dump pitfall.

**Delivers:** Publications YAML schema defined; publications page with entries grouped by type (journal articles, book chapters, working papers) in reverse chronological order with DOI/PDF links; data projects page with Dataverse/ICPSR links; publication card and project card components reusing the base layout; mobile tested per-page before phase closes.

**Addresses:** Publications list (P1); data projects page (P1); working papers subsection (P2, can be included here as a category); cross-linking datasets to related papers.

**Avoids:** Publications page as data dump (schema defined before entries); CV / publications divergence (YAML file established as single source of truth here); hotlinking to publisher PDFs (use DOI + preprint links).

**Research flag:** Standard patterns — Quarto listings with YAML data files are well-documented; content collection with typed frontmatter is the established pattern. No additional research needed.

### Phase 3: CV and Contact

**Rationale:** CV depends on the publications schema established in Phase 2 — it reuses the same structured data. Contact is the simplest page and depends only on the base layout. Grouping them avoids a separate micro-phase.

**Delivers:** CV page with HTML view and PDF download button; CV PDF committed to repo alongside its source document; contact page with email, ORCID, Google Scholar links, and departmental address; Google Scholar citation meta tags added to publication pages.

**Addresses:** CV page with PDF download (P1); contact page with profile links (P1); Google Scholar discoverability (integration gotcha from pitfalls research).

**Avoids:** CV-only-as-PDF-link UX pitfall (HTML view required, PDF is secondary); stale CV PDF (source document in repo, deploy checklist item added).

**Research flag:** Standard patterns — CV page and contact page are well-documented Quarto primitives. The Google Scholar citation meta tags are a minor integration task; Quarto's built-in citation metadata handling should cover it without custom code.

### Phase 4: QA, Polish, and Launch

**Rationale:** The pitfalls research identifies a "looks done but isn't" class of failures that are invisible during development but immediately apparent to hiring committees and journalists. A dedicated QA phase prevents launching with dead links, mismatched CV and publications data, mobile breakage, or SSL failures.

**Delivers:** Full link check (all DOIs, Dataverse/ICPSR links, PDF links verified from logged-out browser on separate network); CV PDF cross-checked against publications page; both domain variants HTTPS-verified; mobile layout tested on a real device for every page; custom 404 page configured; font-display swap confirmed to prevent FOIT; headshot compressed to ≤150 KB; "looks done but isn't" checklist completed and signed off.

**Addresses:** All v1 features validated; plain-language research summaries if not already added (P2); media mentions placeholder if applicable.

**Avoids:** Stale external links at launch; mobile layout breakage discovered post-announcement; SSL failure on the day the URL is shared; unoptimized profile photo causing slow first paint.

**Research flag:** Standard patterns — link checking tools (`lychee`, Broken Link Checker) and mobile testing are well-documented. No additional research needed.

### Phase Ordering Rationale

- **Base layout and CSS before any content page:** Every page inherits the shell; correcting the layout after content is built doubles the work.
- **About/Home before publications:** It validates the full authoring → build → browser pipeline with the simplest content before adding structured data complexity.
- **Publications schema before CV:** The CV reuses publication data; establishing the schema in Phase 2 means CV generation in Phase 3 is additive, not a structural decision.
- **Deployment wired in Phase 1, not Phase 4:** `quarto publish gh-pages` is used in Phase 1 to validate the pipeline end-to-end; Phase 4 is about QA and content verification, not first deployment.
- **All v1.x features (working papers, lay summaries, media mentions) targeted for Phase 2–3:** They are low-complexity additions that fit naturally alongside their parent sections.

### Research Flags

Phases with standard patterns (additional research-phase not needed):
- **Phase 1:** Quarto project setup and GitHub Pages deployment are thoroughly documented in official Quarto docs.
- **Phase 2:** Content collections with typed YAML frontmatter are the established Quarto pattern; publications listings are a native feature.
- **Phase 3:** CV and contact pages are standard Quarto about-page and listing features; Google Scholar meta tags are a one-line addition.
- **Phase 4:** QA procedures and link-checking tools are standard; no novel integration work.

No phase in this project requires a `research-phase` sprint. The domain is well-documented, the toolchain is mature, and the primary complexity is content architecture (addressed in Phase 2) rather than technical integration.

## Confidence Assessment

| Area | Confidence | Notes |
|------|------------|-------|
| Stack | HIGH | Quarto 1.9.36 verified against official release page (2026-03-19); GitHub Pages and Netlify pricing verified against current docs; al-folio alternative verified at v0.14.7 with 14.7k stars |
| Features | HIGH | Cross-referenced against Berkeley Townsend Center, The Academic Designer 2025 contest winners, Elsevier guide, Rice University guide, and multiple academic template repositories; dual-audience goal grounded in PROJECT.md |
| Architecture | HIGH | Distill.pub column system verified against official guide; content collection patterns verified against Quarto and Astro docs; build order derived from dependency analysis, not speculation |
| Pitfalls | HIGH (structural), MEDIUM (Quarto-specific) | Structural and content pitfalls (CV divergence, tone collapse, data dump) have strong source support; Quarto-specific technical pitfalls (output-dir misconfiguration) rely on practitioner accounts rather than official docs |

**Overall confidence:** HIGH

### Gaps to Address

- **CV source format decision:** Research recommends a YAML single source of truth for publications, but the actual format of the CV source document (LaTeX, Word, Google Doc) depends on the researcher's existing workflow. This should be the first question resolved in Phase 2 before any schema design.

- **Contact form decision:** If a mailto: link is insufficient and a contact form is wanted, the hosting platform choice between GitHub Pages and Netlify needs to be finalized in Phase 1 (Netlify supports forms natively; GitHub Pages does not). Research documents both paths; the decision requires knowing the researcher's preference.

- **Quarto output-dir configuration for GitHub Pages:** The pitfalls research flags a common misconfiguration (`output-dir: docs` required in `_quarto.yml` when using GitHub Pages' `docs/` folder method). Verify the correct configuration against the current Quarto GitHub Pages docs at project setup time, as this detail may differ between Quarto versions.

- **Google Scholar citation meta tags:** Quarto's built-in citation metadata handling may cover this automatically; if not, manual `<meta>` tags are needed per publication page. Verify against Quarto docs during Phase 3.

## Sources

### Primary (HIGH confidence)
- Quarto official docs (quarto.org) — v1.9.36 release, theming, listings, about pages, publish commands
- GitHub Docs — GitHub Pages custom domain SSL troubleshooting
- Distill.pub — official column layout system (`.l-body`, `.l-middle`, `.l-page` classes)
- al-folio GitHub repo (github.com/alshedivat/al-folio) — v0.14.7 academic Jekyll theme structure
- Netlify pricing page — free tier bandwidth and build minutes
- Google Fonts — Source Serif 4 and DM Sans variable-weight font specifications

### Secondary (MEDIUM confidence)
- Berkeley Townsend Center — academic website best practices
- The Academic Designer — 35 page ideas and 2025 contest winners
- Drew Dimmery — Quarto academic website practitioner build notes
- eScholarship / Google Scholar — optimizing for Scholar indexing
- Pascal Michaillat minimalist Hugo template — content-type organization patterns
- CloudCannon — static site generator comparison for content sites
- WebSearch results on academic SSG usage patterns 2025

### Tertiary (LOW confidence / inference)
- Hugo Blox discourse thread — compatibility failures on Hugo 0.127+ (community reports, not official docs)
- Quarto-specific pitfalls from practitioner accounts rather than official documentation

---
*Research completed: 2026-03-22*
*Ready for roadmap: yes*
