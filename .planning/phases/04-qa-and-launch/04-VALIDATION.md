---
phase: 4
slug: qa-and-launch
status: draft
nyquist_compliant: false
wave_0_complete: false
created: 2026-03-22
---

# Phase 4 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | None — QA phase with scripted verification steps |
| **Config file** | `scripts/check-render.sh` (build check) |
| **Quick run command** | `quarto render --no-cache 2>&1 \| grep -iE "error\|warning"` |
| **Full suite command** | N/A — QA tasks produce reports, not test suites |
| **Estimated runtime** | ~15 seconds (build) + API calls |

---

## Sampling Rate

- **After every task commit:** Run `quarto render --no-cache 2>&1 | grep -iE "error|warning"`
- **After every plan wave:** Visual check of all 4 pages
- **Before completion:** All 16 v1 requirements verified
- **Max feedback latency:** 15 seconds (build)

---

## Per-Task Verification Map

| Task ID | Plan | Wave | Requirement | Test Type | Automated Command | Status |
|---------|------|------|-------------|-----------|-------------------|--------|
| 04-01 | 01 | 1 | PUBL-02 | API | CrossRef API title match for all 22 DOIs | ⬜ pending |
| 04-02 | 01 | 1 | PUBL-04 | search | Look up Dataverse/ICPSR URLs | ⬜ pending |
| 04-03 | 01 | 1 | CV cross-check | content | Compare CV counts vs YAML counts | ⬜ pending |
| 04-04 | 01 | 1 | All 16 | visual+smoke | Mobile devtools + link verification | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

*No test infrastructure to install — QA phase uses API calls and HTML grep.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| Mobile layout all pages | DSGN-02 | Visual rendering | Open all 4 pages at 375px in devtools |
| Distill-inspired design | DSGN-01 | Subjective visual | Compare against design intent |
| CV PDF download | CV-02 | Browser download behavior | Click download button, verify PDF opens |

---

## Validation Sign-Off

- [ ] All tasks have `<automated>` verify or manual verification steps
- [ ] All 16 v1 requirements checked
- [ ] No watch-mode flags
- [ ] Feedback latency < 15s
- [ ] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
