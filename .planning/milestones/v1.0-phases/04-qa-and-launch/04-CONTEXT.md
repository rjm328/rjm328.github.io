# Phase 4: QA and Launch - Context

**Gathered:** 2026-03-22
**Status:** Ready for planning

<domain>
## Phase Boundary

Verify every page, link, and cross-reference on the site. Populate Dataverse/ICPSR data_urls in publications.yml. Confirm mobile rendering. No custom domain configuration (deferred). No formal launch announcement. Once QA passes, the site is considered live at rjm328.github.io.

</domain>

<decisions>
## Implementation Decisions

### Custom domain
- QA runs against https://rjm328.github.io/ (current deployment)
- Custom domain not yet purchased — will be added later as a standalone task (GitHub Pages settings, no code changes)
- Success criterion 3 (custom domain HTTPS) is deferred — does not block launch

### Launch scope
- No formal announcement (no email draft, no social media post)
- Site is "launched" when QA passes — user shares the link informally as needed

### DOI verification
- Verify ALL 22 DOI links via CrossRef API — confirm each resolves to the correct paper title
- Do not spot-check; verify every single one (lesson learned from Phase 2 DOI issues)

### Data repository links
- Populate `data_url` fields in publications.yml for papers that have Dataverse/ICPSR datasets
- Look up actual repository URLs during execution
- Papers without associated datasets keep `data_url: ""`
- This will cause [Data] buttons to appear on applicable entries

### PDF links
- Accept empty `pdf` fields for v1 — no author-accepted PDFs to upload
- PDF buttons will appear automatically if/when `pdf` fields are populated later

### Mobile testing
- Browser devtools at 375px width is acceptable
- No real-device testing required
- Check all 4 pages: Home, Publications, CV, Contact

### CV-Publications cross-check
- Verify CV page publication counts match publications.yml entry counts
- Confirm no entries exist in the CV PDF but are missing from publications.yml

### Claude's Discretion
- Order of QA checks (which pages/links first)
- How to report QA results (table, checklist, or narrative)
- Whether to fix minor issues inline or flag for user decision
- How to handle DOI links that return non-200 HTTP status

</decisions>

<code_context>
## Existing Code Insights

### Reusable Assets
- `publications.yml`: 26 entries, 22 with DOIs, all with empty `pdf` and `data_url` fields
- `_site/`: Rendered HTML for all 4 pages — can be grepped for link validation
- `scripts/check-render.sh`: Build verification script from Phase 1
- `.pub-buttons` CSS: Data buttons will auto-appear when `data_url` is populated

### Established Patterns
- CrossRef API for DOI verification (used in Phase 2 fix — `api.crossref.org/works/{doi}`)
- `quarto render --no-cache` for build verification
- `quarto publish gh-pages --no-prompt` for deployment

### Integration Points
- publications.yml `data_url` field → publications.qmd conditional [Data] button rendering (already wired in Phase 2)
- CV page publication counts → publications.yml type counts (must match)
- All pages deployed to same gh-pages branch

</code_context>

<specifics>
## Specific Ideas

- DOI verification must use CrossRef API, not just HTTP status checks — confirm the returned title matches the expected paper (Phase 2 lesson: plausible-looking DOIs can point to wrong papers)
- Data_url population is a research task — Claude looks up Dataverse/ICPSR repositories for each paper during execution

</specifics>

<deferred>
## Deferred Ideas

- Custom domain configuration — after domain purchase, configure via GitHub Pages settings + DNS
- PDF self-hosting — upload author-accepted manuscripts when available
- Launch announcement — email/social media drafts if user wants formal announcement later

</deferred>

---

*Phase: 04-qa-and-launch*
*Context gathered: 2026-03-22*
