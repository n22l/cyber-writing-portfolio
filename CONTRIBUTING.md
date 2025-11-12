# Contributing & Review Guidelines

This repository is structured as **docs-as-code** for security teams:
incident playbooks, AI security guidance, and cloud security runbooks with
supporting evidence.

Even if it's just me working in this repo, changes follow the same rules I’d
expect in a production environment.

---

## 1. Workflow

1. Create a feature branch:
   - `feature/bec-update-logging`
   - `feature/ai-prompt-injection-tests`
   - `fix/cloud-storage-typo`
2. Open a Pull Request (PR) into `main`.
3. Use the PR description to:
   - Summarize what changed
   - List affected files
   - Call out any assumptions or open questions
4. Only merge after the checklist (below) is completed.

---

## 2. Change Checklist (must do)

For **every** change to a playbook, guide, or evidence file:

- [ ] **Clarity:** Plain language, concrete steps, no filler.
- [ ] **Accuracy:** Commands, queries, and config match current vendor docs.
- [ ] **Scope:** No leaking internal, proprietary, or client-specific data.
- [ ] **Consistency:** Terminology, headings, and formatting follow `STYLE.md`.
- [ ] **Tested (if applicable):**
  - KQL/CLI snippets executed or at least syntactically validated.
  - Mermaid diagrams render without errors.
- [ ] **Links:** All relative links resolve inside the repo.

If any box is "no", fix it or document why in the PR.

---

## 3. Fact-Check Log

Each major document that makes technical claims should maintain a
**Fact-Check Log** section with:

- Date of verification
- Claim
- Source (vendor docs, standards body, official advisories)

When you:
- change a command,
- update a statistic,
- revise a framework mapping,

you must **update the Fact-Check Log** in the same commit.

---

## 4. Style & Tone (minimal rules)

- Prefer specific over vague:
  - ✅ “Disable `AllowBlobPublicAccess` on all storage accounts.”
  - ❌ “Harden storage security.”
- No hype language:
  - Avoid “state-of-the-art”, “military-grade”, “next-gen”.
- Always anchor controls to:
  - A system (Azure, AWS, Sentinel, etc.),
  - A framework (NIST, CIS, OWASP, MITRE),
  - Or a measurable outcome.

These rules exist to make this repo look and behave like real security
documentation, not marketing copy.
