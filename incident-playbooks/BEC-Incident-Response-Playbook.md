# Incident Response Playbook: Business Email Compromise (BEC)

## Purpose
Standardize detection, triage, containment, and recovery for BEC (invoice fraud, payroll diversion, vendor spoofing).

> **Context:** BEC attacks accounted for over $2.9 billion in adjusted losses in 2023 (FBI IC3). They typically exploit social engineering and stolen credentials rather than malware.

---

## Visual: Attack Flow Overview
```mermaid
flowchart LR
    A[Attacker] -->|Phishing or OAuth Consent| B[User Mailbox]
    B -->|Credential Theft| C[Cloud Email Access]
    C -->|Create Inbox Rules / OAuth Token| D[Persistence]
    D -->|Invoice Fraud / Payment Diversion| E[Finance Dept]
    E -->|Funds Transferred| F[Attacker Account]
Severity & Timing
Classification	Default	MTTD Target	MTTR Target
Impact	High	< 1 hour	< 24 hours
Roles (RACI)
Role	Responsibility
IR Lead (R)	Coordinate investigation, document findings
Email Admin (R)	Pull logs, disable forwarding/OAuth, reset creds
Finance (A)	Freeze transactions, verify vendor bank changes
Legal (C)	Evaluate disclosure obligations
Comms (C)	Prepare internal/external updates
Exec Sponsor (I)	Approve notifications and external comms
Detection Signals (Examples from M365 Defender & Sentinel)
Indicator Type	Real-World Example	Data Source
Inbox rules	Rule created: “Forward all to externaldomain.com”	OfficeActivity logs
OAuth grants	User consented to "InvoicePDFViewer" app	CloudAppEvents
Impossible travel	Login from New York → Lagos in 20 min	SigninLogs
Mailbox forwarding	Automatic forwarding enabled	Exchange Online settings
Vendor payment change	Email requesting new bank details	Finance workflow
Triage — 30-Minute Checklist

 Freeze pending payment changes

 Snapshot affected mailboxes (before remediation)

 Identify affected identities, devices, and apps

 Verify financial context with AP/Finance

 Determine if exfiltration occurred

Screenshot Example:


M365 Defender alert timeline showing suspicious OAuth consent and inbox-rule creation within minutes.

Containment & Eradication

Account actions: reset passwords, revoke tokens, remove malicious OAuth apps, enforce MFA.

Mail hygiene: delete forwarding rules, purge phishing lures, audit transport rules.

Finance controls: freeze disbursements, verify vendor banking details out-of-band.

Evidence capture: export message traces and audit logs before changes.

Recovery

Re-enable accounts under monitored conditions.

Restore legitimate rules/templates.

Enable continuous mailbox auditing and retention.

Conduct a post-incident training session for Finance and AP teams.

Metrics & Reporting
Metric	Target	Source
% mailboxes with malicious forwarding rules	0 % after remediation	OfficeActivity
MTTD (Mean Time to Detect)	< 1 hour	SOC alert logs
MTTR (Mean Time to Recover)	< 24 hours	IR ticket data
Amount saved via holds	Quantify $ protected	Finance
Communications Templates

See /incident-playbooks/evidence/comms-templates/:

internal-update.md – succinct, no-blame status memo.

vendor-notice.md – external notice with verification steps and fraud-report link.

Controls Crosswalk
Framework	Relevant Sections	Example Control Mapping
NIST CSF 2.0	RESPOND-RS.MI, RS.CO, RECOVER-RC.CO	Incident management, communication, and recovery coordination
NIST SP 800-61 r3	§3.3 (Containment), §3.4 (Eradication & Recovery)	Playbook phases align to NIST lifecycle
CIS Microsoft 365 Foundations	1.1, 1.2, 2.4, 3.2 (Email protections)	MFA enforcement, disable auto-forwarding
ISO/IEC 27035-1:2023	6.2–6.4 (Response & Lessons Learned)	Aligns to post-incident review and improvement
MITRE ATT&CK	T1078 (Valid Accounts), T1114 (Email Collection), T1566 (Phishing)	Adversary technique references for detections
Real-World Example

Case: Vendor Invoice Diversion

Attacker compromised an AP clerk via OAuth consent.

Created inbox rule to hide vendor replies.

Sent modified invoice PDF with new routing number.

Finance flagged mismatch → IR team confirmed rule and revoked app consent.

Loss prevented: $180,000 wire intercepted before execution.

Post-mortem: add app consent policy and enforce verified callback for bank changes.

Fact-Check Log
Date	Claim	Source
2025-11-08	BEC losses exceeded $2.9 B in 2023	FBI IC3 2023 Report
2025-11-08	OAuth indicators found in CloudAppEvents	Microsoft Learn: Detect OAuth Abuse
2025-11-08	NIST CSF 2.0 functions	NIST CSF 2.0 (2024 draft)
2025-11-08	CIS M365 controls 1.1–3.2	Center for Internet Security Benchmarks

