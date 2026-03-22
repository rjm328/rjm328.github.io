# Feature Research

**Domain:** Academic portfolio website — social scientist with publications and data projects
**Researched:** 2026-03-22
**Confidence:** HIGH

## Feature Landscape

### Table Stakes (Users Expect These)

Features users assume exist. Missing these = product feels incomplete.

| Feature | Why Expected | Complexity | Notes |
|---------|--------------|------------|-------|
| About/bio page with professional photo | Every academic site has this; hiring committees, journalists, and collaborators check it first | LOW | Short intro paragraph, affiliation, research interests summary; headshot makes the researcher approachable and aids conference networking |
| Publications list | Core reason most visitors come; academics checking credibility will leave immediately if missing | MEDIUM | Group by type (peer-reviewed articles, book chapters, working papers, preprints); include year, co-authors, journal/venue; link to PDFs or DOI where possible |
| CV page (viewable + downloadable PDF) | Search committees always want a CV link; standard expectation in every hiring context | LOW | Provide both HTML view and PDF download; PDF must be kept in sync with site content |
| Contact information | Journalists, collaborators, and students need a path to reach the researcher | LOW | Email required; departmental address optional; office hours optional |
| Professional/social profile links | Visitors cross-reference ORCID and Google Scholar as credibility signals | LOW | ORCID, Google Scholar, and institutional profile link are the academic trifecta; LinkedIn is secondary for social scientists |
| Responsive design (mobile + desktop) | Google penalizes non-responsive sites; conference attendees look up speakers on phones | MEDIUM | Must render correctly on mobile; tables (publications lists) are the hardest part |
| Fast page load | Google Scholar and search ranking depend partly on load speed; impatient visitors bounce | LOW | Static site by design; images are the main risk — optimize headshot and any project images |
| Clear navigation (5-6 items max) | Standard web convention; more than 6 items signals disorganized thinking to academic audiences | LOW | Typical menu: Home / Research / Publications / Data / CV / Contact |

### Differentiators (Competitive Advantage)

Features that set the product apart. Not required, but valued.

| Feature | Value Proposition | Complexity | Notes |
|---------|-------------------|------------|-------|
| Data projects page with external repository links | Most academic sites don't surface data work distinctly; social scientists with datasets stand out to replication-focused hiring committees and open-science-minded journals | LOW | Links to Dataverse, ICPSR, openICPSR, OSF, etc.; include dataset name, year, brief description, and DOI/URL; separate page signals data work is a first-class output |
| Plain-language research summaries alongside technical abstracts | Journalists and policymakers need accessible entry points; most academic sites only have journal abstracts | MEDIUM | 2-3 sentence lay summary per project; explicitly serves dual audience (academic peers + general public) stated in PROJECT.md |
| Working papers / preprints section | Signals active pipeline; hiring committees want to see work in progress; SocArXiv and SSRN are standard venues for social scientists | LOW | Separate subsection within publications or its own section; mark clearly as "under review" or "working paper" |
| Media mentions / press section | Journalists vet credibility by checking whether researcher has spoken to press before; listing past coverage reduces friction for new inquiries | MEDIUM | Collect outlets, links, dates; include topics available for comment to make journalists' jobs easier |
| Distill.pub-inspired typography and layout | Most academic sites use generic institutional templates or overcrowded WordPress themes; a visually credible site communicates scholarly seriousness | HIGH | Requires intentional type scale, whitespace, and reading-width constraints; this is the primary aesthetic differentiator in PROJECT.md |
| Research interests summary on homepage | Visitors from search often land on homepage; a clear one-paragraph statement of what you study saves them from hunting | LOW | 3-5 sentences; answers "what does this person study and why does it matter" |

### Anti-Features (Commonly Requested, Often Problematic)

Features that seem good but create problems.

| Feature | Why Requested | Why Problematic | Alternative |
|---------|---------------|-----------------|-------------|
| Blog / writing section | Seems like a good way to share thinking and stay current | High maintenance burden; an abandoned blog (last post 2021) signals neglect worse than having no blog; out of scope per PROJECT.md | Link to external writing on Medium, Substack, or Scholars Strategy Network instead |
| Hosted interactive data visualizations | Impressive-looking; shows technical skill | Hosting, security, and performance overhead; data already lives on Dataverse/ICPSR; unnecessary duplication per PROJECT.md | Link directly to hosted datasets and embed screenshots or static charts as images if needed |
| CMS / admin panel | Easier content editing for non-technical users | Adds server dependency, security surface area, and maintenance overhead; eliminates free hosting eligibility | Use a well-structured static site with simple file conventions; updating a YAML or Markdown file is achievable without deep technical knowledge |
| Comment sections or contact forms with server processing | Enables visitor engagement | Requires backend processing or a third-party form service; adds spam risk and maintenance; overkill for a researcher site | Email address link (mailto:) is sufficient; a simple Netlify Form or Formspree integration is acceptable if a form is required |
| Analytics dashboards / visitor tracking | Curiosity about traffic | Privacy implications; GDPR complexity; low value for primary goal (credibility, discoverability); requires ongoing maintenance | Plausible or Fathom lightweight privacy-respecting analytics are acceptable if genuinely needed; avoid Google Analytics bloat |
| User accounts or authentication | "Future-proofing" | Completely unnecessary for a read-only public site; adds enormous complexity; explicitly out of scope in PROJECT.md | None needed |
| Social media feed embeds | Shows activity, keeps site dynamic | Third-party scripts slow page load significantly; Twitter/X widget history is unreliable; feeds go stale or break | Link to social profiles in footer/contact; do not embed live feeds |
| Automatically synced publication list from Google Scholar API | Tempting automation | Google Scholar API is unofficial, rate-limited, and brittle; breaking in production is embarrassing | Manually curated publications list in a structured data file (YAML/JSON/Markdown frontmatter); update during site maintenance cycles |

## Feature Dependencies

```
[About/Bio page]
    └──requires──> [Professional photo]
    └──enhances──> [Research interests summary on homepage]

[Publications list]
    └──requires──> [Consistent citation format chosen upfront]
    └──enhances──> [CV page] (CV and publications list must stay in sync)

[Data projects page]
    └──requires──> [External repository links exist (Dataverse/ICPSR DOIs)]
    └──enhances──> [Publications list] (cross-link datasets to related papers)

[CV page]
    └──requires──> [PDF generation workflow]
    └──requires──> [Publications list] (CV duplicates publication entries)

[Media mentions section]
    └──enhances──> [Contact page] (list topics available for comment alongside contact info)

[Working papers section]
    └──enhances──> [Publications list] (can be subsection or standalone)

[Plain-language research summaries]
    └──enhances──> [About/Bio page]
    └──enhances──> [Research interests summary on homepage]
```

### Dependency Notes

- **CV requires publications list in sync:** The CV PDF and the website publications list will diverge if maintained separately. Establish a single source of truth — either the CV drives the site, or the site structure mirrors the CV.
- **Data projects page requires external DOIs:** The page's value depends on having real, citable links to hosted datasets. If datasets are not yet on Dataverse/ICPSR, placeholder entries are worse than nothing.
- **Plain-language summaries enhance dual-audience goal:** The journalist and policymaker audience stated in PROJECT.md is only served if there is accessible content beyond journal abstracts. This is optional at launch but high-value.

## MVP Definition

### Launch With (v1)

Minimum viable product — what's needed to validate the concept.

- [ ] About/bio page with professional photo — first thing every visitor checks; establishes identity and credibility
- [ ] Publications list with DOI/PDF links — core reason most visitors arrive; table stakes for hiring committees
- [ ] Data projects page with external repository links — differentiates this researcher; surfaces a distinct category of output
- [ ] CV page with PDF download — search committees require this; must be present at launch
- [ ] Contact page with email and professional profile links (ORCID, Google Scholar) — basic professional hygiene; enables journalist and collaborator outreach
- [ ] Responsive design across mobile and desktop — non-negotiable for modern web credibility
- [ ] Clean navigation (5-6 items) — About / Research/Publications / Data / CV / Contact

### Add After Validation (v1.x)

Features to add once core is working.

- [ ] Working papers / preprints subsection — add when there are active papers in the pipeline worth signaling
- [ ] Plain-language research summaries — add when the site is being shared actively with journalists or policymakers
- [ ] Media mentions section — add once there are 3+ credible press mentions worth surfacing

### Future Consideration (v2+)

Features to defer until the site is established.

- [ ] Speaking engagements page — low priority unless the researcher is actively seeking speaking invitations
- [ ] Teaching page with syllabi — out of scope for v1 per PROJECT.md; add if students are a target audience
- [ ] Blog/writing section — high maintenance; only add if researcher commits to regular publication cadence

## Feature Prioritization Matrix

| Feature | User Value | Implementation Cost | Priority |
|---------|------------|---------------------|----------|
| About/bio page | HIGH | LOW | P1 |
| Publications list | HIGH | MEDIUM | P1 |
| Data projects page | HIGH | LOW | P1 |
| CV page + PDF download | HIGH | LOW | P1 |
| Contact page + profile links | HIGH | LOW | P1 |
| Responsive design | HIGH | MEDIUM | P1 |
| Distill.pub-inspired typography | MEDIUM | HIGH | P1 (defines the design system; set upfront) |
| Research interests on homepage | MEDIUM | LOW | P1 |
| Working papers section | MEDIUM | LOW | P2 |
| Plain-language summaries | MEDIUM | MEDIUM | P2 |
| Media mentions section | MEDIUM | LOW | P2 |
| Speaking engagements | LOW | LOW | P3 |
| Teaching / syllabi | LOW | MEDIUM | P3 |

**Priority key:**
- P1: Must have for launch
- P2: Should have, add when possible
- P3: Nice to have, future consideration

## Competitor Feature Analysis

The "competitors" here are peer academic websites in social science. Common implementations observed across templates (al-folio, academicpages, Hugo Academic, pmichaillat/hugo-website) and award-winning sites (The Academic Designer 2025 contest):

| Feature | Typical Academic Site | Award-Winning Sites | This Project's Approach |
|---------|----------------------|---------------------|------------------------|
| Publications | Flat list, often unstyled | Categorized by type, linked, filterable | Categorized by type (articles, chapters, working papers); linked to DOI/PDF; no filter widget needed at launch |
| Data work | Often absent or buried in CV | Separate page or project cards | Dedicated data projects page — first-class output |
| Design | Generic institutional theme or stock WordPress | Custom typography, intentional whitespace, visual identity | Distill.pub-inspired: rich type scale, content-forward, minimal chrome |
| Plain-language content | Rare — mostly journal abstracts | Present in award winners (Accessible SciComm award) | Target for v1.x; listed as P2 |
| CV | PDF link only | HTML view + PDF download | Both HTML view and PDF download |
| Contact | Email only | Email + social links + topics for media | Email + ORCID + Google Scholar + topics for media (v1.x) |

## Sources

- Berkeley Townsend Center guide on academic personal websites: https://townsendcenter.berkeley.edu/blog/personal-academic-webpages-how-tos-and-tips-better-site
- The Academic Designer — 35 page ideas: https://theacademicdesigner.com/2025/35-page-ideas-for-your-academic-personal-website/
- The Academic Designer — 2025 contest winners: https://theacademicdesigner.com/2025/winners-of-the-best-personal-academic-websites-contest-2025/
- The Academic Designer — types of academic websites: https://theacademicdesigner.com/2025/types-of-academic-websites-for-faculty-and-researchers/
- Elsevier guide on academic personal websites: https://www.elsevier.com/connect/creating-a-simple-and-effective-academic-personal-website
- Dataverse best practices for academic credit: https://dataverse.org/best-practices/academic-credit
- SocArXiv (preprint platform for social scientists): https://socopen.org/
- pmichaillat/hugo-website (minimalist academic template): https://github.com/pmichaillat/hugo-website
- al-folio Jekyll theme for academics: https://github.com/alshedivat/al-folio
- Rice University guide on academic websites: https://graduate.rice.edu/news/current-news/how-make-your-own-academic-website
- BU Research communication guide (journalist audience): https://www.bu.edu/research/communication-dissemination/promote/

---
*Feature research for: Academic portfolio website — social scientist*
*Researched: 2026-03-22*
