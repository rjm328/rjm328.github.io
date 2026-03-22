# Phase 3: CV and Contact - Research

**Researched:** 2026-03-22
**Domain:** Quarto static HTML content — academic CV presentation and contact page
**Confidence:** HIGH

---

<user_constraints>
## User Constraints (from CONTEXT.md)

### Locked Decisions

**CV browser presentation:**
- HTML CV built from structured data extracted from `RJM-CV-v.oct25.pdf`
- Claude parses the PDF and populates the HTML sections — user reviews before publishing
- Four sections on the CV page: Education, Academic Positions, Publications, Awards & Fellowships
- Publications section is a summary with link to /publications.html (not a full duplicate list) — avoids maintenance duplication
- Summary shows counts: "22 peer-reviewed articles, 1 book chapter, 3 working papers" with a "View full publications" link

**PDF download:**
- Prominent download button at top of CV page, before content sections
- Terracotta outline style (`btn-outline-secondary` with `#8B5E3C`) — consistent with publication DOI/PDF buttons
- Links to `RJM-CV-v.oct25.pdf` (already in repo)

**Contact page content:**
- Email address: rmcgrat2@gmu.edu (mailto: link, no form — locked from Phase 1)
- Professional profile links: ORCID, Google Scholar, GitHub (same as homepage) + LinkedIn (new)
- Office / mailing address at George Mason
- Department affiliation with link to Schar School website
- Office hours / availability note
- Claude looks up office address and department details from Schar School website during execution

### Claude's Discretion
- CV section layout and spacing (timeline-style, table, or simple list)
- Contact page layout (single column vs. two-column for info + links)
- How to present office hours (specific times vs. "by appointment")
- Whether to add a small department logo or keep text-only
- Responsive adjustments for mobile on both pages

### Deferred Ideas (OUT OF SCOPE)
None — discussion stayed within phase scope
</user_constraints>

---

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| CV-01 | CV page displays academic CV viewable in the browser | Full CV content extracted from PDF (all 7 pages); Quarto Markdown with custom CSS divs is the implementation path |
| CV-02 | Visitor can download CV as PDF | PDF already exists at project root; HTML download link pattern established in existing site |
| CONT-01 | Contact page displays email address | Email confirmed as rmcgrat2@gmu.edu; existing contact.qmd already has mailto: stub |
| CONT-02 | Contact page links to ORCID, Google Scholar, and other professional profiles | All URLs confirmed from index.qmd; LinkedIn is the only new link (URL to be provided by user) |
</phase_requirements>

---

## Summary

This phase adds two content pages — `cv.qmd` and `contact.qmd` — to a working Quarto site. No new infrastructure, libraries, or build tooling is required. Both stub pages already exist and are already linked in the navbar. The work is purely content authoring in Quarto Markdown, using CSS patterns already established in `custom.scss`.

The CV page replaces a one-line placeholder with a full structured HTML CV derived from the parsed PDF. It has four sections (Education, Academic Positions, Publications summary, Awards & Fellowships) plus a download button at the top. The contact page replaces a minimal mailto stub with a complete professional contact block including address, profile links, and office hours.

The primary technical question in this phase is layout and visual design for two new page types — neither has a precedent page in the existing site. Everything else (button styles, typography, column width, deployment) is already solved.

**Primary recommendation:** Author both pages as plain Quarto Markdown with Bootstrap utility classes and the existing `.pub-buttons .btn-outline-secondary` pattern. No new CSS classes are needed beyond a few targeted additions to `custom.scss` for CV section dividers and contact grid spacing.

---

## Extracted CV Content (Source of Truth)

This section records all CV data parsed from `RJM-CV-v.oct25.pdf` for use in planning tasks. Confidence: HIGH — read directly from the PDF.

### Contact / Address Block (from PDF page 1)
- **Institution:** George Mason University, Schar School of Policy and Government
- **Mailing address:** 4400 University Dr., MSN 3F4, Fairfax, Virginia 22030
- **Phone:** (703) 993-4567
- **Fax:** (703) 993-1399
- **Email:** rmcgrat2@gmu.edu
- **University web:** mcgrath.gmu.edu

### Professional Appointments (from PDF page 1)

**George Mason University — Fairfax, Virginia**
| Title | Dates |
|-------|-------|
| Director of Political Science and Public Policy PhD Programs, Schar School | 2025 – present |
| Associate Professor, Schar School | 2017 – present |
| Director of Undergraduate Programs, Schar School | 2018 – 2021 |
| Assistant Professor, Schar School | 2014 – 2017 |
| Assistant Professor, Department of Public and International Affairs | 2011 – 2014 |

**University of Michigan — Ann Arbor, Michigan**
| Title | Dates |
|-------|-------|
| Robert Wood Johnson Foundation Scholar in Health Policy Research | 2013 – 2015 |

### Education (from PDF page 1)
- **Ph.D.**, Political Science, The University of Iowa, July 2011
  - Dissertation: *Strategic Oversight and the Institutional Determinants of Legislative Policy Control*
  - Committee: Frederick J. Boehmke (Chair), Douglas Dion, Christian B. Jensen, Raymond G. Riezman, and Charles R. Shipan (University of Michigan)
- **B.A.**, Political Science & Philosophy, Saint Peter's College, 2004

### Publications Counts (from publications.yml — confirmed)
- 22 peer-reviewed articles
- 1 book chapter
- 3 working papers / works in progress

### Book Reviews (from PDF page 3 — NOT in publications.yml, CV-only)
- Review of Steven Rogers's *Accountability in State Legislatures* for *Publius*, Volume 55, No. 2 (Spring 2025)
- Review of Ben Merriman's *Conservative Innovators* for *JPART*, Volume 30, No. 2 (April 2020)
- Review of James M. Curry's *Legislating in the Dark* for *The Journal of Politics*, Volume 78, No. 2 (April 2016)

### Research Awards (from PDF page 3)
- *State Politics and Policy Quarterly Award* (State Politics and Policy Section, APSA) for "Experts, Amateurs, and Bureaucratic Influence in the American States," with Graeme Boushey, 2015

### Teaching Awards (from PDF page 3)
- Outstanding Teaching Award, Schar School of Policy and Government, 2023
- OSCAR Mentoring Excellence Award, George Mason University, 2022

### Grants & Fellowships (from PDF pages 3–4)
- NSF Collaborative Research (RIDIR): "DAPPR: Diffusion Analytics for Public Policy Research," with Frederick J. Boehmke, Bruce A. Desmarais, William W. Franko, Jeffrey J. Harden, Yu-Ru Lin, and Jason Windett. Oct 1, 2016 – Sep 30, 2019. **$808,128**
- Robert Wood Johnson Foundation Scholars in Health Policy Research Fellowship (University of Michigan site), 2013–2015
- "The American Governor: Politics, Policy, Power and Leadership" Research Grant, Center on the American Governor — Eagleton Institute of Politics (Rutgers University), with Jon C. Rogowski and Josh M. Ryan, 2012. **$4,980**
- Graduate College Summer Fellowship, University of Iowa, 2009
- NSF award to attend EITM summer institute, University of Michigan, 2009
- NSF award to attend EITM summer institute, Washington University in St. Louis, 2008
- Foreign Language and Area Studies (FLAS) Summer Fellowship, Consortium in Latin American and Caribbean Studies at UNC-Duke, 2005
- Political Science Graduate Fellowship, University of Iowa, 2004–2010

### Note on Sections NOT Included in Phase 3 CV Page
The CONTEXT.md decision is four sections only: Education, Academic Positions, Publications summary, Awards & Fellowships. The following CV sections exist in the PDF but are OUT OF SCOPE for the browser CV (they would be in the downloadable PDF only):
- Conference/Seminar Participation (PDF pages 4–5) — very long list
- Additional Training (PDF page 5)
- Courses Taught (PDF pages 5–6)
- Students Supervised (PDF page 6)
- Service (PDF pages 6–7)
- Manuscript Review (PDF page 7)

The browser CV is intentionally a curated digest. The download button gives access to the full 7-page PDF.

---

## Standard Stack

### Core
| Library | Version | Purpose | Why Standard |
|---------|---------|---------|--------------|
| Quarto | 1.9.x (installed) | Page rendering | Already in use; pages are .qmd files |
| Bootstrap 5 | bundled with cosmo theme | Layout, buttons, responsive grid | Already in use via cosmo theme |
| custom.scss | project file | Warm neutral palette, typography, button overrides | Established in Phase 1 |

### Supporting
| Component | Version | Purpose | When to Use |
|-----------|---------|---------|-------------|
| Bootstrap `.row`/`.col-*` | BS5 bundled | Two-column layout on contact page | If Claude's discretion chooses two-column |
| Bootstrap `d-flex`, `gap-*` | BS5 bundled | Button row spacing | CV download button row |
| `:::` Quarto div fences | Quarto syntax | Apply CSS classes to content blocks | CV section dividers, contact blocks |

### Alternatives Considered
| Instead of | Could Use | Tradeoff |
|------------|-----------|----------|
| Plain Quarto Markdown | Separate YAML data file + template | YAML approach adds complexity not needed for a single static page |
| Custom CSS classes | Bootstrap utility classes | Bootstrap utilities sufficient; fewer custom classes = easier maintenance |

**Installation:** None required. All dependencies already present in the project.

---

## Architecture Patterns

### Recommended File Changes
```
cv.qmd          ← Replace placeholder with full CV content (primary deliverable)
contact.qmd     ← Replace stub with complete contact block (primary deliverable)
custom.scss     ← Add .cv-section, .cv-entry classes for section styling
```

No new files. No changes to `_quarto.yml`, `_publish.yml`, or any infrastructure.

### Pattern 1: CV Page Structure

The CV page follows a two-level hierarchy: sections (Education, Positions, Publications, Awards) and entries within sections. Each section uses a consistent visual treatment.

**YAML front matter:**
```yaml
---
title: "CV"
---
```

**Top-of-page download button (before any `##` headings):**
```html
<div class="pub-buttons" style="margin-bottom: 2rem;">
<a href="RJM-CV-v.oct25.pdf" class="btn btn-outline-secondary btn-sm" download>
  Download CV (PDF)
</a>
</div>
```

Note: The `download` HTML attribute triggers a browser download instead of opening the PDF inline. This is standard HTML5 — no JavaScript needed.

**Section dividers in custom.scss:**
```scss
.cv-section {
  margin-top: 2.5rem;
  padding-top: 1.5rem;
  border-top: 1px solid #EDE9E4;
}

.cv-entry {
  margin-bottom: 1.25rem;
}

.cv-entry-title {
  font-weight: 600;
  font-family: "DM Sans", system-ui, sans-serif;
}

.cv-entry-meta {
  color: #6B5E55;
  font-size: 0.9rem;
}
```

**Publications summary block:**
```markdown
## Publications

::: {.cv-section}
22 peer-reviewed articles, 1 book chapter, 3 working papers and works in progress.

[View full publications list](/publications.html){.btn .btn-outline-secondary .btn-sm}
:::
```

### Pattern 2: Contact Page Structure

The contact page presents professional information in a scannable format. Single-column is simpler and matches the 720px centered column. Two-column (info left, links right) is also viable if Claude's discretion chooses it.

**Single-column pattern (simpler, matches site aesthetic):**
```markdown
---
title: "Contact"
---

[rmcgrat2@gmu.edu](mailto:rmcgrat2@gmu.edu)

**Schar School of Policy and Government**
George Mason University
4400 University Dr., MSN 3F4
Fairfax, Virginia 22030

[ORCID](https://orcid.org/0000-0001-8963-3231) |
[Google Scholar](https://scholar.google.com/citations?hl=en&user=kQEBg6wAAAAJ) |
[GitHub](https://github.com/rjm328) |
[LinkedIn](URL_TBD)
```

**Profile link buttons (reusing publication button pattern):**
```html
<div class="pub-buttons">
<a href="mailto:rmcgrat2@gmu.edu" class="btn btn-outline-secondary btn-sm">Email</a>
<a href="https://orcid.org/0000-0001-8963-3231" class="btn btn-outline-secondary btn-sm" target="_blank" rel="noopener">ORCID</a>
<a href="https://scholar.google.com/citations?hl=en&user=kQEBg6wAAAAJ" class="btn btn-outline-secondary btn-sm" target="_blank" rel="noopener">Google Scholar</a>
<a href="https://github.com/rjm328" class="btn btn-outline-secondary btn-sm" target="_blank" rel="noopener">GitHub</a>
<a href="LINKEDIN_URL" class="btn btn-outline-secondary btn-sm" target="_blank" rel="noopener">LinkedIn</a>
</div>
```

### Established Project Patterns (must follow)
- 720px max-width centered column via `.quarto-container` — already applied globally, no per-page action needed
- Source Serif 4 for body, DM Sans for headings — applied globally via `custom.scss`
- `#EDE9E4` for borders and dividers (warm gray)
- `#6B5E55` for muted meta text (already used in `.pub-entry .pub-summary`)
- Terracotta `#8B5E3C` for `.btn-outline-secondary` — already overridden globally in `custom.scss`
- `page-layout: full` applied globally in `_quarto.yml`

### Anti-Patterns to Avoid
- **Inline styles for colors:** All colors must come from `custom.scss` variables or existing classes, not inline `style=""` attributes (exception: `margin-bottom` adjustments are acceptable inline).
- **Duplicating the full publications list:** The CV page publications section is a summary with count + link, not a repeat of `publications.qmd`.
- **Using `toc: true` on the CV page:** The site sets `toc: false` globally; overriding per-page is possible but adds visual clutter for a page with predictable section structure.
- **Hiding the email address:** CONT-01 explicitly requires the email address to be displayed, not hidden behind a form or obfuscated.
- **Opening the PDF in a new tab without download attribute:** Without `download`, clicking the link may just open the PDF in-browser. Add `download` attribute to trigger save dialog on supported browsers.

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| Responsive two-column layout | Custom CSS flexbox grid | Bootstrap `.row`/`.col-md-6` | Already available via cosmo/Bootstrap 5 |
| Button styles | New `.btn-cv-download` class | `.pub-buttons .btn-outline-secondary` already in `custom.scss` | Consistency; zero new code |
| Timeline-style layout | Custom CSS with absolute positioning | Simple `dl`/`dt`/`dd` or table or `.cv-entry` divs | Less fragile, works in all browsers |
| External link icons | Icon font or SVG sprite | Bootstrap Icons already loaded via Quarto | `bi-box-arrow-up-right` available if needed |
| PDF rendering in browser | PDF.js or iframe embed | Not needed — PDF download link is sufficient per CV-01 decision | CV-01 means "viewable in browser as HTML," not as embedded PDF |

**Key insight:** This phase is content authoring, not engineering. Every visual and interactive element needed already exists in the project. The value is in accurately transcribing CV data and making thoughtful layout choices within the existing design system.

---

## Common Pitfalls

### Pitfall 1: `download` attribute browser behavior
**What goes wrong:** Omitting the `download` HTML attribute from the PDF link causes browsers to open the PDF inline rather than prompting a save dialog.
**Why it happens:** Default browser behavior for `<a href="file.pdf">` is to navigate to/render the PDF if the browser can handle it.
**How to avoid:** Add `download` (or `download="RJM-CV-v.oct25.pdf"`) to the anchor tag.
**Warning signs:** Clicking "Download CV" opens a new tab with the PDF rather than a download dialog.

### Pitfall 2: Quarto re-rendering breaks manual HTML
**What goes wrong:** Quarto's Markdown processor can mangle inline HTML blocks that aren't properly fenced.
**Why it happens:** Markdown parsers treat some HTML as Markdown context.
**How to avoid:** Use `:::` div fences for block-level custom HTML, and keep inline HTML simple (no complex nesting). The existing `.pub-entry` pattern in `publications.qmd` is the proven safe pattern — follow it exactly.
**Warning signs:** Button or div appears with unexpected line breaks or extra `<p>` wrapping in the rendered output.

### Pitfall 3: LinkedIn URL unknown
**What goes wrong:** The contact page plan includes a LinkedIn link, but no LinkedIn URL was provided by the user in CONTEXT.md or anywhere in the existing code.
**Why it happens:** LinkedIn is listed as "new" in CONTEXT.md — it's not in `index.qmd`'s existing profile links.
**How to avoid:** The planner must flag this as a required input from the user before the contact page task can be marked complete. The task should have a placeholder (`LINKEDIN_URL_TBD`) that the user replaces.
**Warning signs:** Deploying a broken or incorrect LinkedIn link.

### Pitfall 4: CV sections scope creep
**What goes wrong:** The full PDF CV has 10+ sections. Including all of them in the HTML CV violates the locked decision to show only four sections.
**Why it happens:** The content is available and it's tempting to be "complete."
**How to avoid:** The locked decision is four sections: Education, Academic Positions, Publications (summary), Awards & Fellowships. Conference participation, courses taught, students supervised, service, and manuscript review belong in the PDF only.
**Warning signs:** cv.qmd exceeds ~100 lines of visible content.

### Pitfall 5: Publications count drift
**What goes wrong:** The count "22 peer-reviewed articles, 1 book chapter, 3 working papers" is hardcoded on the CV page but could become stale if publications.yml is updated.
**Why it happens:** There is no dynamic count mechanism in a static Quarto site.
**How to avoid:** Document in the task that this count is manually maintained and must be updated in sync with publications.yml. This is a known, accepted limitation of the static approach.

### Pitfall 6: Quarto publish conflict (known from Phase 2)
**What goes wrong:** `quarto publish gh-pages --no-prompt` fails when a multiple-publish configuration exists.
**Why it happens:** Project history: Phase 2 documented this and established the workaround.
**How to avoid:** Use the git worktree push workaround established in Phase 2 (documented in STATE.md decisions). Do not attempt to fix this again — use the known workaround.

---

## Code Examples

Verified patterns from existing project source files:

### CV download button (adapting `.pub-buttons` pattern from `publications.qmd`)
```html
<!-- Source: publications.qmd lines 12-14 — established button pattern -->
<div class="pub-buttons" style="margin-bottom: 2rem;">
<a href="RJM-CV-v.oct25.pdf" class="btn btn-outline-secondary btn-sm" download>
  Download CV (PDF)
</a>
</div>
```

### Quarto div fence for styled sections (from `publications.qmd`)
```markdown
<!-- Source: publications.qmd lines 9-17 — established .pub-entry pattern -->
::: {.pub-entry}
content here
:::
```

### Contact mailto link (from `index.qmd`)
```markdown
<!-- Source: index.qmd line 10 — confirmed email and format -->
[rmcgrat2@gmu.edu](mailto:rmcgrat2@gmu.edu)
```

### Profile link URLs (from `index.qmd` lines 13-20 — confirmed)
```
Google Scholar: https://scholar.google.com/citations?hl=en&user=kQEBg6wAAAAJ
ORCID:          https://orcid.org/0000-0001-8963-3231
GitHub:         https://github.com/rjm328
LinkedIn:       (not yet in codebase — user must supply)
```

### Schar School link (from index.qmd subtitle — confirmed institution)
```
Schar School URL: https://schar.gmu.edu
```
The subtitle in `index.qmd` uses "Schar School of Policy and Government" as the full name.

### Awards & Fellowships — recommended grouping for CV page

The CONTEXT.md decision says "Awards & Fellowships" is one of the four CV sections. From the PDF, there are three distinct sub-categories to present clearly:

**Research Awards:**
- State Politics and Policy Quarterly Award (APSA), 2015 — for "Experts, Amateurs, and Bureaucratic Influence in the American States"

**Teaching Awards:**
- Outstanding Teaching Award, Schar School, 2023
- OSCAR Mentoring Excellence Award, George Mason University, 2022

**Grants & Fellowships (selective — major items):**
- NSF RIDIR / DAPPR grant, 2016–2019, $808,128
- Robert Wood Johnson Foundation Health Policy Research Fellowship, 2013–2015
- American Governor Research Grant (Eagleton/Rutgers), 2012, $4,980
- Graduate College Summer Fellowship, University of Iowa, 2009
- NSF EITM summer institute awards (2009, 2008)
- FLAS Summer Fellowship, 2005
- Political Science Graduate Fellowship, University of Iowa, 2004–2010

The planner should decide whether to show all fellowship entries or a curated subset. All entries are present in the PDF for reference.

---

## State of the Art

| Old Approach | Current Approach | Notes |
|--------------|------------------|-------|
| Embedding PDF with `<iframe>` | HTML page + download link | Locked decision: HTML CV is the browser view, PDF is download |
| Contact forms | Direct mailto: link | Locked from Phase 1 — GitHub Pages has no server-side processing |
| Separate data YAML for CV sections | Direct Markdown content | YAML data approach is overkill for a single-author static page |

**Not applicable / stable:** Quarto's core rendering pipeline, Bootstrap 5 grid, SCSS compilation — all unchanged from Phase 1 and Phase 2.

---

## Open Questions

1. **LinkedIn URL**
   - What we know: LinkedIn is included in the locked decisions for the contact page
   - What's unclear: The actual LinkedIn profile URL — it does not appear anywhere in the existing codebase
   - Recommendation: Task must prompt user to provide this URL before contact.qmd is finalized; use placeholder `https://www.linkedin.com/in/YOURHANDLE` in the initial draft

2. **Office hours content**
   - What we know: CONTEXT.md says "office hours / availability note" goes on the contact page, with discretion on format
   - What's unclear: Whether the user has specific posted hours or prefers "by appointment"
   - Recommendation: Default to "Office hours by appointment" — safe, common for academic websites, easily updated. Task should include a note to the user to update this text.

3. **Book Reviews on CV page**
   - What we know: Book reviews appear on PDF page 3, between Book Chapter and Research Awards. They are not in `publications.yml`.
   - What's unclear: Should the browser CV include a Book Reviews section, or keep strictly to the four locked sections?
   - Recommendation: Omit from browser CV (it's not one of the four locked sections). The book reviews remain accessible via PDF download. If the user wants them added, that's a minor revision after review.

---

## Validation Architecture

`nyquist_validation` is `true` in `.planning/config.json`, so this section is required.

### Test Framework

| Property | Value |
|----------|-------|
| Framework | None (static site — no test framework installed) |
| Config file | none |
| Quick run command | `quarto render && open _site/cv.html` (manual visual check) |
| Full suite command | `quarto render` (build all pages, check for errors) |

### Phase Requirements — Test Map

| Req ID | Behavior | Test Type | Automated Command | File Exists? |
|--------|----------|-----------|-------------------|-------------|
| CV-01 | CV page renders in browser with all four sections | smoke | `quarto render cv.qmd` (exits 0 = pass) | ❌ Wave 0: cv.qmd content to be written |
| CV-02 | PDF download link present and file exists | smoke | `ls RJM-CV-v.oct25.pdf && grep -q 'download' _site/cv.html` | ❌ Wave 0: cv.qmd content to be written |
| CONT-01 | Email address displayed on contact page | smoke | `grep -q 'rmcgrat2@gmu.edu' _site/contact.html` | ❌ Wave 0: contact.qmd content to be written |
| CONT-02 | Profile links present on contact page | smoke | `grep -q 'orcid.org' _site/contact.html && grep -q 'scholar.google.com' _site/contact.html` | ❌ Wave 0: contact.qmd content to be written |

All four requirements are manual-visual for layout quality (does it look right?) and automated-smoke for presence (does it exist?). The smoke tests run in < 5 seconds.

### Sampling Rate
- **Per task commit:** `quarto render [file].qmd` — verify no build errors
- **Per wave merge:** `quarto render` — full site build, all pages
- **Phase gate:** `quarto render` green + visual review of cv.html and contact.html before `/gsd:verify-work`

### Wave 0 Gaps
- [ ] No test infrastructure to install — this is a static Quarto site
- [ ] cv.qmd — must be authored (Wave 0 creates it)
- [ ] contact.qmd — must be authored (Wave 0 creates it)
- [ ] custom.scss additions for `.cv-section`, `.cv-entry`, `.cv-entry-title`, `.cv-entry-meta`

---

## Sources

### Primary (HIGH confidence)
- `RJM-CV-v.oct25.pdf` (project root) — all CV data extracted directly; 7 pages read
- `publications.yml` (project root) — publication counts and types confirmed
- `custom.scss` (project root) — all color values, class names, and typography confirmed
- `index.qmd` (project root) — all profile link URLs confirmed
- `publications.qmd` (project root) — established HTML patterns for buttons and div fences
- `_quarto.yml` (project root) — navbar structure and global format settings confirmed
- `.planning/phases/03-cv-and-contact/03-CONTEXT.md` — all locked decisions read

### Secondary (MEDIUM confidence)
- Quarto documentation (general knowledge, stable API): `download` attribute behavior on `<a>` tags is standard HTML5, not Quarto-specific
- Bootstrap 5 grid system: well-documented, stable — `.row`/`.col-*` behavior reliable

### Tertiary (LOW confidence)
- LinkedIn URL: unknown, not in codebase — user must supply
- Schar School office hours for Robert McGrath: not researched — user must supply or approve default "by appointment" text

---

## Metadata

**Confidence breakdown:**
- CV content extraction: HIGH — read directly from the PDF, all 7 pages
- Standard stack: HIGH — all dependencies already installed and in use
- Architecture: HIGH — follows proven patterns from Phase 1 and Phase 2
- Common pitfalls: HIGH — derived from existing code and Phase 2 documented lessons
- Contact page LinkedIn URL: LOW — unknown, must be supplied by user

**Research date:** 2026-03-22
**Valid until:** Stable indefinitely (static site, no fast-moving dependencies)
