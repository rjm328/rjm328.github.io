# Architecture Research

**Domain:** Static academic portfolio website
**Researched:** 2026-03-22
**Confidence:** HIGH

## Standard Architecture

### System Overview

```
┌─────────────────────────────────────────────────────────────────┐
│                        AUTHORING LAYER                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐          │
│  │  Markdown    │  │  YAML/JSON   │  │  Static      │          │
│  │  Content     │  │  Data Files  │  │  Assets      │          │
│  │  (pages,     │  │  (cv, links, │  │  (images,    │          │
│  │  posts)      │  │  metadata)   │  │  PDFs, fonts)│          │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘          │
└─────────┼────────────────┼────────────────┼────────────────────┘
          │                │                │
┌─────────▼────────────────▼────────────────▼────────────────────┐
│                        BUILD LAYER                              │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │              Static Site Generator                       │   │
│  │   (reads content + templates → outputs HTML/CSS/JS)      │   │
│  └──────────────────────────┬───────────────────────────────┘   │
└─────────────────────────────┼───────────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────────┐
│                        DELIVERY LAYER                           │
│  ┌──────────────────────────────────────────────────────────┐   │
│  │              CDN / Static Hosting                        │   │
│  │         (GitHub Pages or Netlify free tier)              │   │
│  └──────────────────────────┬───────────────────────────────┘   │
└─────────────────────────────┼───────────────────────────────────┘
                              │
┌─────────────────────────────▼───────────────────────────────────┐
│                        BROWSER LAYER                            │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐        │
│  │  Home/   │  │ Publica- │  │  Data    │  │  CV /    │        │
│  │  About   │  │  tions   │  │  Projects│  │  Contact │        │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘        │
└─────────────────────────────────────────────────────────────────┘
```

No runtime server. No database. No API calls at page load. All pages are HTML files produced once at build time and served directly from a CDN.

### Component Responsibilities

| Component | Responsibility | Typical Implementation |
|-----------|----------------|------------------------|
| Content files | Author-facing source of truth for all page text | Markdown files with YAML frontmatter |
| Data files | Structured data that drives lists (CV entries, links) | YAML or JSON files in `/data/` |
| Templates / layouts | Page structure and rendering logic | Nunjucks, Liquid, or framework components |
| Static assets | Images, downloadable PDF of CV, fonts | Files in `/public/` or `/static/` |
| Site generator config | Build settings, site metadata, navigation | Single config file (e.g., `_config.yml`, `astro.config.mjs`) |
| Hosting config | Deploy hooks, redirects, custom domain | `netlify.toml` or GitHub Actions workflow YAML |
| Navigation component | Persistent header with links to all major sections | Shared layout partial |
| Footer component | Contact links, institutional affiliation, copyright | Shared layout partial |

## Recommended Project Structure

This structure assumes Eleventy (11ty) or Astro — the two strongest choices for this project. The conventions differ slightly by tool but the logical organization is the same.

```
/
├── src/
│   ├── content/              # All authored content
│   │   ├── about.md          # About / bio page
│   │   ├── publications/     # One .md file per publication (or single list file)
│   │   │   ├── paper-one.md
│   │   │   └── paper-two.md
│   │   ├── data-projects/    # One .md file per data project
│   │   │   └── dataset-one.md
│   │   └── cv.md             # CV page (or generated from data file)
│   │
│   ├── data/                 # Structured data (non-narrative)
│   │   ├── navigation.yaml   # Nav items and order
│   │   ├── social.yaml       # External profile links (Scholar, ORCID, etc.)
│   │   └── cv.yaml           # CV data in structured form (optional)
│   │
│   ├── layouts/              # Page templates
│   │   ├── base.njk          # HTML shell, head, nav, footer
│   │   ├── page.njk          # Generic content page layout
│   │   └── publication.njk   # Publication detail layout (if using individual pages)
│   │
│   ├── includes/             # Reusable partials
│   │   ├── nav.njk           # Navigation bar
│   │   ├── footer.njk        # Footer
│   │   ├── pub-card.njk      # Publication list item
│   │   └── project-card.njk  # Data project list item
│   │
│   ├── styles/               # CSS / SCSS
│   │   ├── global.css        # Reset, base typography, variables
│   │   ├── layout.css        # Grid and column system (Distill-inspired)
│   │   └── components.css    # Cards, nav, footer, etc.
│   │
│   └── assets/               # Static files passed through as-is
│       ├── images/           # Profile photo, project thumbnails
│       ├── cv.pdf            # Downloadable CV
│       └── fonts/            # Self-hosted web fonts (optional)
│
├── public/                   # (Astro) or _site/ (Eleventy) — build output, never edit
│
├── .github/
│   └── workflows/
│       └── deploy.yml        # CI/CD: build → deploy on push to main
│
├── netlify.toml              # (if Netlify) redirects, build command, publish dir
└── [eleventy.config.mjs | astro.config.mjs]   # Generator config
```

### Structure Rationale

- **`src/content/`:** All text the site owner will regularly edit lives here. Flat Markdown files are the least technical editing surface. Grouping publications and data projects as sub-collections lets the generator create filtered list pages automatically.
- **`src/data/`:** Separating structured data (navigation, social links) from narrative content means updating a link profile or reordering the nav never requires touching a layout file.
- **`src/layouts/` + `src/includes/`:** The `base` layout wraps every page (head, nav, footer). Specific layouts extend base for sections with different presentation needs (e.g., a two-column publications view). Partials (includes) are the smallest reusable pieces.
- **`src/styles/`:** Keeping the Distill-inspired column/grid system in its own file (`layout.css`) makes it easy to adjust globally without touching component-specific styles.
- **`assets/`:** The CV PDF lives here as a static passthrough. Profile photo and any thumbnails too. Nothing in this folder is processed by the generator.
- **`.github/workflows/`:** A single YAML file handles push-to-deploy. No separate CI service required for a site of this scale.

## Architectural Patterns

### Pattern 1: Content Collections with Typed Frontmatter

**What:** Each content type (publication, data project) is a collection of Markdown files. Each file's YAML frontmatter carries structured metadata (title, year, venue, DOI, external URL). The generator reads frontmatter as structured data, renders the body as HTML, and provides both to the template.

**When to use:** Any time a section displays a list of items with consistent fields — publications, data projects, CV entries.

**Trade-offs:** Authoring stays simple (edit a Markdown file). Adding a new publication is one file, not a database entry. The downside: no GUI; the site owner must be comfortable editing YAML and Markdown. For this project, that is an acceptable constraint.

**Example:**
```yaml
---
title: "Partisan Sorting and Policy Polarization in State Legislatures"
year: 2023
venue: "American Political Science Review"
type: journal-article
doi: "10.1017/S0003055423000123"
pdf_url: "/assets/papers/polarization-2023.pdf"
external_url: "https://doi.org/10.1017/S0003055423000123"
abstract: "We examine how partisan sorting..."
---

Full abstract or extended notes can go here as Markdown body.
```

### Pattern 2: Distill-Inspired Single-Column Layout with Margin Space

**What:** The main content area is a narrow, centered column (roughly 640-700px) with generous left/right margins. Margin space can hold asides, figure captions, or footnotes. Full-width breaks are available for special elements.

**When to use:** Every page on the site. This is the base layout inherited by all content.

**Trade-offs:** Highly readable on desktop; strong typographic credibility. Requires discipline to avoid "feature creep" that breaks the column constraint. Works well on mobile when the margins simply collapse to standard padding.

**Example layout classes (CSS):**
```css
/* Distill-inspired column system */
.l-body    { max-width: 648px; margin: 0 auto; }
.l-middle  { max-width: 816px; margin: 0 auto; }
.l-page    { max-width: 984px; margin: 0 auto; }
.l-gutter  { /* margin notes, asides */ }
```

### Pattern 3: Static Build with Git-Triggered Deployment

**What:** Content changes are committed to a Git repository. A push to the `main` branch triggers a build (via GitHub Actions or Netlify's built-in CI). The generator runs, produces HTML, and the output is deployed to the CDN. No manual FTP, no server access.

**When to use:** Always. This is the standard deployment architecture for static sites in 2025.

**Trade-offs:** Deployment is automated and reproducible. Rollback is `git revert`. The only complexity is the initial CI/CD setup, which is a one-time cost of ~30 minutes and well-documented for both platforms.

## Data Flow

### Authoring to Browser

```
Author edits Markdown file or YAML data file
    ↓
Git commit + push to main branch
    ↓
CI/CD trigger (GitHub Actions or Netlify)
    ↓
SSG build process:
  - Read all content files + data files
  - Merge frontmatter data with layout templates
  - Render Markdown body to HTML
  - Apply CSS and copy static assets
  - Output flat HTML files to /public or /_site
    ↓
Build output deployed to CDN (GitHub Pages or Netlify)
    ↓
Visitor requests page → CDN serves HTML file directly
    (no server-side processing, no database query)
```

### Content Rendering Flow (per publication)

```
publications/paper-one.md (Markdown + frontmatter)
    ↓ (parsed by SSG)
{ data: { title, year, venue, doi }, body: HTML }
    ↓ (injected into template)
publication.njk layout
    ↓ (wrapped by)
base.njk layout (adds nav, footer, head)
    ↓ (output)
/publications/paper-one/index.html (static file on CDN)
```

### Navigation Flow

```
data/navigation.yaml
    ↓ (read at build time)
nav.njk partial (renders link list)
    ↓ (included in)
base.njk layout
    ↓ (present on)
Every page on the site
```

### Key Data Flows

1. **Publication added:** Author creates new `.md` file in `src/content/publications/`, fills in frontmatter (title, year, DOI, venue), commits and pushes. Build runs. New publication appears on publications page and any homepage featured list automatically.
2. **CV updated:** Author edits `src/data/cv.yaml` (or the CV Markdown file) and pushes. The CV page re-renders with new content. The PDF version must be updated separately and re-committed to `src/assets/cv.pdf`.
3. **External link changed:** Author edits the relevant frontmatter field (e.g., `external_url`) in the appropriate content file and pushes. No template changes needed.

## Scaling Considerations

For a personal academic portfolio, "scaling" is not about traffic volume — it is about content volume and maintainability over time.

| Scale | Architecture Adjustments |
|-------|--------------------------|
| 0-50 publications | A single Markdown file listing all publications is sufficient. No individual publication pages needed. |
| 50-150 publications | Individual `.md` files per publication, auto-generated list page. Filtering by type (journal, working paper, book chapter) becomes useful. |
| 150+ publications | Add tag/category filtering, possibly a search index (Pagefind or similar, still static). Consider a structured data file (YAML) as the source of truth instead of individual files. |

### Scaling Priorities

1. **First friction point:** Manually maintaining publication order and metadata. Fix with consistent frontmatter schema and sorted collection queries in the generator.
2. **Second friction point:** Keeping the PDF CV in sync with the web CV. Fix with a single YAML source of truth that renders both the web page and a PDF template (or accept the manual update workflow explicitly).

## Anti-Patterns

### Anti-Pattern 1: Hardcoding Content in Templates

**What people do:** Write publication titles, project descriptions, and bio text directly into HTML/template files.
**Why it's wrong:** Every content update requires editing a template. Non-technical collaborators cannot update content. Separating content from presentation is the entire point of a static site generator.
**Do this instead:** All content lives in Markdown/YAML files. Templates contain only structure and logic, never narrative text.

### Anti-Pattern 2: Using a CMS or Database for a Two-Person Site

**What people do:** Install WordPress, a headless CMS, or a database-backed system to manage ~20 pages of content.
**Why it's wrong:** Introduces ongoing maintenance costs, security surface area, and hosting dependencies for a problem a flat Markdown directory solves completely.
**Do this instead:** Markdown files in Git. The Git history is your version control and audit log. A text editor is your CMS.

### Anti-Pattern 3: Client-Side Data Fetching for Static Content

**What people do:** Load publication data from a JSON API or external service at page load time using JavaScript fetch calls.
**Why it's wrong:** Introduces network dependency, flashes of missing content, and failure modes on slow connections. Destroys the performance and reliability advantages of static hosting.
**Do this instead:** Bake all data into HTML at build time. Publications are rendered server-side into HTML during the build. JavaScript is for progressive enhancement only (e.g., dark mode toggle).

### Anti-Pattern 4: One Giant Page with Anchor Links

**What people do:** Build a single long-scrolling HTML page with `#publications`, `#about`, `#contact` sections to avoid setting up proper routing.
**Why it's wrong:** Hurts SEO (publications aren't individually indexable), breaks sharing (no stable URL for a single paper), and makes deep linking impossible for hiring committees or journalists.
**Do this instead:** Separate pages for each major section, with clean URLs (`/publications/`, `/data/`, `/cv/`). Static site generators make this zero-cost.

### Anti-Pattern 5: Tight Coupling Between CV PDF and Web CV

**What people do:** Maintain two separate documents — one for the web and one PDF — that diverge over time because there is no single source of truth.
**Why it's wrong:** CV data drifts. One document becomes outdated. Visitors receive conflicting information.
**Do this instead:** Designate one canonical format (YAML data file, or a Markdown file) and either auto-generate the PDF from it (using Pandoc or a CI step) or establish a clear update convention where the CV PDF is the canonical source and the web page is updated whenever the PDF is.

## Integration Points

### External Services

| Service | Integration Pattern | Notes |
|---------|---------------------|-------|
| GitHub Pages | Git push to `gh-pages` branch or GitHub Actions deploy step | Free, reliable, requires `.github/workflows/deploy.yml` |
| Netlify | Connect repo; Netlify auto-builds on push | Easier setup than GitHub Pages; handles redirects and custom headers natively |
| Custom domain (DNS) | CNAME record pointing to GitHub Pages / Netlify CDN | One-time DNS configuration; both platforms document this well |
| Dataverse / ICPSR | Outbound links in data project frontmatter | No integration needed; these are `<a href>` links rendered at build time |
| Google Scholar | Outbound link in header/footer nav or About page | Static link only |
| ORCID | Outbound link; optionally add `<link rel="me">` for identity verification | One HTML tag in `<head>` |
| Pagefind (optional) | Static search index built as part of CI pipeline, zero runtime cost | Worth adding if publications list grows past ~50 items |

### Internal Boundaries

| Boundary | Communication | Notes |
|----------|---------------|-------|
| Content files → Templates | Build-time: SSG reads files, injects into templates | No runtime communication; all resolved during build |
| Data files → Navigation | Build-time: nav.yaml is read by base layout | Changing nav requires only editing one YAML file, not touching any template |
| Templates → CSS | Static: templates reference CSS class names | Changing a layout class name requires updating both template and CSS |
| Assets (cv.pdf) → CV page | Static link: `<a href="/assets/cv.pdf">` | PDF must be manually updated and re-committed; not auto-generated in v1 |
| Build output → CDN | Automated: CI/CD copies `/public` to hosting provider | Decoupled from authoring; deploy can be paused or rolled back independently |

## Suggested Build Order (Phase Dependencies)

Understanding the dependency graph prevents building components in the wrong order:

```
1. Base layout (nav + footer shell)
        ↓
2. Global CSS (typography, column system, variables)
        ↓
3. About / Home page      ←── First real content; validates layout works
        ↓
4. Publications page      ←── Requires content collection + pub-card component
        ↓
5. Data Projects page     ←── Same pattern as publications; reuses card component
        ↓
6. CV page                ←── Requires CV data structure; also provides PDF link
        ↓
7. Contact page           ←── Simplest page; just needs base layout
        ↓
8. Deployment pipeline    ←── Wire CI/CD only after content is stable enough to ship
```

Rationale:
- **Base layout first** because every page inherits it. Building a page before the shell is ready means rebuilding it twice.
- **CSS second** because layout bugs are easier to catch with real content on the page rather than placeholder text.
- **About/Home third** because it is the validation point — it proves the full pipeline (authoring → build → browser) works end to end before building additional sections.
- **Publications and Data Projects before CV** because these are the highest-value sections for both audience types; CV can be a placeholder in early phases.
- **Deployment last** because wiring CI/CD before content is stable creates noise (many deploy runs of unfinished pages).

## Sources

- Distill.pub layout system: [How to Create a Distill Article](https://distill.pub/guide/) — official guide documenting `.l-body`, `.l-middle`, `.l-page` column classes (HIGH confidence)
- al-folio Jekyll theme structure: [alshedivat/al-folio on GitHub](https://github.com/alshedivat/al-folio) — widely-used academic theme; inspected `_bibliography/`, `_pages/`, `_data/` conventions (HIGH confidence)
- Pascal Michaillat minimalist Hugo template: [pascalmichaillat.org/b/](https://pascalmichaillat.org/b/) — clean academic template showing content-type organization (HIGH confidence)
- Academic website page structure patterns: [35 Page Ideas for Your Academic Personal Website](https://theacademicdesigner.com/2025/35-page-ideas-for-your-academic-personal-website/) (MEDIUM confidence)
- Eleventy vs Astro for content sites: [CloudCannon comparison](https://cloudcannon.com/blog/eleventy-11ty-vs-astro/) (MEDIUM confidence)
- Static content collections with frontmatter: [Astro Markdown docs](https://docs.astro.build/en/guides/markdown-content/) (HIGH confidence)
- GitHub Pages vs Netlify deployment: [free-git-hosting.github.io comparison](https://free-git-hosting.github.io/github-vs-netlify/) (MEDIUM confidence)

---
*Architecture research for: Academic portfolio website (static, Distill.pub-inspired)*
*Researched: 2026-03-22*
