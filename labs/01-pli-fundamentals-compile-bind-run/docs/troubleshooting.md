# Troubleshooting — Lab 01

## 1. Compiler virtual-storage failure

### Symptom

The PL/I compile step runs, but the compiler reports insufficient virtual memory and returns a non-zero return code.

### Diagnosis

This is not a PL/I syntax problem. `IBMZPLI` has already been located and started, and the source file has been opened.

### Resolution used in the lab

The compile step was changed to:

```jcl
//PLI EXEC PGM=IBMZPLI,REGION=0M,
//         PARM='OBJECT,OPTIONS'
```

`REGION=0M` was appropriate for this isolated ADCD/Hercules lab because it removed the restrictive step-region ceiling while troubleshooting.

## 2. Column-1 / source-margin problem

### Symptom

The compiler listing showed the procedure as:

```text
DD: PROCEDURE OPTIONS(MAIN);
```

and reported an invalid `ND` token near the program end.

### Root cause

The source had been entered beginning in column 1. With the compiler's source margins, the first character was outside the accepted statement area:

```text
ADD  -> DD
END  -> ND
```

### Resolution

Move PL/I statements into the valid source area by leaving column 1 blank. The repository copy `pli/ADD.pli` preserves this.

## 3. Bind and run steps skipped

When the compile step returns an unacceptable RC, later steps are intentionally bypassed through JCL `COND` processing. This prevents binding or executing an invalid/nonexistent object.

## Final verification

After the storage and source-margin corrections, the batch chain produced:

```text
SUM OF TWO NUMBERS          30
```
