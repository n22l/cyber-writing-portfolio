# Cybersecurity Writing Portfolio

Security documentation grounded in real data and field practice: playbooks, policy drafts, and technical guides built to work in production.

Each sample includes:
- **Evidence Pack** – reproducible steps, artifacts, screenshots  
- **Controls Crosswalk** – mapped to NIST CSF, CIS, or OWASP frameworks  
- **Editorial Appendix** – assumptions, de-jargon, risk trade-offs  
- **Fact-check Log** – dated sources and version validation

> Every document ends with verified sources and a fact-check log.

## 🧩 Sample Work

### [Incident Response Playbook: Business Email Compromise (BEC)](incident-playbooks/BEC-Incident-Response-Playbook.md)

This playbook standardizes detection, triage, containment, and recovery steps for Business Email Compromise (BEC) scenarios such as invoice fraud, vendor spoofing, and payroll diversion.

**Included artifacts:**
- Evidence-backed KQL detection queries:
  - [Inbox Rules Detection](incident-playbooks/evidence/kql/inbox-rules.kql)
  - [OAuth Grants Detection](incident-playbooks/evidence/kql/oauth-grants.kql)
  - [Impossible Travel Detection](incident-playbooks/evidence/kql/impossible-travel.kql)
- Verified communication templates:
  - [Internal Update](incident-playbooks/evidence/comms-templates/internal-update.md)
  - [Vendor Notice](incident-playbooks/evidence/comms-templates/vendor-notice.md)
- Visuals:
  - Attack Flow Diagram
  - Incident Lifecycle Flowchart

> All playbooks include fact-check logs, framework mappings (NIST, CIS, MITRE), and editorial notes for reproducibility and clarity.
