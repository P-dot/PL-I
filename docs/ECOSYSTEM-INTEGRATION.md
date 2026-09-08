# PL/I — Ecosystem Integration

## Purpose

This document defines the role of the `PL-I` repository within the broader z/OS Engineering Laboratory.

The repository is the PL/I language-learning and batch application layer of the ecosystem. Its current validated scope covers PL/I source structure, compiler discovery, compile → bind → run processing, Language Environment dependencies, source-format rules, identifiers, character data, runtime input/output, return-code validation and troubleshooting.

The document separates what has already been executed and evidenced from future integration targets.

Master architecture:

https://github.com/P-dot/zos-adcd-hercules-engineering-lab

---

## 1. Position in the ecosystem

The current PL/I learning path fits into the wider laboratory as:

```text
MVS_TSO_ISPF
      |
      v
   JCL_LABS
      |
      v
     PL/I
      |
      +--> compile
      +--> bind
      +--> run
      +--> Language Environment
      |
      +--> future VSAM
      +--> future Db2
      +--> future CICS
      +--> future scheduler-controlled execution
```

PL/I is therefore a language and application-programming layer, not a replacement for JCL, JES2, Db2, VSAM, CICS or RACF.

---

## 2. Repository responsibility

The `PL-I` repository currently owns practical work around:

- PL/I fundamentals;
- `PROCEDURE OPTIONS(MAIN)`;
- `DCL`;
- `FIXED DECIMAL`;
- character variables;
- identifiers;
- labels;
- statement termination;
- `GET LIST`;
- `PUT LIST`;
- traditional source-format and margin behavior;
- compiler discovery;
- `IBMZPLI`;
- `STEPLIB`;
- compile;
- bind;
- execution;
- `IEWBLINK`;
- Language Environment;
- source, JCL and load libraries;
- SDSF validation;
- compiler, binder and execution return codes;
- troubleshooting and recovery from real failures.

---

## 3. What this repository does not own

### JCL

General JCL syntax, JOB/EXEC/DD semantics, procedures and batch utilities belong to:

```text
JCL_LABS
```

PL/I contains JCL only where needed to compile, bind and execute PL/I programs.

### VSAM

VSAM organization, IDCAMS, access methods and addressing models belong to:

```text
vsam01
```

Future PL/I access to VSAM should be documented as cross-repository integration.

### Db2

SQL, catalog, integrity and Db2 operational concepts belong to:

```text
DB2-
```

Future PL/I/Db2 work should not duplicate the Db2 learning track.

### CICS

Transaction processing, BMS, runtime resources, CEDA/CEMT/CECI/CEDF and online execution belong to:

```text
CICS
```

Future PL/I/CICS work would be an integration layer, not a replacement for the CICS repository.

### RACF

Security administration and authorization concepts belong to:

```text
mainframe-racf-security-evidence
```

### Core system engineering

JES2, storage, SMF, WLM, dumps, system diagnostics and recovery belong to:

```text
zos-adcd-hercules-engineering-lab
```

---

## 4. Upstream dependencies

The current validated PL/I work depends on:

- z/OS;
- TSO/E;
- ISPF;
- JES2;
- SDSF;
- JCL;
- Enterprise PL/I;
- PL/I compiler module `IBMZPLI`;
- compiler load library;
- Language Environment;
- Binder;
- source libraries;
- JCL libraries;
- load libraries.

Conceptually:

```text
TSO/ISPF
   |
   v
PL/I source
   |
   v
JCL
   |
   v
IBMZPLI
   |
   v
object
   |
   v
IEWBLINK
   |
   v
load module
   |
   v
execution
   |
   v
SDSF
```

---

## 5. Current repository structure

The repository currently contains:

```text
labs/
  01-pli-fundamentals-compile-bind-run/
  02-pli-coding-format-identifiers-character-set/
```

Both labs are complete and validated.

The repository also preserves:

- source;
- JCL;
- theory;
- procedures;
- troubleshooting;
- validation;
- evidence;
- installation/publishing scripts.

---

## 6. Lab 01 — PL/I Fundamentals: Compile, Bind and Run

Lab 01 establishes the full basic lifecycle:

```text
PL/I source
    |
    v
 IBMZPLI
    |
    v
 object
    |
    v
IEWBLINK
    |
    v
load module
    |
    v
execution
```

The program reads two numbers, adds them and displays the result.

### Validated concepts

The lab validates:

- PL/I program structure;
- `PROCEDURE OPTIONS(MAIN)`;
- `DCL`;
- `FIXED DECIMAL`;
- `GET LIST`;
- `PUT LIST`;
- source margins;
- compiler discovery;
- `STEPLIB`;
- compile;
- bind;
- load-module creation;
- execution;
- SDSF output inspection;
- Language Environment support.

### Compiler discovery

The environment did not provide the expected modern cataloged procedure path, so the compiler was located directly.

The validated compiler module is:

```text
IBMZPLI
```

This is a useful operational lesson: the repository documents the installed environment rather than assuming a newer compiler setup.

### Batch flow

```text
source member
    |
    v
compile
    |
    v
temporary object
    |
    v
bind
    |
    v
load module
    |
    v
run
```

The final program output confirmed successful execution.

### Real failures preserved

Lab 01 retains two useful incidents:

1. insufficient virtual storage during compile;
2. source-margin errors caused by statements starting outside the accepted source area.

The corrections were applied and the final flow completed successfully.

---

## 7. Lab 02 — Coding Format, Identifiers and Character Set

Lab 02 deepens the language layer while keeping the same build architecture.

It contains two independent exercises:

```text
FORMAT2
IDENT3
```

### FORMAT2

The first exercise validates:

- traditional source format;
- source margins;
- labels;
- colon separator;
- statement terminator `;`;
- procedure structure;
- character data;
- compile → bind → run.

Validated result:

```text
compiler RC=0000
binder   RC=0000
GO       RC=0000
```

### IDENT3

The second exercise validates:

- procedure identifiers;
- data identifiers;
- character variables;
- literals;
- language elements;
- successful load-module creation;
- successful execution.

It distinguishes between:

```text
procedure identifier
data identifiers
character literals
language keywords
```

### Real troubleshooting incident

The first submission failed before source parsing because the `SYSIN` member was unavailable.

The compile returned a severe return code and downstream processing was skipped by the existing condition logic.

After restoring and verifying the source member, the same JCL completed successfully with:

```text
compile RC=0000
bind    RC=0000
GO      RC=0000
```

This is an important validation of controlled batch behavior.

---

## 8. Validated build architecture

The current validated architecture is:

```text
PL/I source
    |
    v
 IBMZPLI
    |
    v
temporary object
    |
    v
 IEWBLINK
    |
    v
load library
    |
    v
EXEC PGM
    |
    v
SDSF output
```

This path is fully validated across both labs.

---

## 9. Language Environment role

Language Environment is part of the current PL/I execution architecture.

The repository demonstrates that PL/I execution does not exist in isolation:

```text
PL/I program
    |
    v
Language Environment
    |
    v
z/OS runtime
```

The PL/I repository should continue to document LE dependencies where they materially affect compile, bind or execution.

It should not become a general Language Environment administration repository.

---

## 10. JCL relationship

PL/I consumes JCL as its batch-execution mechanism.

The relationship is:

```text
JCL_LABS
   |
   v
general batch knowledge
   |
   v
PL/I-specific build JCL
```

The PL/I repository owns:

- compiler invocation;
- binder invocation;
- PL/I-specific DD relationships;
- runtime DD requirements.

The JCL repository owns the general language of batch job control.

---

## 11. JES2 and SDSF relationship

JES2 executes the submitted build and run jobs.

SDSF provides the evidence used to validate:

- compiler RC;
- binder RC;
- GO RC;
- program output;
- compiler messages;
- binder messages;
- failed steps;
- skipped steps.

Conceptually:

```text
PL/I JCL
   |
   v
JES2
   |
   v
compile / bind / run
   |
   v
SDSF
```

---

## 12. Inputs consumed by the repository

The repository consumes:

- PL/I source;
- JCL;
- compiler libraries;
- Language Environment libraries;
- Binder services;
- input data;
- TSO/ISPF;
- JES2;
- SDSF.

---

## 13. Outputs produced by the repository

The repository produces:

- PL/I source examples;
- build JCL;
- object output;
- load modules;
- runtime output;
- compiler diagnostics;
- binder diagnostics;
- SDSF evidence;
- troubleshooting documentation;
- theory notes;
- reproducible procedures.

---

## 14. Current validated integration map

```text
TSO/ISPF
   |
   v
JCL
   |
   v
JES2
   |
   +--> IBMZPLI
   |      |
   |      v
   |    object
   |
   +--> IEWBLINK
   |      |
   |      v
   |   load module
   |
   +--> execution
          |
          v
        SDSF
```

Validated state:

```text
PL/I source -> compile -> bind -> run
```

---

## 15. Validated vs planned

| Integration path | State |
|---|---|
| TSO/ISPF → PL/I source preparation | Validated |
| JCL/JES2 → IBMZPLI compile | Validated |
| IBMZPLI → object | Validated |
| object → IEWBLINK → load module | Validated |
| load module → execution | Validated |
| Language Environment runtime support | Validated |
| SDSF return-code/output validation | Validated |
| PL/I language fundamentals | Validated |
| PL/I source margins and coding format | Validated |
| PL/I identifiers and character data | Validated |
| PL/I → VSAM | Planned |
| PL/I → Db2 | Planned |
| CICS → PL/I | Planned |
| Scheduler → JCL/JES2 → PL/I | Planned |
| RACF-controlled PL/I application flow | Planned |

---

## 16. Planned VSAM integration

A future application path may be:

```text
PL/I
 |
 v
VSAM
```

The PL/I repository should then document:

- PL/I file access logic;
- declarations;
- application behavior;
- compile/link requirements;
- program result.

The VSAM repository should retain ownership of:

- ESDS;
- KSDS;
- RRDS;
- LDS;
- IDCAMS;
- addressing models;
- cluster/component architecture.

---

## 17. Planned Db2 integration

A future path may be:

```text
PL/I
 |
 v
Db2
```

The PL/I repository should own the application-language side.

The Db2 repository should own:

- SQL;
- object structure;
- catalog;
- integrity;
- SQLCODE/SQLSTATE interpretation;
- database diagnostics.

No PL/I/Db2 integration should be marked validated until it has actually been built and executed.

---

## 18. Planned CICS integration

Possible future online path:

```text
CICS
 |
 v
PL/I program
```

If implemented, CICS remains responsible for:

- transaction processing;
- task management;
- runtime resources;
- online execution;
- BMS/3270 behavior where relevant.

The PL/I repository remains responsible for PL/I source and language behavior.

---

## 19. Planned scheduler integration

Future enterprise-style batch orchestration may follow:

```text
zos-batch-scheduler
        |
        v
       JCL
        |
        v
      JES2
        |
        v
      PL/I
        |
        v
       RC
        |
        v
   scheduler state
```

This is planned, not currently validated.

The scheduler decides and controls.

JCL describes the workload.

JES2 executes it.

PL/I provides the application program.

---

## 20. Return-code discipline

The PL/I repository already demonstrates the value of validating each phase independently.

```text
compile RC
bind RC
execution RC
```

A successful compile does not prove a successful bind.

A successful bind does not prove successful execution.

A final lab should therefore preserve phase-specific evidence.

---

## 21. Failure propagation

Lab 02 demonstrates controlled failure propagation.

Conceptually:

```text
source unavailable
      |
      v
compile fails
      |
      v
object unavailable
      |
      v
bind skipped
      |
      v
run skipped
```

This is more valuable than forcing later steps to run against invalid artifacts.

Future labs should preserve this engineering pattern.

---

## 22. Source-format discipline

The current environment demonstrates that source-format rules matter.

The repository has already observed failures caused by text positioned outside the expected source margin.

Therefore source layout is not merely stylistic.

It can directly alter how the compiler interprets statements.

Future labs should preserve source-format notes where they affect reproducibility.

---

## 23. Compiler-discovery discipline

The repository documents the compiler that actually exists in the lab.

This principle should remain:

```text
discover installed environment
        |
        v
validate compiler/library
        |
        v
build against real system
```

Avoid assuming a cataloged procedure, compiler generation or installation layout that has not been observed.

---

## 24. Repository evidence model

A mature PL/I lab should preserve:

```text
source
JCL
theory
procedure
troubleshooting
validation
evidence
```

The current repository already follows that model.

This makes the work useful for both learning and portfolio review.

---

## 25. Troubleshooting model

The engineering flow is:

```text
Build
  |
Execute
  |
Observe
  |
Diagnose
  |
Correct
  |
Validate
  |
Document
```

Examples already preserved:

- compiler memory shortage;
- source-margin syntax corruption;
- unavailable `SYSIN` member;
- downstream-step skip logic;
- successful resubmission.

Failures should continue to be retained when they explain actual system behavior.

---

## 26. Publication and security rules

Public PL/I material should be reviewed for:

- credentials;
- passwords;
- tokens;
- private keys;
- IP addresses;
- MAC addresses;
- host adapter identifiers;
- terminal/session identifiers;
- unnecessary host-specific information;
- infrastructure details unrelated to the learning objective.

Screenshots and text require the same review.

---

## 27. Recommended future integration branches

Future cross-repository work can use short-lived branches such as:

```text
integration/pli-vsam
integration/pli-db2
integration/cics-pli
integration/scheduler-pli
integration/end-to-end-pli-batch
```

Lifecycle:

```text
main
 |
 +--> integration branch
          |
          +--> implementation
          +--> evidence
          +--> validation
          +--> security review
          +--> documentation
          |
          v
         PR
          |
          v
        main
          |
          v
    delete branch
```

---

## 28. Current maturity

The repository has progressed through:

```text
PL/I fundamentals
      |
      v
compiler discovery
      |
      v
compile / bind / run
      |
      v
coding format
      |
      v
identifiers / character data
```

This is an appropriate foundation for later data and integration labs.

---

## 29. Immediate next-stage opportunities

The next useful PL/I topics should continue the language-learning sequence rather than prematurely jumping to enterprise integration.

Potential future stages include:

```text
data types
control flow
conditions
arrays
structures
procedures
files
```

Cross-repository integration should begin only when the base language track is sufficiently mature.

---

## 30. Target ecosystem role

The long-term role of `PL-I` is:

> Provide the validated PL/I language, compile/bind/run and application-programming layer consumed by future batch, data and online integration tracks inside the z/OS Engineering Laboratory.

Conceptually:

```text
              Scheduler
                  |
                  v
JCL / JES2 ---> PL/I
                / | \
               /  |  \
              v   v   v
           VSAM  Db2 CICS
```

The current repository has validated only the central language/build path.

The surrounding enterprise integrations remain planned.

---

## 31. Engineering rule

The repository should continue to follow one central rule:

> Document what the installed PL/I environment actually did, not what a newer or different z/OS installation would be expected to do.

That means preserving:

- compiler discovery;
- source-format behavior;
- real return codes;
- skipped steps;
- corrected source members;
- actual SDSF output;
- environment-specific build constraints.

The repository is therefore not just a collection of PL/I syntax examples.

It is a validated record of how PL/I source becomes an executable z/OS workload.
