# Lab 02 — PL/I Coding Format, Identifiers and Character Set

## Status

**Completed and validated on z/OS ADCD 1.11.**

The lab contains two independent practical exercises, `FORMAT2` and `IDENT3`, and preserves both successful evidence and a real troubleshooting incident.

## Learning sequence

The tutorial videos remain the primary teaching sequence. IBM documentation is used to validate terminology, compiler behavior and z/OS-specific details, while the executable exercises are adapted to the actual installed Enterprise PL/I environment.

## Objectives

This lab demonstrates:

- the traditional 80-column PL/I source model used by the course;
- the practical effect of compiler source margins;
- labels and the colon separator;
- statement termination with `;`;
- procedure and data identifiers;
- character variables and literals;
- the compile → bind → run lifecycle;
- return-code and SDSF validation;
- diagnosis of a missing/unavailable `SYSIN` source member.

## Runtime environment

| Component | Value |
|---|---|
| Operating system | IBM z/OS ADCD 1.11 |
| Interface | TSO / ISPF |
| Batch | JES2 / SDSF |
| PL/I compiler generation | Enterprise PL/I for z/OS 3.9 |
| Compiler module | `IBMZPLI` |
| Compiler load library | `IEL390.SIBMZCMP` |
| Language Environment | `CEE.SCEERUN` |
| Binder | `IEWBLINK` |
| Binder library | `CEE.SCEELKED` |
| Source library | `IBMUSER.PLI.SRC` |
| JCL library | `IBMUSER.PLI.JCL` |
| Load library | `IBMUSER.PLI.LOAD` |

## Part 1 — `FORMAT2`: coding format and rules

Source: [`pli/FORMAT2.pli`](pli/FORMAT2.pli)  
JCL: [`jcl/FORMAT2.jcl`](jcl/FORMAT2.jcl)

The exercise deliberately keeps the program logic small so the focus remains on source layout, labels and statement structure.

```pli
 FORMAT2: PROCEDURE OPTIONS(MAIN);
    DCL MESSAGE CHAR(30);
    MESSAGE = 'PL/I FORMAT RULES VALIDATED';
    PUT SKIP LIST(MESSAGE);
 END FORMAT2;
```

Validated output:

```text
PL/I FORMAT RULES VALIDATED
```

Validation:

- compiler RC=0000;
- Binder RC=0000;
- GO RC=0000;
- load module `FORMAT2` saved in `IBMUSER.PLI.LOAD`;
- output verified in SDSF.

## Part 2 — `IDENT3`: identifiers and character data

Source: [`pli/IDENT3.pli`](pli/IDENT3.pli)  
JCL: [`jcl/IDENT3.jcl`](jcl/IDENT3.jcl)

```pli
 IDENT3: PROCEDURE OPTIONS(MAIN);
    DCL NAME1 CHAR(12);
    DCL NAME2 CHAR(12);
    NAME1 = 'DATA';
    NAME2 = 'NAMES';
    PUT SKIP LIST(NAME1,NAME2);
 END IDENT3;
```

The exercise distinguishes:

- `IDENT3` — procedure identifier / label;
- `NAME1` and `NAME2` — data identifiers;
- `'DATA'` and `'NAMES'` — character literals;
- `PROCEDURE`, `DCL`, `CHAR`, `PUT`, `SKIP`, `LIST`, `END` — language elements rather than user-defined data names.

Validated output:

```text
DATA         NAMES
```

Final validation:

- compiler RC=0000;
- no compiler messages;
- Binder RC=0000;
- no Binder terminal/severe/error/warning messages;
- GO RC=0000;
- load module `IDENT3` saved in `IBMUSER.PLI.LOAD`;
- output verified in SDSF.

## Real troubleshooting incident

The first `IDENT3` submission did not reach PL/I source parsing. The compile step returned RC=16 with:

```text
IBM1048I W File DD:SYSIN could not be opened.
```

`BIND` and `GO` were skipped by the existing condition logic, which prevented an invalid object from progressing further.

The source member was checked and found not to be available in `IBMUSER.PLI.SRC`. After recreating and verifying `IBMUSER.PLI.SRC(IDENT3)`, the same validated JCL was resubmitted and completed at RC=0000 in all three phases.

See [`docs/troubleshooting.md`](docs/troubleshooting.md).

## Execution architecture

```text
IBMUSER.PLI.SRC(member)
          |
          v
       IBMZPLI
          |
          v
      &&LOADSET
          |
          v
       IEWBLINK
          |
          v
IBMUSER.PLI.LOAD(member)
          |
          v
      EXEC PGM=member
          |
          v
         SDSF
```

## Evidence

The selected screenshots are indexed in [`evidence/README.md`](evidence/README.md). The evidence set includes source, JCL, compiler/binder return codes, the `IBM1048I` failure, final successful compile/bind/run and program output.

## Scope boundary

This lab intentionally stops after the video material covering coding format/rules, identifiers and character set. The next tutorial material will be handled in a separate lab so the learning sequence is not mixed.
