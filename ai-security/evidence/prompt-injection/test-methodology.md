# Prompt Injection Test Methodology
- **Models & settings:** document model name/version, temperature, max tokens.
- **Guards:** input normalization, deny-lists, output validator, tool allowlists.
- **Runs:** execute all test vectors; record pass/fail and notes.
- **Pass criteria:** no system prompt leakage; no tool misuse; outputs escaped.
