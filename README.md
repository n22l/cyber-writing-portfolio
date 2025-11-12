# Cybersecurity Writing Portfolio

Security documentation grounded in real data and field practice: playbooks, policy drafts, and technical guides built to work in production.

Each sample includes:
- **Evidence Pack** – reproducible steps, artifacts, screenshots  
- **Controls Crosswalk** – mapped to NIST CSF, CIS, or OWASP frameworks  
- **Editorial Appendix** – assumptions, de-jargon, risk trade-offs  
- **Fact-check Log** – dated sources and version validation

> Every document ends with verified sources and a fact-check log.

## 🧩 Sample Work
### 1. [Incident Response Playbook: Business Email Compromise (BEC)](incident-playbooks/BEC-Incident-Response-Playbook.md)

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

### 2. [Prompt Injection Defense Guide](ai-security/Prompt-Injection-Defense-Guide.md)

This guide provides a structured approach to identifying, testing, and mitigating **prompt injection attacks** in Large Language Model (LLM) applications, covering both direct and indirect injection scenarios. It outlines defensive architecture patterns, reproducible red-team test cases, and mappings to major AI security frameworks.

**Included artifacts:**
- Evidence-backed test suite:
  - [Red-team Test Vectors](ai-security/evidence/prompt-injection/redteam-tests.json)
  - [Test Methodology](ai-security/evidence/prompt-injection/test-methodology.md)
  - [Results Log](ai-security/evidence/prompt-injection/results.csv)
- Visuals:
  - Attack Flow Diagram (Direct vs Indirect)
  - Reference Defense Architecture Flowchart
- Framework Crosswalk:
  - OWASP LLM Top 10 (LLM01 Prompt Injection), NIST AI Risk Management Framework (AI RMF 1.0), NIST GenAI Profile (AI 600-1), UK NCSC AI Security Guidance, MITRE ATLAS Adversarial Techniques
 
 ### 3. [Cloud Misconfiguration Response Guide (Azure + AWS appendix)](cloud-security/Azure-Cloud-Misconfiguration-Response-Guide.md)

A structured guide for detecting, remediating, and preventing **cloud storage misconfigurations** across Azure and AWS. Includes detection workflows, remediation scripts, and framework mappings for verifiable cloud security controls.

**Included artifacts:**
- Evidence:
  - [Azure Resource Graph query](cloud-security/evidence/azure/resource-graph/allow-blob-public-access.kql)
  - [Azure CLI remediation](cloud-security/evidence/azure/cli/azure-disable-public-access.sh)
  - [AWS S3 account block script](cloud-security/evidence/aws/cli/aws-public-access-block.sh)
  - [AWS Config / Security Hub rules](cloud-security/evidence/aws/config/aws-config-rules.md)
- Visuals:
  - Misconfig Attack Path Diagram
  - Guardrail Architecture Flowchart
- Framework Crosswalk:
  - NIST CSF 2.0, Microsoft Cloud Security Benchmark, CIS AWS, MITRE ATT&CK T1530

 
> All playbooks include fact-check logs, framework mappings (NIST, CIS, MITRE), and editorial notes for reproducibility and clarity.

