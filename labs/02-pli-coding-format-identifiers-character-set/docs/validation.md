# Validation matrix

| Exercise | Check | Result |
|---|---|---|
| FORMAT2 | Source member created | PASS |
| FORMAT2 | IBMZPLI compile | RC=0000 |
| FORMAT2 | Binder | RC=0000 |
| FORMAT2 | GO | RC=0000 |
| FORMAT2 | Program output | `PL/I FORMAT RULES VALIDATED` |
| IDENT3 initial | Compiler input | FAIL — `IBM1048I`, RC=16 |
| IDENT3 initial | BIND | Correctly skipped |
| IDENT3 initial | GO | Correctly skipped |
| IDENT3 corrected | Source member verified | PASS |
| IDENT3 corrected | IBMZPLI compile | RC=0000 |
| IDENT3 corrected | Compiler messages | None |
| IDENT3 corrected | Binder | RC=0000 |
| IDENT3 corrected | Binder errors/warnings | None |
| IDENT3 corrected | GO | RC=0000 |
| IDENT3 corrected | Program output | `DATA         NAMES` |

The lab is considered complete because the final state is reproducible and supported by source, JCL, return-code evidence, Binder evidence, program output and documented troubleshooting.
