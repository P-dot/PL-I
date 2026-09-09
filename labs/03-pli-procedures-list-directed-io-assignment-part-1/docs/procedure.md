# Procedure

1. Create the PL/I source member in `IBMUSER.PLI.SRC`.
2. Keep source text inside the active compiler margins; this lab demonstrated the impact of `MARGINS(2,72)`.
3. Reuse the validated compile-bind-run JCL and change the program-specific source, load-module and execution references.
4. For `LISTIO3`, provide runtime input with `SYSIN DD *` in the `GO` step.
5. Submit through JES2.
6. In SDSF, validate the PLI, BIND and GO condition codes.
7. Open compiler `SYSPRINT` and confirm no compiler errors in the final run.
8. Open GO output and validate the expected functional result.
9. Preserve both failure and correction evidence where troubleshooting occurred.
