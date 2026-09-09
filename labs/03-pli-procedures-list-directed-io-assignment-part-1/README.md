# Lab 03 - PL/I Procedures, List-Directed I/O and Assignment Statements - Part 1

## Objective

Build and validate the first half of Lab 03 on the local z/OS ADCD 1.11 / zPDT environment, following the PL/I video sequence while adapting every exercise to the compiler, binder, Language Environment and JES2 batch workflow actually available in the system.

Part 1 covers:

1. `PROCEDURE`, procedure labels, `OPTIONS(MAIN)` and `END`
2. list-directed input/output with `GET LIST` and `PUT ... LIST`
3. assignment statements and expressions

## Environment

- z/OS ADCD 1.11 running on zPDT
- Enterprise PL/I for z/OS V3.9
- Compiler program: `IBMZPLI`
- Compiler library: `IEL390.SIBMZCMP`
- Language Environment: `CEE.SCEERUN` / `CEE.SCEELKED`
- Source library: `IBMUSER.PLI.SRC`
- JCL library: `IBMUSER.PLI.JCL`
- Load library: `IBMUSER.PLI.LOAD`
- Execution and validation: JES2 / SDSF

## Lab flow

```text
IBMUSER.PLI.SRC(member)
        |
        v
      IBMZPLI
        |
        v
     object deck
        |
        v
      IEWBLINK
        |
        v
IBMUSER.PLI.LOAD(member)
        |
        v
       GO step
        |
        v
       SDSF
```

## Part 1.1 - PROC03: main procedure

`PROC03` validates the basic structure of a PL/I main procedure:

```pli
 PROC03: PROCEDURE OPTIONS(MAIN);
    PUT SKIP LIST('PL/I MAIN PROCEDURE VALIDATED');
 END PROC03;
```

### Troubleshooting captured

The first run produced compiler `RC=0008`. The compiler listing showed that source text beginning in column 1 was interpreted incorrectly under the active `MARGINS(2,72)` behavior: `PROC03` lost its first character and `END` was seen as `ND`. The source was realigned so that column 1 remained unused.

The corrected run produced:

- PLI: `RC=0000`
- BIND: `RC=0000`
- GO: `RC=0000`
- Output: `PL/I MAIN PROCEDURE VALIDATED`

This failed-then-corrected execution is retained as troubleshooting evidence rather than hidden.

## Part 1.2 - LISTIO3: list-directed input/output

`LISTIO3` demonstrates list-directed input and output:

```pli
GET LIST(NUM1,NUM2);
PUT SKIP LIST('VALUES READ:',NUM1,NUM2);
```

The runtime input is supplied by the `GO` step:

```jcl
//SYSIN    DD *
10 20
/*
```

This is distinct from the compiler step's `SYSIN`, which points to the PL/I source member.

Validated result:

- PLI: `RC=0000`
- BIND: `RC=0000`
- GO: `RC=0000`
- Input values: `10 20`
- Output confirms `NUM1=10` and `NUM2=20`

## Part 1.3 - ASSIGN3: assignment statements

`ASSIGN3` demonstrates assignment of constants and the result of an expression:

```pli
NUM1 = 10;
NUM2 = 20;
RESULT = NUM1 + NUM2;
```

Validated output:

```text
NUM1:       10
NUM2:       20
RESULT:     30
```

The execution completed with PLI, BIND and GO all at `RC=0000`.

## Important operational finding

The current JCL template uses `COND` expressions that can allow BIND/GO to continue when the compiler returns `RC=8`. That behavior was observed during the initial `PROC03` failure. It is documented here as a lab finding and should be reviewed before treating this JCL as a hardened production-style template.

## Evidence

The `evidence/screenshots/` directory contains the screenshots supplied during the lab. They include:

- PROC03 source and JCL
- initial PROC03 compiler `RC=0008`
- compiler diagnostics
- corrected PROC03 run with `RC=0000`
- LISTIO3 source/JCL and runtime `SYSIN`
- LISTIO3 JES2/SDSF validation and output
- ASSIGN3 source/JCL
- ASSIGN3 JES2/SDSF validation and final values

See `evidence/README.md` for the evidence map.

## Validation criteria

Part 1 is considered complete because each final program has a successful compile-bind-run path and an observable functional result in SDSF.

| Program | Topic | PLI | BIND | GO | Functional validation |
|---|---|---:|---:|---:|---|
| PROC03 | Main procedure | 0000 | 0000 | 0000 | Validation message displayed |
| LISTIO3 | List-directed I/O | 0000 | 0000 | 0000 | Values 10 and 20 read from SYSIN |
| ASSIGN3 | Assignment | 0000 | 0000 | 0000 | 10 + 20 = 30 |

## Scope boundary

This package closes **Lab 03 - Part 1** only. The following video topics are intentionally deferred to Part 2:

- Decimal fixed-point constants
- `DECLARE` statement

## Repository integration

This lab belongs to the PL/I application-development path of the wider z/OS engineering portfolio and depends directly on skills demonstrated in the TSO/ISPF and JCL/JES2 repositories.

## Security / publication notes

Before commit, scan the lab text for private IPv4 addresses and MAC addresses. Screenshots should also be reviewed visually before public publication.

## Result

**LAB 03 - PART 1: COMPLETED AND VALIDATED**
