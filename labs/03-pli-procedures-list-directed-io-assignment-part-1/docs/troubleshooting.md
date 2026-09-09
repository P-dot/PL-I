# Troubleshooting

## PROC03 - compiler RC=0008

### Observed symptoms

The first PROC03 compilation completed with `RC=0008`. The compiler diagnostics indicated that the source ended before the logical end of the program and that statement element `ND` was invalid.

### Root cause

The active source margins began at column 2. Text placed in column 1 lost its first character during compilation:

```text
PROC03 -> ROC03
END    -> ND
```

### Correction

Leave column 1 unused and begin PL/I source within the accepted margin.

### Final result

After correction:

```text
PLI   RC=0000
BIND  RC=0000
GO    RC=0000
```

## JCL control-flow observation

The lab also demonstrated that the current `COND` expressions do not stop BIND/GO when PLI returns exactly 8. This is preserved as an engineering finding for later hardening of the reusable JCL template.
