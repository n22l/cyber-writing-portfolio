# Incident Response Playbook: Business Email Compromise (BEC)

## Purpose
Standardize detection, triage, containment, and recovery for BEC (invoice fraud, payroll diversion, vendor spoofing).

> **Context:** BEC attacks accounted for over $2.9 billion in adjusted losses in 2023 (FBI IC3). They typically abuse valid accounts and social engineering, not malware.

---

## Visual: Attack Flow Overview

```mermaid
flowchart LR
    A[Attacker] -->|Phishing or OAuth Consent| B[User Mailbox]
    B -->|Credential Theft| C[Cloud Email Access]
    C -->|Inbox Rule / Forwarding / OAuth App| D[Persistence]
    D -->|Fake Invoices / Bank Changes| E[Finance / AP]
    E -->|Funds Sent| F[Attacker Account]
Severity & Timing
Classification	Default	MTTD Target	MTTR Target
BEC Incident	High	< 1 hour	< 24 hours
Roles (RACI)
Role	Responsibility
IR Lead (R)	Coordinate technical response and documentation
Email Admin (R)	Logs, rules, OAuth apps, mailbox snapshots
Finance (A)	Freeze payments, validate bank changes
Legal (C)	Assess notification, regulatory obligations
Comms (C)	Internal/external messaging
Exec Sponsor (I)	Approve major comms and risk decisions
Detection Signals

Key indicators (typically from Microsoft 365 / Entra ID / Defender / Sentinel):

New inbox rules that forward or delete messages to/from finance or vendors

New OAuth application grants with Mail.Read, Mail.ReadWrite, or offline_access

Sign-ins from unusual countries / impossible travel patterns

Vendor or internal emails requesting urgent bank account changes

Multiple failed logins followed by successful sign-in from risky IP

These are backed by KQL examples in:

incident-playbooks/evidence/kql/inbox-rules.kql

incident-playbooks/evidence/kql/oauth-grants.kql

Triage — First 30 Minutes

 Freeze pending wire/ACH or bank detail changes related to suspected accounts

 Snapshot affected mailboxes (before making changes)

 Identify affected accounts, rules, OAuth apps, and devices

 Confirm with Finance/AP which payments, vendors, or invoices are in scope

 Determine if any funds have already left (and to where)

Use screenshots or exports from your email/security portal and attach them to the incident record.

Containment & Eradication

Accounts

Reset passwords for affected users

Revoke all active sessions and refresh tokens

Enforce MFA (phishing-resistant if available)

Mailboxes

Remove malicious inbox rules and forwarding to external domains

Disable auto-forwarding to external addresses at org level where feasible

Purge clearly malicious BEC emails from affected mailboxes

OAuth & Apps

Revoke suspicious OAuth app consents

Implement admin approval or stricter consent policies

Finance

Confirm all recent and pending bank-account changes out-of-band (phone to known numbers)

Flag suspect invoices and hold them

Evidence

Preserve logs, message traces, rule configurations, and key screenshots

Recovery

Restore normal access with enforced MFA and monitored conditions

Confirm no malicious rules, forwarding, or OAuth apps remain

Resume payments only after out-of-band verification

Update users on safe email/payment practices

Metrics

Track these for reporting and tuning:

MTTD: time from first suspicious signal/report to initial triage start

MTTR: time from detection to containment (accounts locked, payments frozen)

% of BEC cases with forwarding rules/OAuth abuse

$ prevented or recovered due to timely holds and verification

Communication Templates

See supporting templates in:

incident-playbooks/evidence/comms-templates/internal-update.md

incident-playbooks/evidence/comms-templates/vendor-notice.md

These provide:

Clear, neutral language (no premature admission of liability)

Explicit verification steps for payment-instruction changes

Controls Crosswalk
Framework	Relevant Areas	How This Playbook Aligns
NIST CSF 2.0	ID, PR, DE, RS, RC	Detection, response, and recovery activities
NIST SP 800-61 r3	Incident handling life cycle	Triage, containment, eradication, recovery phases
CIS M365	Email & account security controls	MFA, disabling external forwarding, logging
ISO/IEC 27035-1	Incident management process	Structured response and lessons learned
MITRE ATT&CK	T1566, T1078, T1114, T1098, T1110	Phishing, valid accounts, email collection, etc.
Real-World Example (Sanitized)

Scenario:
AP mailbox compromised via OAuth consent. Attacker:

Creates inbox rule: move all messages with subject containing "Invoice" to a hidden folder.

Sends updated banking details to a key customer.

Attempts to reroute a $180,000 payment.

Response using this playbook:

Finance flags unusual request → IR freeze payments

Email Admin finds malicious rule + rogue OAuth app

Sessions revoked, app removed, lures purged

Customer contacted via known phone number: payment corrected

Post-incident: enforce stricter app consent and bank-change verification

Visual: Incident Lifecycle
flowchart TD
  D[Detect] --> T[Triage]
  T --> C[Containment]
  C --> E[Eradication]
  E --> R[Recovery]
  R --> L[Lessons Learned]

Fact-Check Log
Date	Claim	Source
2025-11-08	BEC losses > $2.9B in 2023	FBI IC3 2023 Report
2025-11-08	OAuth/BEC patterns via CloudAppEvents etc	Microsoft 365 / Defender docs
2025-11-08	Framework mappings above	NIST CSF, NIST 800-61, CIS M365
