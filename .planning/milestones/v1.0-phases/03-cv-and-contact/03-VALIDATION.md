---
phase: 3
slug: cv-and-contact
status: draft
nyquist_compliant: false
wave_0_complete: false
created: 2026-03-22
---

# Phase 3 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | None — static site; same as Phase 1-2 |
| **Config file** | None required |
| **Quick run command** | `quarto render --no-cache 2>&1 \| grep -iE "error\|warning"` |
| **Full suite command** | `quarto render && quarto preview` (manual visual check) |
| **Estimated runtime** | ~15 seconds |

---

## Sampling Rate

- **After every task commit:** Run `quarto render --no-cache 2>&1 | grep -iE "error|warning"`
- **After every plan wave:** Run `quarto render && quarto preview` (manual visual check)
- **Before `/gsd:verify-work`:** Full manual checklist must pass
- **Max feedback latency:** 15 seconds

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Test Type | Automated Command | File Exists | Status |
|---------|------|------|-------------|-----------|-------------------|-------------|--------|
| 03-01-01 | 01 | 1 | CV-01 | smoke | `quarto render cv.qmd && grep -c "cv-section" _site/cv.html` | N/A | ⬜ pending |
| 03-01-02 | 01 | 1 | CV-02 | smoke | `ls RJM-CV-v.oct25.pdf && grep -q "download" _site/cv.html` | ✅ | ⬜ pending |
| 03-01-03 | 01 | 1 | CONT-01 | smoke | `grep -q "rmcgrat2@gmu.edu" _site/contact.html` | N/A | ⬜ pending |
| 03-01-04 | 01 | 1 | CONT-02 | smoke | `grep -q "orcid.org" _site/contact.html && grep -q "scholar.google.com" _site/contact.html` | N/A | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

- [ ] cv.qmd — content to be authored (replaces stub)
- [ ] contact.qmd — content to be authored (replaces stub)
- [ ] custom.scss — `.cv-section`, `.cv-entry` classes to be added

*No test framework to install — static Quarto site validated by render + visual review.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| CV readable in browser | CV-01 | Layout/typography quality | Open cv.html, verify 4 sections display cleanly |
| PDF download works | CV-02 | File download behavior | Click download button, verify PDF opens/saves |
| Contact page layout | CONT-01/02 | Visual presentation | Open contact.html, verify email and all profile links display |
| Mobile layout | DSGN-02 | Responsive design | Resize to 375px, verify both pages stack properly |

---

## Validation Sign-Off

- [ ] All tasks have `<automated>` verify or Wave 0 dependencies
- [ ] Sampling continuity: no 3 consecutive tasks without automated verify
- [ ] Wave 0 covers all MISSING references
- [ ] No watch-mode flags
- [ ] Feedback latency < 15s
- [ ] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
