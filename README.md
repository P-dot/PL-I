# PL/I on IBM z/OS — Theory and Hands-on Labs

Hands-on PL/I learning repository built around IBM z/OS ADCD 1.11 and a zPDT-oriented mainframe laboratory environment.

The course follows the supplied PL/I tutorial videos as the primary learning sequence and uses IBM documentation to validate, complete, and contextualize the material.

## Labs

| Lab | Topic | Status |
|---|---|---|
| [01](labs/01-pli-fundamentals-compile-bind-run/) | PL/I fundamentals, compiler discovery, compile → bind → run | ✅ Complete |
| [02](labs/02-pli-coding-format-identifiers-character-set/) | Coding format, margins, labels, identifiers and character set | ✅ Complete |

## Environment

- IBM z/OS ADCD 1.11
- zPDT-oriented laboratory environment
- TSO/ISPF
- SDSF/JES2
- Enterprise PL/I for z/OS generation 3.9
- Compiler module: `IBMZPLI`
- Compiler library: `IEL390.SIBMZCMP`
- Language Environment: `CEE.*`

## Repository philosophy

Each lab combines:

1. theory from the tutorial sequence;
2. validation against IBM documentation;
3. execution on the actual ADCD system;
4. JCL, source, evidence, return-code analysis, and troubleshooting.

---

## Part of the z/OS Engineering Laboratory

This repository is a specialized component of the broader z/OS engineering laboratory.

### Master architecture

https://github.com/P-dot/zos-adcd-hercules-engineering-lab

### Engineering methodology

```text
Build -> Execute -> Observe -> Diagnose -> Correct -> Validate -> Document
```
