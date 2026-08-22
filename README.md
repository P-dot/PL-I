# PL/I on IBM z/OS — Theory and Hands-on Labs

Hands-on PL/I learning repository built on IBM z/OS ADCD 1.11 under Hercules.

The course follows the supplied PL/I tutorial videos as the primary learning sequence and uses IBM documentation to validate, complete, and contextualize the material.

## Labs

| Lab | Topic | Status |
|---|---|---|
| [01](labs/01-pli-fundamentals-compile-bind-run/) | PL/I fundamentals, compiler discovery, compile → bind → run | ✅ Complete |

## Environment

- IBM z/OS ADCD 1.11
- Hercules
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
