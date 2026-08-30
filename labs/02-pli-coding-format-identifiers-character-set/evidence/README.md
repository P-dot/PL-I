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
