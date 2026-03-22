# Phase 5: Hero & Design Polish - Context

**Gathered:** 2026-03-22
**Status:** Ready for planning

<domain>
## Phase Boundary

Redesign the landing page hero block (shortened subtitle + Director info) and refine typography, spacing, and colors across all four pages. No structural changes to page content — polish only.

</domain>

<decisions>
## Implementation Decisions

### Hero subtitle redesign
- Shorten subtitle from full title+department+university to: "Associate Professor, Schar School of Policy and Government, George Mason University"
- Director info on a separate line below with visual spacing: "Director of PhD Programs in Political Science & Public Policy"
- Keep trestles template (photo-left, text-right on desktop)
- Bio paragraph and Research Interests section stay on landing page — no content moves

### Color palette fine-tuning
- Keep warm neutrals overall — no palette overhaul
- Improve link contrast: terracotta #8B5E3C may need darkening or more saturation against cream #FAF8F5
- Improve heading/text contrast: dark text #3D3632 may need to go darker for better hierarchy
- Use gold accent #C4813D more consistently — currently underused
- Claude has discretion on exact hex adjustments; user reviews live result

### Typography and spacing
- Direction: tighter, more information-dense (current spacing is too generous)
- Reference: Distill.pub original — tight but readable, clear hierarchy, minimal decoration
- Apply across ALL four pages equally (Home, Publications, CV, Contact)
- Better font size hierarchy between headings, subheadings, and body text
- Reduce margins/padding where they create unnecessary whitespace

### Claude's Discretion
- Exact hex values for palette adjustments (within the warm neutrals family)
- Specific margin/padding reductions per element
- Font size scale adjustments
- Whether to adjust line-height for tighter body text
- Any responsive breakpoint adjustments needed after spacing changes

</decisions>

<code_context>
## Existing Code Insights

### Reusable Assets
- `custom.scss`: All current styles — palette variables, typography, pub/cv classes (105 lines)
- `index.qmd`: Trestles template with subtitle in YAML frontmatter — subtitle is a single string field
- `_quarto.yml`: Site-level config with navbar colors

### Established Patterns
- cosmo base theme + custom.scss overlay
- SCSS variables for palette: `$body-bg`, `$body-color`, `$link-color`, `$navbar-bg`, `$navbar-fg`, `$navbar-hl`, `$footer-bg`
- DM Sans for headings (600 weight), Source Serif 4 for body
- `.quarto-container { max-width: 720px }` for content width

### Integration Points
- `index.qmd` `subtitle:` field controls the hero subtitle text — changing it is a YAML edit
- Director info needs to be added below subtitle — may require custom HTML in index.qmd body or a Quarto `about:` template modification
- Palette changes in `custom.scss` apply globally via SCSS variables
- Typography changes cascade through Bootstrap's cosmo theme overrides

</code_context>

<specifics>
## Specific Ideas

- Distill.pub's tight, information-dense feel is the target — not magazine-style generous whitespace
- The subtitle change is content-level (YAML frontmatter edit) but Director info line may need custom handling since trestles template doesn't have a "secondary subtitle" field
- Palette adjustments should maintain the warm character while improving readability and visual hierarchy

</specifics>

<deferred>
## Deferred Ideas

None — discussion stayed within phase scope

</deferred>

---

*Phase: 05-hero-design-polish*
*Context gathered: 2026-03-22*
