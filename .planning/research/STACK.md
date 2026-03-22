# Stack Research

**Domain:** Personal academic portfolio website (social scientist)
**Researched:** 2026-03-22
**Confidence:** HIGH (core stack verified against official releases and community evidence)

## Recommended Stack

### Core Technologies

| Technology | Version | Purpose | Why Recommended |
|------------|---------|---------|-----------------|
| Quarto | 1.9.36 | Static site generator and publishing framework | Purpose-built for academic/scientific publishing; first-class support for publications lists via YAML, about pages, CV pages, citations; SCSS theming; outputs pure static HTML; `quarto publish` deploys directly to GitHub Pages or Netlify in one command. The dominant tool for academic portfolios in 2025-2026. |
| GitHub Pages | — | Free static hosting | Zero cost, permanent free tier with no bandwidth limits beyond repo size. Repository must be public on the free plan. Native support for custom domains via CNAME. No build-minute quota for pre-built sites. Pairs with `quarto publish gh-pages` for zero-config deployment. |
| Netlify (alternative hosting) | — | Free static hosting with form handling | 100 GB/month bandwidth, 300 build minutes/month. Better choice if the repo needs to stay private, if you want deploy previews, or if a contact form is needed. `quarto publish netlify` supported natively. |
| SCSS (via Quarto themes) | Bootstrap 5 SASS | Theming and Distill-inspired typography | Quarto exposes 1,400+ Bootstrap SASS variables, enabling precise control over fonts, spacing, and color. A single `custom.scss` file can achieve the Distill.pub aesthetic without touching HTML. |

### Supporting Libraries / Tools

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| Google Fonts — Source Serif 4 | latest | Body text serif, academic credibility | Use as `$font-family-serif` in SCSS for Distill-style long-form reading. Free, variable-weight, designed for text rendering on screens. |
| Google Fonts — DM Sans | latest | UI/navigation sans-serif | Use for navigation, labels, and code captions. Pairs cleanly with Source Serif 4. |
| Quarto `listings` (built-in) | — | Publications and data projects pages | Quarto's native listing feature renders a `publications.yml` or `projects.yml` data file as a formatted, filterable list. No plugin needed. Zero maintenance overhead. |
| Quarto `about` page (built-in) | — | Bio/homepage layout | Quarto ships five about-page templates (jolla, trestles, solana, marquee, broadside). `trestles` is the Distill-adjacent layout: sidebar photo + main content column. |
| Font Awesome (via Quarto) | bundled | Social/professional icons in contact/bio | Quarto bundles Font Awesome 6 automatically — no separate install needed. Use `{{< fa github >}}` shortcodes. |
| Pandoc citeproc (built-in) | bundled | Bibliography rendering | Quarto ships with Pandoc; `.bib` files or YAML front-matter handle citation formatting if needed. |

### Development Tools

| Tool | Purpose | Notes |
|------|---------|-------|
| Quarto CLI | Build, preview, publish | `quarto preview` runs a local dev server with hot reload. `quarto render` builds the static site. No Node.js or Ruby required — single binary install. |
| VS Code + Quarto extension | Editing | The official Quarto VS Code extension provides YAML completion, live preview, and syntax highlighting. RStudio is an equally valid alternative for R users. |
| Git + GitHub | Version control and source of truth | Deployment is `quarto publish gh-pages` from the CLI, which pushes the rendered `_site/` to a `gh-pages` branch automatically. |

## Installation

```bash
# 1. Install Quarto CLI (macOS — replaces any prior version)
brew install --cask quarto

# Verify
quarto --version
# Expected: 1.9.36

# 2. Create a new Quarto website project
quarto create project website my-academic-site

# 3. Preview locally
cd my-academic-site
quarto preview

# 4. Deploy to GitHub Pages (after creating the GitHub repo)
quarto publish gh-pages

# OR deploy to Netlify
quarto publish netlify
```

No npm, no Ruby, no bundler, no Node version manager required.

## Alternatives Considered

| Recommended | Alternative | When to Use Alternative |
|-------------|-------------|-------------------------|
| Quarto | al-folio (Jekyll) | al-folio (14.7k GitHub stars, v0.14.7) is the most popular academic Jekyll theme and is actively maintained. Prefer it if you need: automatic BibTeX-to-HTML publications via `jekyll-scholar`, a well-tested opinionated template, or if you are already comfortable with Ruby/Jekyll. The tradeoff: Ruby/Bundler dependency management adds friction; Hugo/Jekyll's templating is harder to customize than Quarto's SCSS + YAML approach. |
| Quarto | Hugo + Hugo Blox (formerly Wowchemy) | Hugo is significantly faster at build time, which matters for sites with hundreds of pages — not relevant here. Hugo Blox/Wowchemy was the dominant academic Hugo template for years but has accumulated breaking-change issues and a confusing rename history (Wowchemy → Hugo Blox). Maintenance burden is higher than Quarto for a solo maintainer. |
| Quarto | Astro 5 | Astro produces extremely fast sites and has good portfolio templates. Prefer it if you want maximum design freedom and are comfortable with JavaScript/HTML. Not recommended here: no built-in academic primitives (publications, citations, about pages), requires more front-end knowledge to maintain, and adds an npm dependency chain. |
| Quarto | R Markdown + distill (package) | The original Distill R package (`distill` on CRAN) reproduces the exact Distill.pub aesthetic. However, Posit has shifted development investment to Quarto as the successor. New projects should use Quarto, not distill. |
| GitHub Pages | Cloudflare Pages | Cloudflare Pages is free, fast, and has unlimited bandwidth. Good fallback if GitHub Pages limits become a concern. `quarto publish` does not have a Cloudflare target, so deployment requires a manual CI step. |
| Source Serif 4 | Spectral, Lora, Crimson Pro | All three are viable academic serifs. Source Serif 4 is chosen because it has a variable-weight axis (reduces font file requests), is designed specifically for body text at screen sizes, and is the closest Google Fonts match to Distill.pub's own typography. |

## What NOT to Use

| Avoid | Why | Use Instead |
|-------|-----|-------------|
| WordPress | Not static — requires a database and PHP server. No free hosting on a custom domain. Violates the "easy to maintain, no server" constraint. Security maintenance burden. | Quarto |
| Wix / Squarespace | Proprietary lock-in. Cannot version-control your content. Export is lossy. Not credible in academic contexts where peers check source. | Quarto |
| `distill` R package | Superseded by Quarto. Posit/RStudio has officially redirected investment to Quarto. Starting a new project on distill in 2026 means starting on a deprecated dependency. | Quarto (which replicates the distill aesthetic via SCSS) |
| Hugo Wowchemy/Academic theme (old) | The theme's renaming to Hugo Blox and multiple breaking-change migrations have left many sites broken on current Hugo versions. Community reports confirm compatibility failures on Hugo 0.127+. Fresh installs still work but the maintenance trajectory is risky. | Hugo Blox or al-folio if you must use Hugo/Jekyll; otherwise Quarto |
| Next.js / Gatsby | React-based SSGs add unnecessary JavaScript complexity. They are optimized for apps and e-commerce, not content-forward academic sites. Bundle size and build complexity far exceed what this site requires. | Quarto or Astro if JS framework is desired |
| Jekyll without a theme (bare) | Jekyll's default build requires Ruby gem management (`bundler`, `rbenv` or `rvm`). Version conflicts between Jekyll, plugins, and Ruby versions are a persistent maintenance pain for non-developers. | al-folio (encapsulates the Ruby complexity) or Quarto (no Ruby needed) |

## Stack Patterns by Variant

**If the maintainer is an R user (uses R, RStudio, tidyverse):**
- Use Quarto inside RStudio — the integration is seamless and the workflow is identical to R Markdown
- The Quarto VS Code extension is optional; RStudio's visual editor handles all authoring

**If the maintainer is not an R user and prefers plain text editing:**
- Use Quarto with VS Code + Quarto extension
- All content is plain Markdown + YAML — no knowledge of R required
- Publications and projects are maintained as `.yml` data files, not code

**If a contact form is required (contact page with email submissions):**
- Host on Netlify instead of GitHub Pages — Netlify's free tier includes 100 form submissions/month via Netlify Forms
- No backend or server code needed

**If the repository should be private:**
- Use Netlify (supports private repos on free tier) instead of GitHub Pages (requires public repo on free tier)

**If the site will have a blog in a future phase:**
- Quarto supports blog listings natively — adding a blog later is additive, not a rewrite
- Structure the initial site with this in mind by keeping a clean `_quarto.yml` navbar

## Version Compatibility

| Package | Compatible With | Notes |
|---------|-----------------|-------|
| Quarto 1.9.36 | Pandoc 3.4+ (bundled) | Quarto ships its own Pandoc — no separate Pandoc install needed or recommended |
| Quarto 1.9.36 | Bootstrap 5.3 (bundled) | Bootstrap SASS variables available for theming out of the box |
| Quarto 1.9.36 | GitHub Pages (any current) | `quarto publish gh-pages` handles branch management automatically |
| Quarto 1.9.36 | Netlify free tier | `quarto publish netlify` requires Netlify CLI or browser auth; no build minutes consumed if pre-built locally before push |
| Source Serif 4 | Any modern browser | Variable font; specify `font-display: swap` in SCSS to prevent flash of invisible text |

## Sources

- Quarto official download page (quarto.org/docs/download) — confirmed v1.9.36 released 2026-03-19 [HIGH confidence]
- Quarto 1.8 release notes (quarto.org/docs/blog/posts/2025-10-13-1.8-release/) — theming features, brand SCSS [HIGH confidence]
- Quarto HTML Theming docs (quarto.org/docs/output-formats/html-themes.html) — Bootstrap themes, SCSS variables [HIGH confidence]
- Quarto about page and listings docs — verified publications YAML and about-page templates exist natively [HIGH confidence]
- al-folio GitHub repo (github.com/alshedivat/al-folio) — confirmed 14.7k stars, v0.14.7, active maintenance [HIGH confidence]
- Hugo Blox discourse thread (discourse.gohugo.io) — compatibility failures on Hugo 0.127+ confirmed by community [MEDIUM confidence]
- Netlify pricing page (netlify.com/pricing) — 100 GB bandwidth, 300 build minutes, free tier confirmed [HIGH confidence]
- WebSearch results on academic SSG usage patterns 2025 — Quarto as dominant tool for R-adjacent academics [MEDIUM confidence — multiple corroborating sources]
- Google Fonts — Source Serif 4 and DM Sans verified as current, variable-weight fonts [HIGH confidence]

---
*Stack research for: Personal academic portfolio website (social scientist)*
*Researched: 2026-03-22*
