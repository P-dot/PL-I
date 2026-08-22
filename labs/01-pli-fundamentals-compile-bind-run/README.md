# Lab 01 — PL/I Fundamentals: Compile, Bind and Run on z/OS

## Objective

Build and execute the first PL/I program on the local IBM z/OS ADCD 1.11 environment, while documenting how the PL/I compiler was discovered and how a complete batch flow works:

`PL/I source → IBMZPLI compiler → object → z/OS Binder → load module → execution`

The program reads two numbers, adds them, and writes the result.

## Learning outcomes

After this lab you should be able to explain:

- what `PROCEDURE OPTIONS(MAIN)` means;
- how PL/I declarations with `DCL` work;
- the role of `FIXED DECIMAL`;
- how `GET LIST` and `PUT LIST` perform simple input/output;
- why PL/I source in this legacy environment must respect source margins;
- how `IBMZPLI` is loaded through `STEPLIB`;
- the difference between compile, bind, and run;
- why Language Environment libraries matter;
- how to diagnose compiler RCs and execution output in SDSF.

## Environment discovery

Initial searches did not find modern cataloged procedures such as `IBMZC`, so the installation was inspected directly.

The compiler was located at:

```text
IEL390.SIBMZCMP(IBMZPLI)
```

This confirmed an Enterprise PL/I 3.9-generation installation on the ADCD image. Language Environment libraries under `CEE.*` were also present.

## z/OS datasets created

```text
IBMUSER.PLI.SRC   source library
IBMUSER.PLI.JCL   JCL library
IBMUSER.PLI.LOAD  load-module library
```

The source and JCL libraries use classic fixed-block 80-byte records. The load library is reserved for executable modules produced by the Binder.

## Program

Member:

```text
IBMUSER.PLI.SRC(ADD)
```

Repository copy: [`pli/ADD.pli`](pli/ADD.pli)

The first character position is intentionally left blank in the repository source because the compiler configuration used in this environment treats column 1 outside the PL/I source margin.

## Batch flow

Member:

```text
IBMUSER.PLI.JCL(PLICLG)
```

Repository copy: [`jcl/PLICLG.jcl`](jcl/PLICLG.jcl)

### Step 1 — Compile

`PGM=IBMZPLI` executes the PL/I compiler from `IEL390.SIBMZCMP` and produces an object deck in a temporary data set.

### Step 2 — Bind

`IEWBLINK` receives the generated object and creates:

```text
IBMUSER.PLI.LOAD(ADD)
```

Language Environment binder support is supplied through `CEE.SCEELKED`.

### Step 3 — Run

The resulting program is loaded from `IBMUSER.PLI.LOAD`, receives:

```text
10 20
```

and produces:

```text
SUM OF TWO NUMBERS          30
```

## Troubleshooting performed

Two useful failures were preserved as part of the lab instead of being hidden:

1. **Insufficient virtual storage** — the compiler reported that not enough virtual memory was available. The compile step was changed to `REGION=0M` in the controlled lab environment.
2. **Source-margin error** — when PL/I statements started in column 1, the compiler effectively saw `ADD` as `DD` and `END` as `ND`, generating syntax errors. Moving source text inside the accepted source margin resolved the issue.

See [`docs/troubleshooting.md`](docs/troubleshooting.md).

## Result

The full compile → bind → run chain completed successfully and SDSF showed the expected program output:

```text
SUM OF TWO NUMBERS          30
```

## Evidence

See [`evidence/screenshots/`](evidence/screenshots/) for the selected screenshots documenting compiler discovery, dataset preparation, source, JCL, failures, remediation, and final execution.

## References

Primary learning sequence: supplied PL/I tutorial video.

Technical validation: IBM Enterprise PL/I for z/OS Programming Guide and IBM z/OS/ADCD documentation used during the lab.
