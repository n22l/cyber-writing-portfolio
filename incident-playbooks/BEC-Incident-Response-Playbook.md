# Incident Response Playbook: Business Email Compromise (BEC)

## Purpose
Standardize detection, triage, containment, and recovery for BEC (invoice fraud, payroll diversion, vendor spoofing).

## Severity & Timing
- **Default severity:** High
- **Targets:** MTTD < 1h from report; MTTR < 24h to containment

## Roles (RACI)
IR Lead (R) • Email Admin (R) • Finance (A) • Legal (C) • Comms (C) • Exec Sponsor (I)

## Detection Signals
Suspicious forwarding rules, OAuth grants, impossible travel, payee changes, vendor bank updates.

## Triage — 30-minute checklist
- [ ] Freeze payment changes; hold wire/ACH in queue
- [ ] Snapshot mailboxes
- [ ] Identify affected identities, apps, rules, devices
- [ ] Confirm business context with Finance/AP

## Containment & Eradication
1. Reset credentials; revoke sessions/tokens; remove OAuth grants; enforce MFA; purge malicious rules
2. Remove external auto-forwarding; search/purge lures; audit transport rules
3. Out-of-band verify vendor bank changes; flag suspect invoices

## Recovery
Re-enable access under monitored conditions; restore safe rules; ensure mailbox auditing

## Metrics
% compromised mailboxes with forwarding rules; $ protected by payment holds; MTTD/MTTR

## Communication Templates
See Evidence Pack (internal status + vendor/customer notice)

## Controls Crosswalk
NIST CSF RESPOND/RECOVER; CIS M365 email protections

## Fact-check log
| Date | Claim | Source |
|---|---|---|
| YYYY-MM-DD | OAuth grant indicators | <link> |
