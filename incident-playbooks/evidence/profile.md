# Evidence Profile – BEC Incident Response

**Scope:** Business Email Compromise (BEC) investigations in Microsoft 365 / SaaS environments.

**Purpose:** Provide concrete detection and communication artifacts that support the BEC playbook.

**Artifacts:**
- `kql/inbox-rules.kql` — Detect malicious forwarding and inbox rules
- `kql/oauth-grants.kql` — Detect risky OAuth app consents
- `kql/impossible-travel.kql` — Detect impossible travel anomalies
- `comms-templates/internal-update.md` — Internal status template
- `comms-templates/vendor-notice.md` — External vendor notice template
- `screenshots/` — Redacted examples from security portals (to be added)

**Usage:** Run KQL queries in Microsoft Sentinel / Defender / Entra ID logs.
Attach outputs and screenshots to incident tickets as evidence.

**Last Updated:** 2025-11-08
