# Phase 1: Foundation - Research

**Researched:** 2026-03-22
**Domain:** Quarto website scaffold + GitHub Pages deployment + SCSS theming + About page content
**Confidence:** HIGH

---

<user_constraints>
## User Constraints (from CONTEXT.md)

### Locked Decisions

- Homepage IS the about page — combined, not separate
- Brief bio (2-3 sentences) plus research interests summary (3-5 sentences)
- Single page, not scrolling sections
- Warm neutrals color palette: cream/off-white background (#FAF8F5), warm dark text (#3D3632), gold accent (#C4813D), warm gray subtle (#A89888), terracotta links (#8B5E3C)
- No dark mode — single light theme
- Source Serif 4 + DM Sans typography (from research recommendation)
- Distill.pub-inspired layout: generous whitespace, narrow centered content column
- GitHub Pages for hosting (free tier)
- Email link (mailto:) for contact — no contact form, no Netlify needed
- Custom domain not yet purchased — deploy to GitHub Pages default URL first, add custom domain later (INFR-02 can be satisfied when domain is acquired)

### Claude's Discretion

- Photo + bio layout arrangement (side-by-side vs stacked) — pick what works best with warm neutral Distill aesthetic
- Exact spacing, margins, and responsive breakpoints
- Navigation item order and styling
- Footer content and design

### Deferred Ideas (OUT OF SCOPE)

None — discussion stayed within phase scope
</user_constraints>

---

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| INFR-01 | Static site built with Quarto, deployed to GitHub Pages | Quarto 1.9.36 + `quarto publish gh-pages` command documented; see Standard Stack and Deployment sections |
| INFR-02 | Custom domain configured with HTTPS | Deferred by user decision — deploy to GitHub Pages default URL first; DNS + HTTPS setup documented in Pitfalls for when domain is acquired |
| DSGN-01 | Distill.pub-inspired typography and layout | Source Serif 4 + DM Sans via Google Fonts @import in custom.scss; Bootstrap SASS variables $body-bg, $body-color, $link-color, $font-family-sans-serif documented |
| DSGN-02 | Responsive design works on mobile and desktop | Quarto navbar auto-collapses to hamburger below "lg" breakpoint; trestles template goes single-column on mobile |
| DSGN-03 | Clean navigation with 5-6 items (Home, Publications, CV, Contact) | Quarto navbar YAML under `website.navbar.left` — up to 6 items renders cleanly; hamburger collapse automatic |
| IDEN-01 | About/bio page with professional photo, affiliation, and background | Quarto `about: template: trestles` with `image:` field; supports image-shape, image-alt; body content is free Markdown |
| IDEN-02 | Homepage displays 3-5 sentence research interests summary | Free Markdown in the body of index.qmd; no special Quarto feature required |
</phase_requirements>

---

## Summary

Phase 1 is a Quarto website scaffold with a custom SCSS theme, deployed to GitHub Pages via `quarto publish gh-pages`. The entire phase is greenfield — the repository does not exist yet and the project directory is empty.

The core technical work is: (1) scaffold a Quarto website project, (2) write a custom SCSS theme that implements the warm neutrals palette and Source Serif 4 / DM Sans typography, (3) configure the About/Home page using Quarto's built-in `trestles` about template with real photo and content, (4) configure a 5-item navbar in `_quarto.yml`, and (5) publish to GitHub Pages.

No tooling beyond Quarto CLI is required. There is no Node.js, no Ruby, no npm build step. The `quarto publish gh-pages` command handles branch creation, rendering, and push in one step. Custom domain is explicitly deferred by user decision — INFR-02 will be satisfied in a later plan when the domain is acquired.

**Primary recommendation:** Scaffold with `quarto create project website`, implement the SCSS theme and about page content first, verify locally with `quarto preview`, then deploy with `quarto publish gh-pages`. Do not wire custom domain in this phase.

---

## Standard Stack

### Core

| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| Quarto CLI | 1.9.36 | Site generator, local preview, and GitHub Pages publisher | Purpose-built for academic publishing; ships about-page templates, Bootstrap 5 SASS, Pandoc, Font Awesome; `quarto publish gh-pages` deploys in one command |
| GitHub Pages | — | Free static hosting at `<username>.github.io/<repo>` | Free tier, permanent, no bandwidth quota for pre-built sites; pairs with `quarto publish gh-pages` for zero-config deployment |
| Bootstrap 5.3 SASS (via Quarto) | bundled | Theme variables — colors, fonts, spacing | Quarto exposes all 1,400+ Bootstrap SASS variables in `custom.scss`; no separate install |
| Google Fonts — Source Serif 4 | latest (variable) | Body and heading serif | Variable-weight axis reduces font requests; designed for body text; closest Google Fonts match to Distill.pub typography |
| Google Fonts — DM Sans | latest (variable) | UI sans-serif (nav, labels, captions) | Pairs cleanly with Source Serif 4; variable weight; free |
| Font Awesome 6 (via Quarto) | bundled | Icons in nav/contact (ORCID, GitHub, email) | Bundled automatically by Quarto; accessed via `{{< fa icon-name >}}` shortcodes |

### Supporting

| Library | Version | Purpose | When to Use |
|---------|---------|---------|-------------|
| Quarto `about` template: trestles | built-in | About/Home page layout (photo left, content right) | The only about-page in Phase 1; controlled by `about: template: trestles` in index.qmd frontmatter |
| Quarto website navbar | built-in | Top navigation bar with hamburger collapse | Configured in `_quarto.yml` under `website.navbar.left`; no external library |

### Alternatives Considered

| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| trestles template | jolla or broadside | jolla centers everything (less Distill-adjacent); broadside has image left / content right (similar to trestles); trestles is the closest to the Distill.pub two-column pattern |
| GitHub Pages | Netlify | Netlify supports private repos and contact forms; user chose mailto contact so GitHub Pages is correct |
| Source Serif 4 | Spectral, Lora, Crimson Pro | All viable academic serifs; Source Serif 4 has variable weight axis and is designed for screen body text — best fit |

**Installation:**
```bash
# Install Quarto CLI (macOS)
brew install --cask quarto

# Verify version
quarto --version
# Expected output: 1.9.36

# Scaffold new website project in the current directory
quarto create project website .

# Preview locally with hot reload
quarto preview

# Publish to GitHub Pages (run once from CLI to create _publish.yml)
quarto publish gh-pages
```

No npm, no Ruby, no bundler, no Node version manager required.

---

## Architecture Patterns

### Recommended Project Structure

```
/                               # Repo root (= Quarto project root)
├── _quarto.yml                 # Site config: title, navbar, theme, format settings
├── index.qmd                  # About/Home page (the only content page in Phase 1)
├── custom.scss                 # SCSS theme: fonts, colors, Distill layout variables
├── images/
│   └── profile.jpg            # Professional headshot (compressed to ≤150 KB)
├── .nojekyll                  # Prevents GitHub Pages from running Jekyll on output
├── _publish.yml               # Created by quarto publish gh-pages on first run
└── .gitignore                 # Exclude _site/, .quarto/ cache directories
```

Stub files for future phases (created in Phase 1 so navbar links resolve):
```
├── publications.qmd           # Stub — "Coming soon" placeholder
├── cv.qmd                     # Stub — "Coming soon" placeholder
└── contact.qmd                # Stub — email link (mailto:) only
```

**Why stubs matter:** The Phase 1 navbar includes Publications, CV, and Contact links. These must resolve to real pages (even stubs) or Quarto will warn about broken hrefs. Creating stubs now means the nav is functional and future phases simply fill in content.

### Pattern 1: _quarto.yml as the Single Config Source

**What:** All site-level settings live in `_quarto.yml` — site title, navbar, theme reference, format defaults, and output directory. Every `.qmd` file in the project inherits these settings automatically.

**When to use:** Always. Never set format or theme options in individual `.qmd` frontmatter unless they are page-specific overrides.

**Example:**
```yaml
# Source: https://quarto.org/docs/websites/
project:
  type: website

website:
  title: "Researcher Name"
  navbar:
    left:
      - text: "Home"
        href: index.qmd
      - text: "Publications"
        href: publications.qmd
      - text: "CV"
        href: cv.qmd
      - text: "Contact"
        href: contact.qmd
    background: "#FAF8F5"
    foreground: "#3D3632"

format:
  html:
    theme:
      - cosmo
      - custom.scss
    toc: false
```

### Pattern 2: About Page via Trestles Template

**What:** The `index.qmd` homepage uses Quarto's built-in `trestles` about-page template. The template creates a two-column layout: photo and name/links on the left, bio + research interests in Markdown on the right. On mobile it collapses to a single stacked column automatically.

**When to use:** The homepage / About page only.

**Example:**
```yaml
# index.qmd frontmatter
---
title: "Dr. Researcher Name"
subtitle: "Assistant Professor, Department of Political Science, University Name"
image: images/profile.jpg
image-shape: rectangle
about:
  template: trestles
  links:
    - icon: envelope
      text: Email
      href: mailto:r.name@university.edu
    - icon: mortarboard-fill
      text: Google Scholar
      href: https://scholar.google.com/...
    - icon: person-badge
      text: ORCID
      href: https://orcid.org/...
---

Brief bio paragraph (2-3 sentences). Affiliation and academic background.

## Research Interests

3-5 sentence summary of research interests in plain language accessible
to both academic and non-academic readers.
```

### Pattern 3: SCSS Theme with Google Fonts and Bootstrap Variable Overrides

**What:** A single `custom.scss` file layered on top of a minimal base theme (cosmo or flatly) overrides Bootstrap SASS variables to implement the warm neutrals palette and custom typography. Google Fonts are imported via `@import url()` in the `scss:defaults` section.

**When to use:** Applied globally via `_quarto.yml` `theme:` list. All pages inherit it.

**Example:**
```scss
/* Source: https://ucsb-meds.github.io/customizing-quarto-websites/ */
/* Source: https://quarto.org/docs/output-formats/html-themes.html */

/*-- scss:defaults --*/

/* Google Fonts import */
@import url('https://fonts.googleapis.com/css2?family=Source+Serif+4:ital,opsz,wght@0,8..60,300..900;1,8..60,300..900&family=DM+Sans:ital,opsz,wght@0,9..40,300..900;1,9..40,300..900&display=swap');

/* Color palette — warm neutrals */
$body-bg:        #FAF8F5;
$body-color:     #3D3632;
$link-color:     #8B5E3C;
$navbar-bg:      #FAF8F5;
$navbar-fg:      #3D3632;
$navbar-hl:      #C4813D;
$footer-bg:      #EDE9E4;

/* Typography */
$font-family-sans-serif: "DM Sans", system-ui, sans-serif;
$font-family-serif:      "Source Serif 4", Georgia, serif;

/* Body text uses serif */
$font-family-base: $font-family-serif;

/*-- scss:rules --*/

/* Narrow centered content column — Distill.pub-inspired */
.quarto-container {
  max-width: 720px;
}

/* Trestles about page: add margin above image on mobile */
@media (max-width: 768px) {
  .about-image {
    margin-top: 1rem;
  }
}

/* Font smoothing */
body {
  -webkit-font-smoothing: antialiased;
  font-display: swap;
}
```

### Pattern 4: Stub Pages for Future Navigation

**What:** Contact, Publications, and CV pages exist as minimal `.qmd` files in Phase 1 so navbar hrefs resolve. They contain only a heading and a note that content is coming.

**Example (`contact.qmd`):**
```markdown
---
title: "Contact"
---

Email: [r.name@university.edu](mailto:r.name@university.edu)
```

This satisfies DSGN-03 (navigation functional) without requiring full content, and establishes the file structure that Phases 2-3 will fill in.

### Anti-Patterns to Avoid

- **Setting theme colors in individual .qmd frontmatter:** Breaks the single-source-of-truth for design. All color/font settings go in `custom.scss` only.
- **Using `output-dir: docs` for GitHub Pages:** The `quarto publish gh-pages` command manages a separate `gh-pages` branch — do not also configure a `docs/` output directory or you will have conflicting deployment targets.
- **Embedding the profile photo without compressing it:** Unoptimized photos (5–10 MB from camera) cause slow first paint. Compress to ≤150 KB before committing.
- **Skipping `.nojekyll`:** GitHub Pages runs Jekyll processing on files unless `.nojekyll` is present in the repo root. Quarto generates this automatically during `quarto publish`, but it must also be committed to the source branch.
- **Building stub pages after content:** Create stubs first in the same plan wave as `_quarto.yml` so Quarto never encounters an unresolvable href.

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Photo + bio layout | Custom HTML/CSS two-column layout | Quarto `about: template: trestles` | Handles responsive collapse automatically; tested across browsers; zero CSS to write |
| Navbar with hamburger menu | Custom JavaScript hamburger toggle | Quarto's built-in navbar with `collapse: true` | Bootstrap 5 hamburger implemented and tested; mobile behavior correct by default |
| Google Fonts loading | Manual `<link>` tags in HTML head | `@import url()` in `custom.scss` scss:defaults | Quarto inlines this correctly into the generated `<head>`; no template editing required |
| Font Awesome icons | SVG downloads or custom icon set | Quarto's bundled Font Awesome 6 (`{{< fa >}}` shortcodes) | Already bundled; no CDN link or npm install |
| GitHub Pages deployment | Manual `_site/` folder commits, FTP | `quarto publish gh-pages` | Single command handles branch creation, render, push, and browser open |

**Key insight:** Quarto's about-page templates, navbar system, and publish command eliminate almost all custom code for a Phase 1 scope. The only custom code is the `custom.scss` theme file.

---

## Common Pitfalls

### Pitfall 1: Running `quarto publish gh-pages` Before the GitHub Repo Exists

**What goes wrong:** The publish command tries to push to a remote that does not exist yet, fails with a git error, and leaves the project in a partially-initialized state.

**Why it happens:** Developers scaffold the project locally and immediately try to publish before creating the GitHub repository and setting the remote.

**How to avoid:** Create the GitHub repo first (via `gh repo create` or the GitHub web UI), then run `git remote add origin <url>`, then run `quarto publish gh-pages`. Sequence matters.

**Warning signs:** Git error "remote: Repository not found" or "fatal: 'origin' does not appear to be a git repository" during publish.

### Pitfall 2: HTTPS Not Enforced Correctly on GitHub Pages

**What goes wrong:** The site is accessible at `http://` but not `https://`, or the browser shows "Not Secure". This matters specifically for INFR-01/02 success criteria.

**Why it happens:** HTTPS enforcement must be toggled manually in GitHub repo Settings → Pages → "Enforce HTTPS". It is not enabled by default for custom domains and may take a few minutes to provision even for the default `*.github.io` URL.

**How to avoid:** After first successful `quarto publish gh-pages`, go to repo Settings → Pages and confirm "Enforce HTTPS" is checked. Test from a private/incognito window.

**Warning signs:** Browser padlock shows "Not Secure"; URL shows `http://` not `https://`.

### Pitfall 3: The `trestles` Template Image Touches the Navbar on Mobile

**What goes wrong:** On a 375px screen the profile photo has zero top margin and sits directly under the navbar, looking cramped or cropped.

**Why it happens:** Quarto's trestles template does not set top margin on the image in mobile layout.

**How to avoid:** Add to `custom.scss` rules section:
```scss
@media (max-width: 768px) {
  .about-image { margin-top: 1.5rem; }
}
```

**Warning signs:** When viewed at 375px, photo appears clipped at top or is visually flush with navbar.

### Pitfall 4: Custom SCSS Missing Region Decorators

**What goes wrong:** Quarto silently ignores the `custom.scss` file or generates a build error. No fonts or colors are applied.

**Why it happens:** The `/*-- scss:defaults --*/` comment decorator is required — Quarto uses it to determine where to insert variables vs. rules in the Bootstrap compilation pipeline. A file without it is not valid as a Quarto SCSS theme.

**How to avoid:** Every `custom.scss` must start with `/*-- scss:defaults --*/` before any variable declarations, and include `/*-- scss:rules --*/` before any CSS rules. Both are required even if one section is empty.

**Warning signs:** SCSS changes have no visual effect; Quarto build logs mention SCSS processing errors.

### Pitfall 5: Unoptimized Profile Photo

**What goes wrong:** Page load time is 5–10 seconds on mobile because the profile photo is a 4 MB JPEG from a camera.

**Why it happens:** The photo is copied directly from its source without compression.

**How to avoid:** Compress the image to ≤150 KB at the intended display size before committing. Use `sips -Z 600 profile.jpg` (macOS built-in) or any image editor. Save as JPEG at 80–85% quality.

**Warning signs:** File size of `images/profile.jpg` exceeds 500 KB.

### Pitfall 6: INFR-02 (Custom Domain) Blocking Phase Completion

**What goes wrong:** The team waits to close Phase 1 until a custom domain is purchased and HTTPS is configured, even though the user explicitly deferred this.

**Why it happens:** INFR-02 is in the phase requirements list but the CONTEXT.md locked decision says domain is deferred.

**How to avoid:** Phase 1 is complete when the site is live at `<username>.github.io/<repo>` with HTTPS enforced. INFR-02 is satisfied in a later (possibly out-of-band) plan when the domain is acquired. Document this explicitly in the plan's success criteria note.

---

## Code Examples

Verified patterns from official sources and community-verified practice:

### Minimal `_quarto.yml` for Phase 1

```yaml
# Source: https://quarto.org/docs/websites/
project:
  type: website

website:
  title: "Dr. Researcher Name"
  navbar:
    background: "#FAF8F5"
    foreground: "#3D3632"
    left:
      - text: "Home"
        href: index.qmd
      - text: "Publications"
        href: publications.qmd
      - text: "CV"
        href: cv.qmd
      - text: "Contact"
        href: contact.qmd

format:
  html:
    theme:
      - cosmo
      - custom.scss
    toc: false
    page-layout: full
```

### About Page Frontmatter (index.qmd)

```yaml
# Source: https://quarto.org/docs/websites/website-about.html
---
title: "Dr. Researcher Name"
subtitle: "Assistant Professor, Department of Political Science | University Name"
image: images/profile.jpg
image-shape: rectangle
about:
  template: trestles
  links:
    - icon: envelope
      text: Email
      href: mailto:researcher@university.edu
    - icon: mortarboard-fill
      text: Google Scholar
      href: https://scholar.google.com/citations?user=XXXX
    - icon: person-badge-fill
      text: ORCID
      href: https://orcid.org/0000-0000-0000-0000
---
```

### SCSS Theme File (custom.scss)

```scss
/* Source: https://ucsb-meds.github.io/customizing-quarto-websites/ */
/* Source: https://quarto.org/docs/output-formats/html-themes.html */

/*-- scss:defaults --*/

@import url('https://fonts.googleapis.com/css2?family=Source+Serif+4:ital,opsz,wght@0,8..60,300..900;1,8..60,300..900&family=DM+Sans:ital,opsz,wght@0,9..40,300..900;1,9..40,300..900&display=swap');

/* Warm neutrals palette */
$body-bg:       #FAF8F5;
$body-color:    #3D3632;
$link-color:    #8B5E3C;
$navbar-bg:     #FAF8F5;
$navbar-fg:     #3D3632;
$navbar-hl:     #C4813D;
$footer-bg:     #EDE9E4;

/* Typography */
$font-family-sans-serif: "DM Sans", system-ui, -apple-system, sans-serif;
$font-family-base:       "Source Serif 4", Georgia, "Times New Roman", serif;

/* Headings use DM Sans */
$headings-font-family:   "DM Sans", system-ui, sans-serif;
$headings-font-weight:   600;

/*-- scss:rules --*/

body {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* Trestles mobile fix */
@media (max-width: 768px) {
  .about-image {
    margin-top: 1.5rem;
  }
}
```

### GitHub Pages Deployment Sequence

```bash
# Step 1: Initialize git and connect to GitHub
git init
git add .
git commit -m "Initial Quarto site scaffold"
gh repo create <repo-name> --public --source=. --remote=origin --push

# Step 2: Publish to GitHub Pages (creates gh-pages branch, renders, pushes)
quarto publish gh-pages
# Follow prompts: confirm publish destination, opens browser when done

# Step 3: Enforce HTTPS
# Go to: https://github.com/<username>/<repo>/settings/pages
# Confirm "Enforce HTTPS" is checked (may take 2-3 minutes after first deploy)

# Step 4: Verify
# Open: https://<username>.github.io/<repo>/ in a private window
```

---

## State of the Art

| Old Approach | Current Approach | When Changed | Impact |
|--------------|------------------|--------------|--------|
| `distill` R package for Distill.pub-style sites | Quarto (which replicates distill aesthetic via SCSS) | 2022 (Quarto GA) | `distill` is deprecated; Quarto is the Posit-supported successor |
| Hugo Wowchemy/Academic theme | Quarto or al-folio | 2023–2024 (Hugo Blox rebrand + breaking changes) | Hugo Blox has compatibility failures on Hugo 0.127+; new projects should not use it |
| Manual `docs/` folder + commit for GitHub Pages | `quarto publish gh-pages` command | Quarto 1.x | One command replaces manual render + commit + push workflow |
| Separate CSS file for Google Fonts `<link>` tags | `@import url()` in `custom.scss` defaults | Current practice | SCSS import is processed correctly by Quarto's Bootstrap pipeline |

**Deprecated/outdated:**
- `distill` R package: Officially superseded by Quarto. Do not start new projects on it.
- Hugo Wowchemy/Hugo Blox Academic: Multiple breaking migrations; community reports of failures on current Hugo versions.
- Manually committing `_site/` to a `docs/` branch for GitHub Pages: Replaced by `quarto publish gh-pages`.

---

## Open Questions

1. **Photo format and source**
   - What we know: A professional photo is required for IDEN-01. Compression to ≤150 KB is required.
   - What's unclear: Whether the user has a photo ready and in what format/resolution.
   - Recommendation: Plan task should prompt the user to provide a JPEG or PNG headshot before the about page task begins. Include an image optimization step as part of that task.

2. **Exact content for bio and research interests**
   - What we know: 2-3 sentence bio and 3-5 sentence research interests summary are required (IDEN-01, IDEN-02).
   - What's unclear: The actual text has not been drafted. The plan cannot write this content — the user must supply it.
   - Recommendation: Create a content-gathering task early in Phase 1 that explicitly requests: (a) name and full title/affiliation, (b) 2-3 sentence bio, (c) 3-5 sentence research interests summary, (d) professional email address, (e) Google Scholar and ORCID profile URLs.

3. **GitHub repository name**
   - What we know: The repository name determines the GitHub Pages URL (`<username>.github.io/<repo-name>`).
   - What's unclear: Whether the user has a GitHub account and what username/repo name they want.
   - Recommendation: Plan task should include a step to confirm GitHub username and desired repo name before scaffolding.

4. **INFR-02 timing**
   - What we know: Custom domain is explicitly deferred by user decision. INFR-02 states "custom domain configured with HTTPS."
   - What's unclear: The success criteria for Phase 1 still includes "Visitor can reach the site at the custom domain over HTTPS" (criterion 1 in ROADMAP.md), which conflicts with the CONTEXT.md deferral.
   - Recommendation: The plan should note that Phase 1 success criterion 1 is partially satisfied (site live at GitHub Pages URL with HTTPS; custom domain deferred to a future out-of-band task when domain is acquired). This should be documented as a known divergence from the roadmap success criteria.

---

## Validation Architecture

### Test Framework

| Property | Value |
|----------|-------|
| Framework | None — static site; no unit test framework applicable |
| Config file | None required for Phase 1 |
| Quick run command | `quarto render && quarto check` |
| Full suite command | Manual browser verification checklist (see below) |

Phase 1 produces a static website. There is no application logic, no functions, and no data transformations to unit-test. Validation is entirely visual and functional: does the page look correct, does the nav work, does the site deploy and serve over HTTPS.

### Phase Requirements → Test Map

| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| INFR-01 | Quarto renders without errors; site deploys to GitHub Pages | smoke | `quarto render --no-cache 2>&1 | grep -i error` | ❌ Wave 0: create test script |
| INFR-02 | HTTPS enforced at GitHub Pages URL (custom domain deferred) | manual | Open `https://<user>.github.io/<repo>/` in private window; check padlock | N/A — manual |
| DSGN-01 | Source Serif 4 and DM Sans load; warm palette visible | manual | Visual inspect in browser; check DevTools Network tab for font files | N/A — manual |
| DSGN-02 | Layout renders at 375px width without horizontal scroll | manual | Open site on real mobile device at 375px width OR Chrome DevTools → iPhone SE | N/A — manual |
| DSGN-03 | Navbar shows Home/Publications/CV/Contact; hamburger works on mobile | manual | Click each nav link; test hamburger on mobile | N/A — manual |
| IDEN-01 | Photo, name, affiliation, bio visible on home page | manual | Load index page; confirm all three elements present above the fold | N/A — manual |
| IDEN-02 | Research interests summary visible (3-5 sentences) | manual | Load index page; confirm research section present and readable | N/A — manual |

### Sampling Rate

- **Per task commit:** `quarto render` — confirms no build errors before committing
- **Per wave merge:** `quarto render` + manual visual check in browser via `quarto preview`
- **Phase gate:** Full manual checklist below before `/gsd:verify-work`

### Phase Gate Manual Checklist

```
[ ] quarto render completes with no errors
[ ] quarto preview shows site correctly at http://localhost:####
[ ] Profile photo visible, not distorted, loads in < 2 seconds on WiFi
[ ] Bio (2-3 sentences) and research interests (3-5 sentences) present
[ ] All 4 navbar links resolve (Home, Publications, CV, Contact)
[ ] Hamburger menu appears and works at 375px width (tested on real device)
[ ] No horizontal scroll at 375px
[ ] Source Serif 4 and DM Sans load (verify in DevTools Network tab: font files present)
[ ] Warm palette applied: background #FAF8F5, text #3D3632 visible
[ ] Site live at https://<user>.github.io/<repo>/ with HTTPS (not HTTP)
[ ] All pages load without 404 errors
```

### Wave 0 Gaps

- [ ] `scripts/check-build.sh` — simple shell script that runs `quarto render` and checks exit code; covers INFR-01 automated check
- [ ] No framework to install — Quarto CLI is the only tool; confirm installed with `quarto --version`

---

## Sources

### Primary (HIGH confidence)

- Quarto About Pages official docs: https://quarto.org/docs/websites/website-about.html — trestles template, YAML fields, image options
- Quarto Website Navigation docs: https://quarto.org/docs/websites/website-navigation.html — navbar YAML, collapse behavior, mobile hamburger
- Quarto HTML Theming docs: https://quarto.org/docs/output-formats/html-themes.html — custom.scss structure, layering on base theme
- Quarto GitHub Pages publishing docs: https://quarto.org/docs/publishing/github-pages.html — `quarto publish gh-pages` command, CNAME file, .nojekyll
- UCSB MEDS Customizing Quarto Websites: https://ucsb-meds.github.io/customizing-quarto-websites/ — SCSS variables $navbar-bg, $navbar-fg, $body-bg, $body-color, $link-color, Google Fonts import pattern
- Quarto stack research (project STACK.md): Quarto 1.9.36 confirmed current; Source Serif 4 + DM Sans confirmed available
- Quarto Pitfalls research (project PITFALLS.md): GitHub Pages SSL, mobile testing, over-engineering, photo optimization

### Secondary (MEDIUM confidence)

- WebSearch: Quarto trestles mobile image margin-top fix — confirmed by Quarto GitHub Discussion #3190 (https://github.com/orgs/quarto-dev/discussions/3190)
- WebSearch: Google Fonts @import url() pattern in Quarto SCSS — confirmed by UCSB MEDS guide and multiple community blog posts

### Tertiary (LOW confidence)

- None — all critical claims verified against official Quarto documentation or the project's own HIGH-confidence prior research.

---

## Metadata

**Confidence breakdown:**
- Standard stack: HIGH — Quarto 1.9.36 confirmed, GitHub Pages deployment verified in official docs, Bootstrap SASS variables confirmed
- Architecture: HIGH — `_quarto.yml` structure and trestles template verified in official about page docs
- SCSS theming: HIGH — variable names ($body-bg, $navbar-bg, $link-color, etc.) confirmed in UCSB MEDS guide and official theming docs
- Pitfalls: HIGH for deployment and SCSS; MEDIUM for mobile trestles margin fix (community-sourced but cross-verified with official GitHub discussion)

**Research date:** 2026-03-22
**Valid until:** 2026-06-22 (Quarto has regular releases; re-verify if Quarto version changes beyond 1.9.x before implementation)
