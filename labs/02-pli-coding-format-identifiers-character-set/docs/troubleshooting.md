# Troubleshooting — `IBM1048I` / compile RC=16

## Symptom

The first `IDENT3` submission produced:

```text
IBM1048I W File DD:SYSIN could not be opened.
```

The `PLI` step ended with RC=16. `BIND` and `GO` did not execute because the JCL condition logic correctly blocked downstream processing.

## What the error did *not* mean

At that point the compiler had not successfully opened the source input. Therefore it was premature to diagnose:

- PL/I syntax;
- identifier rules;
- Binder options;
- load-library attributes;
- the GO step.

The failure was at the compiler input boundary.

## Diagnostic path

```text
PLI RC=16
  |
  v
IBM1048I: DD:SYSIN could not be opened
  |
  v
Verify SYSIN DSN/member
  |
  v
Check IBMUSER.PLI.SRC member list
  |
  v
IDENT3 not available
  |
  v
Recreate + SAVE + verify member
  |
  v
Resubmit same functional JCL
  |
  v
PLI=0 -> BIND=0 -> GO=0
```

## Root cause

`IBMUSER.PLI.SRC(IDENT3)` was not actually available to the compiler when the first job ran.

## Resolution

The member was recreated, saved and verified in the source PDS. No speculative changes were made to compiler libraries, Binder configuration or the runtime step.

## Final validation

The next execution completed with:

```text
PLI   RC=0000
BIND  RC=0000
GO    RC=0000
```

and produced:

```text
DATA         NAMES
```

## Engineering lesson

A return code is only the starting point. Read the component message and determine the failing boundary before changing configuration. Here, the `SYSIN` open failure isolated the fault before compilation, and the condition checks prevented invalid downstream processing.
