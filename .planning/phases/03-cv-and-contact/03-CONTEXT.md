# Phase 3: CV and Contact - Context

**Gathered:** 2026-03-22
**Status:** Ready for planning

<domain>
## Phase Boundary

CV page displaying the full academic CV in clean HTML (parsed from PDF), with a prominent PDF download button. Contact page with email, professional profile links (including LinkedIn), office address, department affiliation, and office hours. Both pages match the existing Distill-inspired warm neutral design.

</domain>

<decisions>
## Implementation Decisions

### CV browser presentation
- HTML CV built from structured data extracted from `RJM-CV-v.oct25.pdf`
- Claude parses the PDF and populates the HTML sections — user reviews before publishing
- Four sections on the CV page: Education, Academic Positions, Publications, Awards & Fellowships
- Publications section is a summary with link to /publications.html (not a full duplicate list) — avoids maintenance duplication
- Summary shows counts: "22 peer-reviewed articles, 1 book chapter, 3 working papers" with a "View full publications" link

### PDF download
- Prominent download button at top of CV page, before content sections
- Terracotta outline style (`btn-outline-secondary` with `#8B5E3C`) — consistent with publication DOI/PDF buttons
- Links to `RJM-CV-v.oct25.pdf` (already in repo)

### Contact page content
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

</decisions>

<code_context>
## Existing Code Insights

### Reusable Assets
- `custom.scss`: Warm neutrals palette, `.pub-buttons .btn-outline-secondary` terracotta button style — reuse for CV download button
- `_quarto.yml`: Navbar already has "CV" and "Contact" links pointing to cv.qmd and contact.qmd
- `cv.qmd` and `contact.qmd`: Stub pages exist with placeholder text — will be replaced
- `publications.yml`: 26 entries with type counts — CV page can reference this for the publications summary
- `index.qmd`: Already has ORCID, Google Scholar, GitHub links in trestles template — contact page reuses these URLs
- `RJM-CV-v.oct25.pdf`: The actual CV PDF exists in project root — ready for both parsing and download

### Established Patterns
- cosmo base theme + custom.scss overlay
- 720px max-width centered content column
- Source Serif 4 for body, DM Sans for headings
- `.pub-buttons .btn-outline-secondary` for terracotta action buttons

### Integration Points
- cv.qmd and contact.qmd already linked in navbar — just need content replacement
- CV download button links to PDF already in repo
- Profile links on contact page use same URLs as index.qmd trestles template
- Publications summary on CV page links to /publications.html

</code_context>

<specifics>
## Specific Ideas

- CV page should feel like a polished digital version of an academic CV, not a generic resume
- Contact page should be professional but approachable — an academic peer or journalist should feel comfortable reaching out
- The PDF download is the "official" version; the HTML is the convenient browser view

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 03-cv-and-contact*
*Context gathered: 2026-03-22*
