# Pitfalls Research

**Domain:** Academic portfolio website (social scientist, static site, Distill.pub-inspired)
**Researched:** 2026-03-22
**Confidence:** HIGH for structural/content pitfalls; MEDIUM for Quarto-specific technical pitfalls

---

## Critical Pitfalls

### Pitfall 1: The Stale CV / Publications Divergence

**What goes wrong:**
The website's publications list and the downloadable CV PDF drift out of sync over time. New papers get added to one but not the other. The CV PDF on the site may be months or years behind. Visitors (hiring committees, journalists) get contradictory information depending on which asset they consult.

**Why it happens:**
Publications live in two formats — a structured list on the publications page and a separately-maintained PDF. Each update requires touching two different systems (the site source files and the CV document), so updates are frequently made to one and not the other. The PDF is easy to forget because it's not visible in local development.

**How to avoid:**
Define a single source of truth for publications — a structured YAML or BibTeX file — and derive both the publications page and the CV from it. If the toolchain doesn't support this natively, at minimum treat the CV PDF as a first-class deploy artifact and add a deploy checklist item: "has CV PDF been regenerated?" Store the CV source (LaTeX, Word, or Google Doc) in the same repo so it's reviewed at the same time as site content.

**Warning signs:**
- The CV PDF has a "last updated" date that is older than the newest publication listed on the site
- There are papers on the publications page not in the CV, or vice versa
- The CV PDF URL is something like `/assets/cv_v3_FINAL.pdf` — versioning in the filename signals manual process

**Phase to address:**
Content architecture phase (before any content is entered). Decide the single source of truth before populating either the publications page or the CV.

---

### Pitfall 2: Dual Audience Tone Collapse

**What goes wrong:**
The site reads entirely like a journal article — dense jargon, passive voice, no explanations of why the work matters to a non-specialist. Or it swings the other direction and sounds like a press release, losing credibility with hiring committees. The About page bio is written once at a technical level and never adjusted, making it impenetrable to journalists and policymakers who are a stated target audience.

**Why it happens:**
Academics default to their trained register. Writing for "both audiences simultaneously" on the same page is genuinely hard, and most people avoid the friction by writing for one and hoping it works for both. The dual-audience problem is real: scholars are trained to communicate in a style well-suited for peer researchers, but that style falls flat for lay readers.

**How to avoid:**
Design separate entry points for each audience rather than trying to write one bio that serves both. The home page / hero section should be the general-public-facing summary (plain language, research impact framed in outcomes). The About page can go deeper. Each publication entry should have a one-sentence lay summary alongside the formal citation. This is the Distill.pub model: rich technical content that is also navigable by non-specialists.

**Warning signs:**
- The home page bio contains discipline-specific acronyms (IRB, APSR, IV regression) without explanation
- There is no lay-language description of any project
- The first sentence of the About page is "I am an Assistant Professor of..."

**Phase to address:**
Content writing phase. Flag this as a writing constraint before drafting any page copy.

---

### Pitfall 3: Over-Engineering the Initial Build

**What goes wrong:**
The project stalls at the design/tooling decision stage. The builder spends weeks comparing Quarto vs. Hugo Academic vs. Jekyll vs. custom Astro, experimenting with CSS frameworks, setting up CI/CD pipelines, and configuring deployment scripts before any actual content is on the site. The result is a technically sophisticated skeleton with no content, which continues to look unfinished as content is slowly retrofitted.

**Why it happens:**
Static site generators and modern web tooling are interesting engineering problems. There is genuine complexity in the Distill.pub aesthetic — it requires more than a default theme. This makes it easy to rationalize "one more config tweak" before starting content work. The real deliverable (a site a hiring committee can read) gets deferred indefinitely.

**How to avoid:**
Timebox the technology decision. Pick a tool, get one page live with real content within the first work session, and iterate from there. A published page with imperfect design beats an unpublished page with perfect scaffolding. Quarto is the current SOTA for academic static sites specifically because it handles the Distill.pub aesthetic natively without requiring custom CSS expertise.

**Warning signs:**
- The repo has theme files, CI configs, and custom SCSS but only placeholder content after more than one week
- More than three different static site generators have been trialed
- The "about" page still says "Lorem ipsum" after infrastructure is "complete"

**Phase to address:**
Project setup phase (first phase). Constrain scope explicitly: the only deliverable is one page live with real content.

---

### Pitfall 4: GitHub Pages / Netlify Custom Domain SSL Failure

**What goes wrong:**
After pointing a custom domain at GitHub Pages or Netlify, the HTTPS certificate either fails to generate or generates for only one variant of the domain (apex vs. www). The site becomes inaccessible or shows a browser security warning precisely when it matters most (e.g., the day the URL is shared on a job application).

**Why it happens:**
DNS changes take 24–48 hours to propagate. If HTTPS is enabled before DNS fully resolves, GitHub Pages' automated certificate provisioning fails silently. The two domain variants (apex domain and www subdomain) require different DNS record types (A records vs. CNAME), and configuring only one means the other variant redirects incorrectly or shows a cert warning.

**How to avoid:**
Configure DNS records first (both apex A records and www CNAME), wait the full 24–48 hours, then enable HTTPS enforcement in the repository settings. For GitHub Pages: apex domain requires four A records pointing to `185.199.108.153`, `185.199.109.153`, `185.199.110.153`, `185.199.111.153`; www subdomain requires a CNAME to `<username>.github.io`. Add the CNAME file to the repo root so it persists through deployments. Test both `https://yourdomain.com` and `https://www.yourdomain.com` before announcing the URL.

**Warning signs:**
- Browser padlock shows "Not Secure" after custom domain setup
- `https://www.yourdomain.com` works but `https://yourdomain.com` does not (or vice versa)
- The CNAME file is absent from the repo root after a fresh deploy

**Phase to address:**
Deployment/hosting phase. Make DNS + HTTPS verification a hard gate before moving to content work.

---

### Pitfall 5: Publications Page as a Data Dump

**What goes wrong:**
The publications page is a flat, unsorted list of citation strings — exactly the formatting from a LaTeX bibliography or Word document. No grouping by type (journal articles, book chapters, working papers), no reverse chronological sort, no links to PDFs or DOIs, no working paper / preprint distinctions. It is technically "complete" but functionally useless to both audiences.

**Why it happens:**
The content already exists in a CV document, so it gets copy-pasted directly. Converting a citation list to a structured, navigable web page requires additional work that feels redundant since the content "is already there." The friction is low to defer the navigation problem.

**How to avoid:**
Design the publications page structure before adding any content. Decide on categories (articles, book chapters, working papers, data), decide on sort order (reverse chronological within each), and decide what metadata each entry needs (title, venue, year, DOI link, PDF link, abstract toggle). Data projects that live on Dataverse or ICPSR should be treated as a separate section with explicit "external repository" labels so visitors know the link leaves the site.

**Warning signs:**
- All publication entries are the same visual weight with no hierarchy
- No DOI or external links on any entry
- Working papers and journal articles are intermixed without distinction
- The page has no visual difference from the CV PDF

**Phase to address:**
Content architecture phase. Define the publications data model before writing any content.

---

## Technical Debt Patterns

| Shortcut | Immediate Benefit | Long-term Cost | When Acceptable |
|----------|-------------------|----------------|-----------------|
| Hardcoding publication entries as Markdown prose instead of structured YAML/data | Faster to write the first 5 entries | Every new publication requires hunting through prose files; no reuse for CV generation | Never — structure first |
| Committing the CV PDF directly with no source file in the repo | Quick to upload | No way to know if PDF is current; rebuilding requires finding original document | Never — keep source in repo |
| Using a theme's default colors/fonts without customization | Zero time on design | Site looks identical to every other user of that theme; no Distill.pub aesthetic | Acceptable for MVP if noted as technical debt |
| Hotlinking to external publication PDFs (publisher URLs) instead of self-hosting preprints | No storage required | Publisher links move, go behind paywalls, or break; visitors can't access papers | Never for primary link — use DOI + preprint |
| Skipping mobile testing during development | Faster build cycle | Mobile breakage discovered only when someone shares the link on a phone | Never — test mobile at end of each phase |
| Publishing without checking all external links | Faster launch | Dead links on publications page signal neglect to hiring committees | Never — run link check before announcing |

---

## Integration Gotchas

| Integration | Common Mistake | Correct Approach |
|-------------|----------------|------------------|
| GitHub Pages + custom domain | Enabling HTTPS before DNS propagation completes, causing cert generation to fail | Set DNS records → wait 48 hours → then enable Enforce HTTPS in repo settings |
| GitHub Pages + Quarto | Deploying from repo root instead of the `docs/` output folder | Set `output-dir: docs` in `_quarto.yml` and configure Pages to serve from `docs/` branch |
| Dataverse / ICPSR links | Linking to dataset landing pages that may require login or institutional access | Test all external data links from a logged-out browser; note access requirements inline |
| Google Scholar indexing | Missing `<meta>` citation tags that Scholar needs to parse bibliographic data | Use Quarto's built-in citation metadata or add `citation_title`, `citation_author`, `citation_pdf_url` meta tags manually |
| Netlify free tier | Exceeding 300 build minutes/month with frequent small edits | Prefer GitHub Pages for academic sites with no server-side build needs; or batch updates |
| PDF CV via GitHub | PDF becomes stale silently — no warning when it diverges from site content | Add CV generation to the deploy checklist; store CV source alongside site source |

---

## Performance Traps

| Trap | Symptoms | Prevention | When It Breaks |
|------|----------|------------|----------------|
| Unoptimized headshot/profile photo | Slow first paint; high bandwidth cost | Compress images to ≤150 KB; use WebP with JPEG fallback | Immediately on any connection slower than broadband |
| Embedding full-text PDFs via `<iframe>` | Iframe PDFs fail on mobile; slow to load; inaccessible to screen readers | Link to PDF download; do not embed inline | Any mobile browser; most screen readers |
| No caching headers on static assets | Repeat visitors re-download all CSS/JS/images on every visit | GitHub Pages handles this automatically; Netlify too — not a custom config problem | Not a significant concern for this project's scale |
| Loading web fonts without `display: swap` | Invisible text during font load (FOIT) | Use `font-display: swap` in font CSS; preload critical fonts | On any slow connection |

Note: This site will not reach a scale where server performance is a concern. All performance traps here are front-end load-time issues relevant at any traffic level.

---

## Security Mistakes

| Mistake | Risk | Prevention |
|---------|------|------------|
| Including personal contact email as plain text in HTML | Email scrapers harvest it; spam follows | Use a contact form, `mailto:` obfuscation, or display as image/CSS trick; GitHub Pages has no server-side form handling so consider Formspree or Netlify Forms |
| Committing sensitive files (institution API keys, personal notes) to a public GitHub repo | Permanent exposure even after deletion | Confirm the GitHub repo is private during development; audit `.gitignore` before making repo public |
| Linking to preprint PDFs via Google Drive sharing links | Links break when sharing permissions change; Drive links are not stable permanent identifiers | Host preprints on the site itself or on a stable platform (SSRN, OSF, institutional repository) with a permanent URL |

---

## UX Pitfalls

| Pitfall | User Impact | Better Approach |
|---------|-------------|-----------------|
| Navigation menu with more than 5-6 items | Visitors cannot quickly orient; hiring committee members skimming the site get lost | Cap primary nav at 5 items: About, Research/Publications, Data, CV, Contact |
| No clear headshot on the landing page | Academic sites are personal credibility signals; anonymity feels unfinished | Include a professional photo above the fold on the home or About page |
| CV page is only a PDF link | Mobile users cannot read a PDF without a download; the page appears empty | Show CV content inline (HTML version) with a "Download PDF" button as secondary action |
| Dense jargon on the home page | Journalists, policymakers, and collaborators outside the subfield bounce immediately | Home page summary should be readable by a smart non-specialist; technical detail belongs on the About page |
| "Last updated: [year]" prominently displayed when the date is old | Signals to hiring committees that the site is abandoned | Either automate the date from git history (so it reflects actual updates) or remove the date if updates will be infrequent |
| No plain-English project summaries | Data project page reads as metadata rather than narrative | Each project should have a 2-sentence plain-language description before the technical details |
| Missing 404 page | Broken links (from old URL shares) drop visitors with no navigation path | Configure a custom 404 page with links to home, publications, and contact |

---

## "Looks Done But Isn't" Checklist

- [ ] **Publications page:** Each entry has a working DOI or external link — verify all links from a logged-out browser on a different network
- [ ] **CV PDF:** The downloadable PDF matches the current publications list on the site — cross-check date on PDF against most recent paper
- [ ] **Custom domain:** Both `https://yourdomain.com` and `https://www.yourdomain.com` load correctly with a valid certificate
- [ ] **Mobile layout:** Every page has been tested on an actual phone, not just browser DevTools mobile emulation
- [ ] **Data projects page:** All Dataverse/ICPSR links open correctly from a logged-out browser; access requirements are noted inline
- [ ] **Contact information:** Email/contact link is present and reachable from every page (footer at minimum)
- [ ] **Google Scholar discoverability:** Citation meta tags are present in page `<head>` for publications pages
- [ ] **Headshot:** A professional photo appears on the home or About page (not a placeholder)
- [ ] **404 page:** Navigate to a non-existent URL on the deployed site to confirm a custom error page loads
- [ ] **Broken links sweep:** Run a link checker tool (e.g., `lychee`, Broken Link Checker) before announcing the URL

---

## Recovery Strategies

| Pitfall | Recovery Cost | Recovery Steps |
|---------|---------------|----------------|
| CV and publications page diverge badly | MEDIUM | Audit both assets together; rebuild from the CV as source of truth; commit to structured YAML going forward |
| SSL cert failure after custom domain setup | LOW | Remove and re-add the custom domain in GitHub Pages settings; wait 48 hours; verify DNS records match GitHub's required values |
| Quarto output-dir misconfiguration breaks Pages deployment | LOW | Set `output-dir: docs` in `_quarto.yml`; re-render; commit the `docs/` folder; reconfigure Pages source |
| Tone too academic — site inaccessible to public audience | MEDIUM | Rewrite the home page summary and add lay-language summaries to each publication/project; does not require structural changes |
| Publications page is a data dump with no structure | MEDIUM | Restructure into YAML data file; rebuild the page layout; time investment is moderate but not a rewrite |
| Netlify free tier bandwidth exceeded | LOW | Migrate to GitHub Pages (simpler for a static site with no build complexity); DNS change takes 24 hours |

---

## Pitfall-to-Phase Mapping

| Pitfall | Prevention Phase | Verification |
|---------|------------------|--------------|
| CV / publications divergence | Content architecture (before writing anything) | Single source file drives both outputs; no duplicate data entry |
| Dual audience tone collapse | Content writing phase | Home page summary is readable by a non-specialist; confirmed by asking someone outside the field to read it |
| Over-engineering the build | Project setup (phase 1) | First phase ends with real content live on the site, not infrastructure scaffolding |
| Custom domain SSL failure | Deployment phase | Both domain variants load HTTPS correctly from a separate device on a different network |
| Publications page as data dump | Content architecture phase | Publications page has categories, sort order, and DOI/PDF links before any entries are added |
| Stale external links | Launch / QA phase | Full link check run before URL is announced anywhere |
| Mobile layout breakage | Every content phase | Each page tested on mobile before that phase closes |
| CV PDF staleness | Maintenance documentation | Deploy checklist includes CV PDF verification step; CV source lives in the repo |

---

## Sources

- Berkeley Townsend Center — Personal academic webpages tips (direct analysis of real academic sites): https://townsendcenter.berkeley.edu/blog/personal-academic-webpages-how-tos-and-tips-better-site
- Drew Dimmery — Quarto academic website build notes (practitioner account of specific Quarto pitfalls): https://ddimmery.com/posts/quarto-website/
- Martin Lea — Publications list preparation for academic websites: https://martinlea.com/how-to-prepare-your-publications-list-for-your-personal-academic-website/
- GitHub Docs — Troubleshooting custom domains and GitHub Pages SSL: https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site/troubleshooting-custom-domains-and-github-pages
- Inside Higher Ed — Writing for peers vs. the public: https://www.insidehighered.com/blogs/rethinking-research/writing-peers-vs-public-when-academic-writing-falls-short
- eScholarship / Google Scholar — Optimizing for Google Scholar indexing: https://help.escholarship.org/support/solutions/articles/9000154158-optimizing-for-google-scholar-other-general-seo-information
- CloudCannon — Top five static site generators for 2025: https://cloudcannon.com/blog/the-top-five-static-site-generators-for-2025-and-when-to-use-them/
- Flexprice — Netlify pricing and plan limitations: https://flexprice.io/blog/complete-guide-to-netlify-pricing-and-plans
- Wikipedia / Journalists Resource — Link rot in academic publishing: https://journalistsresource.org/media/website-linking-best-practices-media-online-publishers/

---
*Pitfalls research for: Academic portfolio website — social scientist, static site, Distill.pub-inspired*
*Researched: 2026-03-22*
