---
phase: 2
slug: publications-and-data
status: draft
nyquist_compliant: false
wave_0_complete: false
created: 2026-03-22
---

# Phase 2 — Validation Strategy

> Per-phase validation contract for feedback sampling during execution.

---

## Test Infrastructure

| Property | Value |
|----------|-------|
| **Framework** | None — static site; same as Phase 1 |
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
| 02-01-01 | 01 | 1 | PUBL-01 | smoke | `quarto render --no-cache 2>&1 \| grep -i error` | ✅ | ⬜ pending |
| 02-01-02 | 01 | 1 | PUBL-02 | manual | Open `/publications.html`; inspect buttons | N/A | ⬜ pending |
| 02-01-03 | 01 | 1 | PUBL-03 | manual | Confirm working papers visually distinct | N/A | ⬜ pending |
| 02-01-04 | 01 | 1 | PUBL-04 | manual | Click Data buttons; confirm external repos | N/A | ⬜ pending |
| 02-01-05 | 01 | 1 | IDEN-03 | smoke | `grep -c "pub-entry" _site/publications.html` vs YAML count | ✅ | ⬜ pending |

*Status: ⬜ pending · ✅ green · ❌ red · ⚠️ flaky*

---

## Wave 0 Requirements

- [ ] `scripts/check-render.sh` — exists from Phase 1; verify it covers publication page rendering

*Existing infrastructure covers most phase requirements. Phase 2 is pure static output validated by render + visual review.*

---

## Manual-Only Verifications

| Behavior | Requirement | Why Manual | Test Instructions |
|----------|-------------|------------|-------------------|
| DOI/PDF buttons visible | PUBL-02 | Visual rendering check | Open publications.html, verify buttons appear on entries with DOI/PDF |
| Working papers visually distinct | PUBL-03 | Design/visual check | Confirm left border or accent styling on working papers section |
| Data buttons link to repos | PUBL-04 | External link verification | Click each Data button, confirm Dataverse/ICPSR page loads |
| Summaries readable by non-academic | IDEN-03 | Content quality check | Read each summary, confirm plain-language and 1-2 sentences |

---

## Validation Sign-Off

- [ ] All tasks have `<automated>` verify or Wave 0 dependencies
- [ ] Sampling continuity: no 3 consecutive tasks without automated verify
- [ ] Wave 0 covers all MISSING references
- [ ] No watch-mode flags
- [ ] Feedback latency < 15s
- [ ] `nyquist_compliant: true` set in frontmatter

**Approval:** pending
