# Phase 04: QA and Launch - Research

**Researched:** 2026-03-22
**Domain:** Site validation — DOI verification, data repository lookup, cross-reference checking, mobile rendering
**Confidence:** HIGH (site files read directly; DOIs verified live against CrossRef API)

---

<user_constraints>
## User Constraints (from CONTEXT.md)

### Locked Decisions

**Custom domain:** QA runs against https://rjm328.github.io/ (current deployment). Custom domain not yet purchased — will be added later as a standalone task. Success criterion 3 (custom domain HTTPS) is deferred — does not block launch.

**Launch scope:** No formal announcement (no email draft, no social media post). Site is "launched" when QA passes — user shares the link informally as needed.

**DOI verification:** Verify ALL 22 DOI links via CrossRef API — confirm each resolves to the correct paper title. Do not spot-check; verify every single one.

**Data repository links:** Populate `data_url` fields in publications.yml for papers that have Dataverse/ICPSR datasets. Look up actual repository URLs during execution. Papers without associated datasets keep `data_url: ""`. This will cause [Data] buttons to appear on applicable entries.

**PDF links:** Accept empty `pdf` fields for v1 — no author-accepted PDFs to upload. PDF buttons will appear automatically if/when `pdf` fields are populated later.

**Mobile testing:** Browser devtools at 375px width is acceptable. No real-device testing required. Check all 4 pages: Home, Publications, CV, Contact.

**CV-Publications cross-check:** Verify CV page publication counts match publications.yml entry counts. Confirm no entries exist in the CV PDF but are missing from publications.yml.

### Claude's Discretion

- Order of QA checks (which pages/links first)
- How to report QA results (table, checklist, or narrative)
- Whether to fix minor issues inline or flag for user decision
- How to handle DOI links that return non-200 HTTP status

### Deferred Ideas (OUT OF SCOPE)

- Custom domain configuration — after domain purchase, configure via GitHub Pages settings + DNS
- PDF self-hosting — upload author-accepted manuscripts when available
- Launch announcement — email/social media drafts if user wants formal announcement later

</user_constraints>

---

<phase_requirements>
## Phase Requirements

| ID | Description | Research Support |
|----|-------------|-----------------|
| IDEN-01 | About/bio page with photo, affiliation, background | Home page renders; profile.jpg confirmed present in _site |
| IDEN-02 | Homepage research interests summary (3-5 sentences) | index.qmd has 4-sentence research interests paragraph |
| IDEN-03 | Plain-language summary on each publication | All 26 entries in publications.yml have summary field populated |
| PUBL-01 | Publications grouped by type (articles, chapters, working papers) | publications.qmd has 3 sections; renders correctly |
| PUBL-02 | Each publication links to DOI and/or PDF where available | 22 DOI hrefs confirmed in rendered HTML |
| PUBL-03 | Working papers as distinct section | .working-papers CSS class wired; section present |
| PUBL-04 | Publications link to Dataverse/ICPSR datasets where applicable | data_url fields all empty — research task to populate |
| CV-01 | CV page viewable in browser | cv.qmd renders; content verified |
| CV-02 | CV downloadable as PDF | RJM-CV-v.oct25.pdf confirmed in _site at correct path |
| CONT-01 | Contact page displays email | mailto:rmcgrat2@gmu.edu present in contact.html |
| CONT-02 | Contact page links to ORCID, Google Scholar, other profiles | ORCID, Scholar, GitHub, LinkedIn hrefs all present |
| DSGN-01 | Distill.pub-inspired design | custom.scss implements; visual check during mobile QA |
| DSGN-02 | Responsive design on mobile and desktop | custom.scss has mobile media query; devtools check planned |
| DSGN-03 | Clean navigation with correct items | _quarto.yml defines Home, Publications, CV, Contact |
| INFR-01 | Quarto static site on GitHub Pages | Deployed to https://rjm328.github.io/ |
| INFR-02 | Custom domain with HTTPS | DEFERRED — domain not purchased yet |

</phase_requirements>

---

## Summary

Phase 4 is a pure validation phase — no new features are built. The goal is to confirm that everything constructed in Phases 1-3 is correct before sharing the URL. Research involved directly reading all site source files, verifying all 22 DOIs live against the CrossRef API, cataloguing internal link structures, and conducting an exhaustive search for Dataverse/ICPSR data repository URLs associated with the publications.

The CrossRef verification revealed that all 22 DOIs resolve correctly and all returned titles match the expected paper titles. One minor variant was found: CrossRef returns "Rulemaking Speed in the US States" (no periods in "US") while publications.yml has "U.S." — this is a CrossRef metadata formatting difference, not an error in the site. The DOI itself is correct and resolves to the right paper.

The data repository search produced no publicly-indexable URLs for any of McGrath's papers. Extensive searching across Harvard Dataverse, OpenICPSR, poliscidata.com, and journal Dataverse collections found no indexed replication datasets under McGrath's name. The executor must look these up directly through journal article pages (which require institutional access) or through the author's institutional page at mcgrath.gmu.edu (currently unreachable, likely behind GMU auth).

**Primary recommendation:** Run DOI verification first (fastest, highest-risk item from Phase 2 history), then data_url lookup (requires institutional access or targeted search), then systematic link-checking, then mobile devtools review. Report QA results as a checklist table for easy sign-off.

---

## DOI Inventory and CrossRef Verification (Pre-Research)

All 22 DOIs were verified live against `https://api.crossref.org/works/{doi}` during research. Results:

| # | DOI | Expected Title | CrossRef Match | Notes |
|---|-----|----------------|---------------|-------|
| 1 | 10.1086/736866 | High Hurdles: Legislative Professionalism... | PASS | Exact match |
| 2 | 10.1111/lsq.70052 | Shared Pain, Common Purpose... | PASS | Exact match |
| 3 | 10.1002/pam.22660 | Occupational Licensing and Income Inequality... | PASS | Capitalization variant only |
| 4 | 10.1093/publius/pjaf021 | American Federalism and Health Policy Spillovers... | PASS | Exact match |
| 5 | 10.1177/10659129231220025 | Listen to Me: Quality of Communication... | PASS | Exact match |
| 6 | 10.1093/jopart/muad013 | Rulemaking Speed in the U.S. States | PASS | CrossRef returns "US" not "U.S." — DOI correct |
| 7 | 10.1093/jopart/muz030 | Does Partisan Conflict Lead to Increased... | PASS | Exact match |
| 8 | 10.1111/lsq.12235 | Party Effects in State Legislative Committees | PASS | Exact match |
| 9 | 10.1111/lsq.12228 | A Race for the Regs: Unified Government... | PASS | Exact match |
| 10 | 10.1017/psrm.2015.80 | Veto Override Requirements and Executive Success | PASS | Exact match |
| 11 | 10.1215/03616878-3702794 | Directing Discipline: State Medical Board... | PASS | Exact match |
| 12 | 10.1093/jopart/muw038 | Experts, Amateurs, and Bureaucratic Influence... | PASS | Exact match |
| 13 | 10.1111/lsq.12138 | Retrospective Congressional Oversight... | PASS | Exact match |
| 14 | 10.1080/07343469.2016.1196267 | The Marginality Hypothesis and Supreme Court... | PASS | Exact match |
| 15 | 10.1017/S0143814X15000367 | Congress as manager: oversight hearings... | PASS | Capitalization variant only |
| 16 | 10.1111/lsq.12121 | Constraining a Shadowy Future: Enacting APAs... | PASS | Exact match |
| 17 | 10.1111/lsq.12089 | Gubernatorial Veto Powers and the Size... | PASS | Exact match |
| 18 | 10.1177/1532440013497972 | Legislatures, Courts, and Statutory Control... | PASS | Exact match |
| 19 | 10.1111/lsq.12018 | Congressional Oversight Hearings and Policy Control | PASS | Exact match |
| 20 | 10.1111/puar.12075 | The Rise and Fall of Radical Civil Service Reform... | PASS | Exact match |
| 21 | 10.1177/1065912910364218 | Making Rules about Rulemaking... | PASS | Capitalization variant only |
| 22 | 10.1177/1532673X10388143 | Electoral Competition and the Frequency... | PASS | Exact match |

**Finding:** All 22 DOIs pass CrossRef verification. No hallucinated or wrong-paper DOIs found. The Phase 2 DOI correction work was successful.

**Confidence: HIGH** — Verified live against CrossRef API during research.

---

## Data Repository Investigation

### What Was Found

Extensive search across Harvard Dataverse, OpenICPSR, poliscidata.com, journal Dataverse collections (LSQ, JPART, Journal of Public Policy), and web search returned **no publicly indexed replication datasets** for McGrath's papers.

The author's institutional page at `mcgrath.gmu.edu` is unreachable (connection refused — likely behind GMU authentication). The GMU Schar School profile at `schar.gmu.edu/profiles/rmcgrat2` lists no data repository links.

### Replication Landscape for These Journals

Political science journals adopted mandatory replication data policies at different times:
- **Legislative Studies Quarterly (LSQ):** Has a Harvard Dataverse collection (`dataverse.harvard.edu/dataverse/lsq`) but deposit was not uniformly required for articles published before ~2018. McGrath's LSQ articles from 2011-2016 likely predate mandatory deposit requirements.
- **JPART (Oxford):** Has a replication data requirement but timing of adoption unclear. The 2020 and 2023 articles may have deposits but these were not findable via web search.
- **Journal of Public Policy (Cambridge):** Has a Dataverse collection (`dataverse.harvard.edu/dataverse/JPublicPolicy`) with stated data sharing requirements. The Marvel-McGrath 2016 article may have a deposit.
- **Publius, PSRM, PRQ, JHPPL, SPPQ, Congress & Presidency, APR:** Varying deposit requirements.

### Executor Guidance for data_url Population

The executor should follow this lookup strategy during plan execution:

1. **Try journal DOI page first:** Visit the published article page (e.g., `academic.oup.com/jpart/article/...`) and look for a "Supplementary Data" or "Data Availability" section. Many replication links appear there, not in search engines.

2. **Try Harvard Dataverse search:** `https://dataverse.harvard.edu/dataverse/lsq` and search for "McGrath" — the LSQ Dataverse may have deposits for the 2015, 2016, and 2019 LSQ articles.

3. **Try OpenICPSR search:** `https://www.openicpsr.org/openicpsr/search/` — search "McGrath" and "rulemaking" or specific paper titles.

4. **If not found:** Leave `data_url: ""` — do not fabricate URLs. The [Data] button correctly does not appear when data_url is empty.

### Papers Most Likely to Have Data Deposits

Based on journal data policies and paper empirical content (HIGH likelihood):

| Paper | Year | Journal | Reason |
|-------|------|---------|--------|
| Boushey & McGrath, "Rulemaking Speed in the U.S. States" | 2023 | JPART | Oxford now requires replication data; 250K+ rules dataset likely deposited |
| Boushey & McGrath, "Does Partisan Conflict Lead to Increased Bureaucratic Policymaking?" | 2020 | JPART | Oxford mandate likely applied; 150K+ rules dataset |
| McGrath & Ryan, "Party Effects in State Legislative Committees" | 2019 | LSQ | LSQ Dataverse active by 2019 |
| MacDonald & McGrath, "A Race for the Regs" | 2019 | LSQ | LSQ Dataverse active by 2019 |
| Chen, Franko & McGrath, "Occupational Licensing and Income Inequality" | 2025 | JPAM | Recent; JPAM has replication requirements |
| McGrath, "American Federalism and Health Policy Spillovers" | 2025 | Publius | Recent |

### Papers Less Likely to Have Public Data Deposits

Older articles (2011-2017) published before most political science journals required data deposits. The "Listen to Me" (2024, PRQ/Sage) article used a proprietary survey panel; data may be embargoed.

**Confidence: LOW** — No data_url values found during research. All findings are inferred from journal policies. Executor must look up during plan execution.

---

## Internal Link Audit (Pre-Research)

All links were extracted from rendered `_site/*.html` files during research.

### Navigation Links (All Pages)
All 4 pages render correctly with relative links:
- `./index.html` — Home
- `./publications.html` — Publications
- `./cv.html` — CV
- `./contact.html` — Contact

Status: **All internal navigation links verified correct in rendered HTML.**

### CV Page Specific Links
- `RJM-CV-v.oct25.pdf` — PDF download link
- `./publications.html` — "View full publications list" button

The PDF exists at `_site/RJM-CV-v.oct25.pdf` (86,791 bytes, Nov 20). Status: **PDF link confirmed valid.**

### Contact Page External Links
| URL | Purpose |
|-----|---------|
| `https://orcid.org/0000-0001-8963-3231` | ORCID profile |
| `https://scholar.google.com/citations?hl=en&user=kQEBg6wAAAAJ` | Google Scholar |
| `https://github.com/rjm328` | GitHub |
| `https://www.linkedin.com/in/rjmcgrath/` | LinkedIn |
| `https://schar.gmu.edu` | Schar School affiliation |
| `mailto:rmcgrat2@gmu.edu` | Email |

### Homepage External Links
| URL | Purpose |
|-----|---------|
| `https://orcid.org/0000-0001-8963-3231` | ORCID (sidebar) |
| `https://scholar.google.com/citations?hl=en&user=kQEBg6wAAAAJ` | Google Scholar (sidebar) |
| `https://github.com/rjm328` | GitHub (sidebar) |
| `mailto:rmcgrat2@gmu.edu` | Email (sidebar) |

### Publications Page
- 22 DOI hrefs confirmed in rendered HTML — all match publications.yml
- No data_url hrefs present (all empty — expected)
- No pdf hrefs present (all empty — expected, v1 decision)

**Confidence: HIGH** — Links extracted directly from rendered `_site/` HTML.

---

## CV vs Publications Cross-Check (Pre-Research)

### Count Verification

| Type | publications.yml | cv.qmd statement | Match |
|------|-----------------|-----------------|-------|
| Peer-reviewed articles | 22 | "22 peer-reviewed articles" | PASS |
| Book chapters | 1 | "1 book chapter" | PASS |
| Working papers | 3 | "3 working papers and works in progress" | PASS |

**Finding:** Counts match exactly. No discrepancy found.

### PDF CV Coverage

The CV PDF (`RJM-CV-v.oct25.pdf`) was not directly parsed during research (requires PDF extraction tooling). The executor must compare publications.yml entries against the PDF CV during plan execution.

Known information about CV PDF content from Phase 3:
- Book reviews are in the CV PDF under Publications but are NOT in publications.yml (by design — book reviews are not tracked in the YAML)
- The cv.qmd explicitly notes book reviews separately from the YAML-driven count
- Working papers in the CV PDF should match the 3 working-paper entries in publications.yml

**Confidence: MEDIUM** — Count cross-check done at source level; PDF extraction is an execution-time task.

---

## Mobile Rendering Checklist (Pre-Research)

DevTools simulation at 375px width (iPhone SE viewport) is the accepted standard per user decision.

### What to Check Per Page

| Page | Check | Why |
|------|-------|-----|
| Home (index.html) | Profile photo above bio text (not side-by-side) | Trestles template collapses at mobile; custom.scss adds `margin-top: 1.5rem` to `.about-image` |
| Home | Sidebar links (email, scholar, ORCID, GitHub) visible and tappable | Icon buttons in Quarto sidebar collapse to inline at mobile |
| Publications | Publication entries readable; DOI buttons don't overflow | `.pub-buttons` uses `flex-wrap: wrap` — should handle narrow widths |
| Publications | Working papers gold accent bar visible | `.working-papers` border-left persists at mobile |
| CV | PDF download button visible | `.pub-buttons` wraps at narrow widths |
| CV | Two-column `.cv-entry` layout (title + date) collapses gracefully | Bootstrap grid handles this |
| Contact | Buttons (ORCID, Scholar, GitHub, LinkedIn) wrap cleanly | `.pub-buttons` flex-wrap applies here too |
| All pages | Navigation bar collapses to hamburger menu | Cosmo/Bootstrap responsive navbar |
| All pages | No horizontal scrollbar | 720px `.quarto-container` max-width; should fit in 375px with padding |

### Known CSS Fixes Already Applied

The custom.scss already includes:
```scss
@media (max-width: 768px) {
  .about-image {
    margin-top: 1.5rem;
  }
}
```
This was applied in Phase 1 specifically for the Trestles template mobile fix.

**Confidence: MEDIUM** — CSS reviewed directly; rendering verified only at build time, not in browser at 375px yet.

---

## Architecture Patterns for QA Phase

### DOI Verification Pattern (Established in Phase 2)

```bash
# CrossRef API — returns JSON with title, author, journal metadata
curl "https://api.crossref.org/works/10.1086/736866" | python3 -c "
import json,sys
data = json.load(sys.stdin)
print(data['message']['title'][0])
"
```

**Critical lesson from Phase 2:** HTTP 200 from doi.org does NOT mean the DOI points to the correct paper — hallucinated DOIs resolved successfully but to wrong papers. Title matching via CrossRef API is required, not just HTTP status checking.

The CrossRef API:
- Endpoint: `https://api.crossref.org/works/{doi_suffix}` (suffix only, no `https://doi.org/` prefix)
- Rate limit: 50 requests/second for polite pool (add `mailto=` query param)
- Returns: title, authors, container-title (journal), published-print date
- Does not require authentication

**Polite pool URL pattern:**
```
https://api.crossref.org/works/10.1086/736866?mailto=rmcgrat2@gmu.edu
```

### Quarto Build Verification

```bash
# Existing script in scripts/check-render.sh
bash scripts/check-render.sh

# Or directly:
quarto render --no-cache 2>&1 | grep -i "error\|warning"
```

### GitHub Pages Deployment

The worktree workaround established in Phase 2 is the canonical deploy method:
```bash
quarto publish gh-pages --no-prompt
# If that fails with multiple-publish error, use git worktree push to gh-pages branch
```

---

## Don't Hand-Roll

| Problem | Don't Build | Use Instead | Why |
|---------|-------------|-------------|-----|
| DOI title verification | Manual HTTP checks | CrossRef API `api.crossref.org/works/{doi}` | Returns structured metadata; HTTP 200 does not prove correct paper |
| Finding data repositories | Scraping journal pages | Direct article page visit + Dataverse search | Data URLs are not web-indexed; must access paywalled article pages |
| Mobile rendering | Custom CSS breakpoints | Existing custom.scss + Bootstrap responsive grid | Already implemented; devtools testing is the verification step |
| CV PDF content extraction | PDF parsing code | Manual visual comparison of PDF vs publications.yml | PDF is 86KB; fastest to read directly |

---

## Common Pitfalls

### Pitfall 1: Trusting HTTP Status Over CrossRef Title Match
**What goes wrong:** A DOI returns HTTP 200 but resolves to a different paper than intended. This happened with all original DOIs in Phase 2 (they were hallucinated and all successfully resolved to wrong papers).
**Why it happens:** doi.org resolves any valid DOI structure, including DOIs that belong to entirely different authors or papers.
**How to avoid:** Always verify the returned CrossRef title matches the expected paper title. HTTP 200 is necessary but not sufficient.
**Warning signs:** Executor skips CrossRef verification and only checks HTTP status codes.

### Pitfall 2: Marking data_url Empty When a Deposit Exists
**What goes wrong:** A replication dataset exists on Dataverse/OpenICPSR but wasn't found during research, so data_url stays empty and the [Data] button never appears.
**Why it happens:** Replication data URLs are not well-indexed by web search engines; they live inside paywalled journal article pages.
**How to avoid:** Access the actual published article pages (requires institutional access or visiting campus network) to check for supplementary materials sections. Check LSQ Dataverse collection directly.
**Warning signs:** Executor gives up after web search returns no results.

### Pitfall 3: Declaring QA Complete Without Checking Deployed Site
**What goes wrong:** Local build passes but the deployed site at rjm328.github.io has stale content, a broken GitHub Pages deployment, or relative paths that break under the user site URL scheme.
**Why it happens:** Quarto's `quarto publish gh-pages` sometimes fails silently or leaves the gh-pages branch in a mixed state.
**How to avoid:** After any deployment, verify the live URL https://rjm328.github.io/ loads correctly, not just the local `_site/` directory.
**Warning signs:** Executor only checks `_site/` HTML and doesn't load the actual deployed URL.

### Pitfall 4: Missing the CV PDF on Mobile
**What goes wrong:** The CV download button works on desktop but is hard to tap or not visible on mobile at 375px.
**Why it happens:** The `download` attribute on the `<a>` tag works correctly, but the button may overflow or be clipped at narrow widths.
**How to avoid:** Explicitly check the CV page at 375px in devtools — the `.pub-buttons` flex-wrap should keep the button tappable.

---

## Validation Architecture

### Test Framework

| Property | Value |
|----------|-------|
| Framework | None — this is a manual QA phase with scripted verification steps |
| Config file | `scripts/check-render.sh` (build check only) |
| Quick run command | `bash /path/to/scripts/check-render.sh` |
| Full suite command | N/A — QA tasks produce a QA report, not an automated test suite |

### Phase Requirements → Verification Map

This phase validates all 16 v1 requirements. Verification type is primarily **manual check** + **API call** rather than automated test.

| Req ID | Behavior | Verification Type | Method |
|--------|----------|-------------------|--------|
| IDEN-01 | Photo + affiliation visible | Visual check | Load index.html at 375px and 1280px |
| IDEN-02 | 3-5 sentence research interests | Content count | Count sentences in rendered index.html |
| IDEN-03 | Plain-language summaries on all entries | Content check | Grep pub-summary in publications.html; count = 26 |
| PUBL-01 | Publications grouped by type | Visual + HTML check | Confirm 3 sections in publications.html |
| PUBL-02 | DOI links work | API verification | CrossRef API title match for all 22 DOIs |
| PUBL-03 | Working papers distinct section | Visual + CSS check | .working-papers class present; gold bar renders |
| PUBL-04 | Data links where applicable | Content + URL check | data_url populated for papers with deposits; [Data] buttons appear |
| CV-01 | CV viewable in browser | Visual check | Load cv.html; confirm content renders |
| CV-02 | CV PDF downloadable | File check + click | Confirm PDF at path; click download button |
| CONT-01 | Email displayed | HTML check | Confirm mailto: in contact.html |
| CONT-02 | Profile links present | HTML + live check | Click ORCID, Scholar, GitHub, LinkedIn links |
| DSGN-01 | Distill.pub-inspired design | Visual check | Compare against design references at 1280px |
| DSGN-02 | Responsive mobile design | DevTools check | 375px viewport; no horizontal overflow |
| DSGN-03 | Navigation correct | HTML check | 4 nav items confirmed in _quarto.yml and rendered HTML |
| INFR-01 | Quarto + GitHub Pages | Build + deploy check | `quarto render --no-cache`; verify live URL |
| INFR-02 | Custom domain + HTTPS | DEFERRED | Domain not purchased; deferred per CONTEXT.md |

### Wave 0 Gaps

None — this phase requires no new test files. QA is conducted through:
- Direct CrossRef API calls (curl or Python)
- Browser devtools visual inspection
- Grep/HTML inspection of `_site/` files
- Manual PDF comparison

*(No test framework setup is required for this validation phase.)*

---

## State of the Art: QA for Static Academic Sites

| Area | Standard Approach | Notes |
|------|------------------|-------|
| DOI verification | CrossRef API title match | Faster than browser-based checking; JSON response includes full metadata |
| Link checking | HTML grep + live click | Tools like `linkchecker` exist but overkill for 4-page site |
| Mobile testing | DevTools device emulation at 375px | Adequate for v1; real device preferred but not required per user decision |
| PDF availability | File presence check + browser download test | Verify both file existence AND download attribute behavior |
| GitHub Pages status | Check repository Actions tab + live URL | Deployment failures appear in GitHub Actions; check before declaring QA done |

---

## Open Questions

1. **Data repository URLs for McGrath's papers**
   - What we know: No URLs found through web search. Journal Dataverse collections exist for LSQ and JPART.
   - What's unclear: Whether replication data was deposited for any of the 22 articles, and if so, where.
   - Recommendation: During execution, access published article pages directly (via institutional VPN or campus network). If still not found, leave data_url empty for v1 and note as a follow-up task.

2. **CV PDF content vs publications.yml completeness**
   - What we know: Counts match (22/1/3). Book reviews in CV PDF are intentionally excluded from publications.yml.
   - What's unclear: Whether the exact papers in the PDF CV match the publications.yml entries (title, year, journal).
   - Recommendation: During execution, open the PDF and scan entry-by-entry against publications.yml.

3. **Live deployment health**
   - What we know: Site was deployed in Phase 3. _site/ renders correctly.
   - What's unclear: Whether the gh-pages branch is current as of end of Phase 3.
   - Recommendation: Run `quarto render --no-cache` then verify live URL during QA execution.

---

## Sources

### Primary (HIGH confidence)
- CrossRef API `api.crossref.org/works/{doi}` — 22 DOIs verified live during research
- `publications.yml` — read directly; 26 entries, 22 with DOIs, all data_urls empty
- `_site/*.html` — rendered HTML read directly; link inventory complete
- `cv.qmd` — read directly; count statement "22 peer-reviewed articles, 1 book chapter, 3 working papers" confirmed
- `custom.scss` — read directly; mobile media query and flex-wrap confirmed

### Secondary (MEDIUM confidence)
- `_quarto.yml` — navigation structure confirmed; 4 items (Home, Publications, CV, Contact)
- STATE.md and CONTEXT.md — Phase 2 lessons (DOI hallucination issue, worktree deploy workaround)
- WebSearch for journal data policies — JPART Oxford, LSQ Dataverse collection confirmed

### Tertiary (LOW confidence)
- WebSearch for data repository URLs — no McGrath-specific Dataverse/ICPSR deposits found through web search
- Journal replication deposit timeline estimates — inferred from known policy adoption dates, not verified per-article

---

## Metadata

**Confidence breakdown:**
- DOI verification findings: HIGH — all 22 verified live against CrossRef API during research
- Internal link audit: HIGH — extracted directly from rendered _site/ HTML
- CV count cross-check: HIGH — source files read directly
- Data repository URLs: LOW — not found through web search; must be looked up during execution via journal article pages
- Mobile rendering: MEDIUM — CSS reviewed; actual rendering not tested until plan execution

**Research date:** 2026-03-22
**Valid until:** 2026-04-22 (stable — no moving dependencies; DOIs and CrossRef API are durable)
