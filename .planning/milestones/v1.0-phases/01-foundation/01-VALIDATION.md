---
phase: 1
slug: foundation
status: draft
nyquist_compliant: false
wave_0_complete: false
created: 2026-03-22
---

# Phase 1 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | None — static site; no unit test framework applicable |
| **Config file** | None required for Phase 1 |
| **Quick run command** | `quarto render && quarto check` |
| **Full suite command** | Manual browser verification checklist (see Manual-Only Verifications) |
| **Estimated runtime** | ~10 seconds (render) |

Phase 1 produces a static website. There is no application logic, no functions, and no data transformations to unit-test. Validation is entirely visual and functional: does the page look correct, does the nav work, does the site deploy and serve over HTTPS.

---

## Sampling Rate

- **After every task commit:** Run `quarto render` — confirms no build errors
- **After every plan wave:** Run `quarto render` + manual visual check via `quarto preview`
- **Before `/gsd:verify-work`:** Full manual checklist must pass
- **Max feedback latency:** ~10 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|-----------|-------------------|-------------|--------|
| TBD | 01 | 1 | INFR-01 | smoke | `quarto render --no-cache 2>&1 \| grep -i error` | ❌ W0 | ⬜ pending |
| TBD | 01 | 1 | INFR-02 | manual | Open HTTPS URL in private window; check padlock | N/A | ⬜ pending |
| TBD | 01 | 1 | DSGN-01 | manual | Visual inspect; check DevTools Network for fonts | N/A | ⬜ pending |
| TBD | 01 | 1 | DSGN-02 | manual | Open on mobile device at 375px; no horizontal scroll | N/A | ⬜ pending |
| TBD | 01 | 1 | DSGN-03 | manual | Click each nav link; test hamburger on mobile | N/A | ⬜ pending |
| TBD | 01 | 1 | IDEN-01 | manual | Load index; confirm photo, name, affiliation, bio | N/A | ⬜ pending |
| TBD | 01 | 1 | IDEN-02 | manual | Load index; confirm research interests (3-5 sentences) | N/A | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

- [ ] Create `scripts/check-render.sh` — smoke test: `quarto render --no-cache` and check for errors

*Most Phase 1 validation is manual — static site with no application logic.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| HTTPS padlock visible | INFR-02 | Requires real browser + deployed site | Open `https://<user>.github.io/<repo>/` in private window; verify padlock icon |
| Warm neutrals palette visible | DSGN-01 | Visual design judgment | Inspect background (#FAF8F5), text (#3D3632), accents (#C4813D, #8B5E3C) |
| Source Serif 4 + DM Sans load | DSGN-01 | Font loading is visual | DevTools → Network → filter fonts; confirm both load |
| Mobile layout at 375px | DSGN-02 | Visual + interaction testing | Open on real mobile device; no horizontal scroll; content readable |
| Navigation functional | DSGN-03 | Click testing required | Click each nav item (Home, Publications, CV, Contact); test hamburger on mobile |
| Photo, name, affiliation visible | IDEN-01 | Content presence check | Load index page; all three above fold |
| Research interests readable | IDEN-02 | Content presence check | Load index page; 3-5 sentence summary present |

---

## Validation Sign-Off

- [ ] All tasks have `<automated>` verify or Wave 0 dependencies
- [ ] Sampling continuity: no 3 consecutive tasks without automated verify
- [ ] Wave 0 covers all MISSING references
- [ ] No watch-mode flags
- [ ] Feedback latency < 10s
- [ ] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
