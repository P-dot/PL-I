# Guided Evidence — Lab 02 — PL/I Coding Format, Identifiers and Character Set

[← Lab lesson](../README.md) · [Academy](https://github.com/P-dot/P-dot/blob/main/docs/ACADEMY.md) · [Evidence standard](https://github.com/P-dot/P-dot/blob/main/docs/LAB-STANDARD.md)

## How to read this evidence

This page is the evidence companion to the lab, not a screenshot gallery. Read the artifacts in execution order and correlate each image or file with the command, job, subsystem state or result described by the lab.

Use four questions while reviewing the evidence:

1. **Intent** — what state or behavior was the lab trying to create or inspect?
2. **Mechanism** — which z/OS component, command, utility or program performed the work?
3. **Observation** — what concrete message, return code, object or state was captured?
4. **Boundary** — what does that artifact support, and what would require additional evidence?

The manifest below is retained as the factual index from the executed lab. Its descriptions are the source of truth for what each artifact was captured to demonstrate.

## Evidence manifest

# Evidence index

The screenshots in this directory are selected from the working evidence captured during Lab 02. They are intentionally ordered to show build, execution, failure analysis and final validation.

| # | File | Demonstrates |
|---:|---|---|
| 01 | `01-format2-source.png` | `FORMAT2` PL/I source and source alignment |
| 02 | `02-format2-jcl-compile-bind.png` | Compile and Binder JCL for `FORMAT2` |
| 03 | `03-format2-jcl-go.png` | `FORMAT2` GO step |
| 04 | `04-format2-step-return-codes.png` | Successful job-step processing |
| 05 | `05-format2-compiler-rc0.png` | Compiler RC=0 / no compiler messages |
| 06 | `06-format2-load-module-save.png` | Binder save summary / load module |
| 07 | `07-format2-output.png` | `PL/I FORMAT RULES VALIDATED` |
| 08 | `08-ident3-source.png` | `IDENT3` source |
| 09 | `09-ident3-jcl.png` | `IDENT3` compile/bind JCL |
| 10 | `10-ident3-initial-rc16.png` | Initial compile failure / downstream steps skipped |
| 11 | `11-ident3-ibm1048i-sysin.png` | `IBM1048I` — `DD:SYSIN` could not be opened |
| 12 | `12-ident3-final-step-return-codes.png` | Corrected execution with PLI/BIND/GO success |
| 13 | `13-ident3-compiler-rc0.png` | Final compiler RC=0 and no messages |
| 14 | `14-ident3-load-module-save.png` | `IDENT3` saved to `IBMUSER.PLI.LOAD` |
| 15 | `15-ident3-binder-message-summary.png` | Binder message summary without errors/warnings |
| 16 | `16-ident3-output.png` | Final output `DATA         NAMES` |

These files deliberately include the initial failure as well as the successful final state. The lab therefore documents the engineering path, not only the polished outcome.

## Interpretation discipline

A successful command, return code or panel is interpreted only within the scope described by the lab. It must not be promoted into proof of unrelated production properties such as availability, performance, security hardening or recovery unless those properties have their own evidence.

When troubleshooting, walk the artifacts in order and locate the first point where **expected state** and **observed state** diverge. That point is normally more useful than the final symptom.

## Evidence boundary

**Evidence-backed:** the individual observations explicitly identified in the manifest and the parent lab.

**Not automatically implied:** production readiness, enterprise scale, security completeness, performance characteristics or cross-subsystem behavior that was not exercised by this lab.

## Review questions

- Which artifact establishes the initial or prerequisite state?
- Which artifact is the strongest execution/result proof?
- Is there a separate final-state validation, or only a successful command?
- Which z/OS subsystem owns the observed messages or objects?
- What additional artifact would be required to make a stronger claim?

---
### Continue learning

**Lab:** [Return to the lesson](../README.md)  
**Academy:** [z/OS Engineering Academy](https://github.com/P-dot/P-dot/blob/main/docs/ACADEMY.md) · [Curriculum](https://github.com/P-dot/P-dot/blob/main/docs/CURRICULUM.md) · [Relationships](https://github.com/P-dot/P-dot/blob/main/docs/RELATIONSHIPS.md)
