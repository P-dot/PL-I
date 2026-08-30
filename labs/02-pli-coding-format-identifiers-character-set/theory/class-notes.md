# Theory notes

## 1. Coding format

The tutorial introduces a traditional 80-column source model. In this environment the PL/I source library is fixed-record (`FB`) with `LRECL=80`. The compiler processes only its configured source margins, so physical alignment is operationally significant rather than merely cosmetic.

The earlier laboratory work already demonstrated the consequence of incorrect placement: characters outside the active input margin can be ignored and alter what the compiler sees.

## 2. Labels and colon

A label precedes a statement and is separated from it with a colon.

```pli
 FORMAT2: PROCEDURE OPTIONS(MAIN);
```

`FORMAT2` names the procedure entry used by this program. The colon is syntactic, not decorative.

## 3. Semicolon

PL/I statements terminate with `;`. A physical source record and a PL/I statement are not inherently the same thing; the terminator defines the statement boundary.

## 4. Identifiers

An identifier is a user-defined name for a program element. This lab uses `IDENT3`, `NAME1`, `NAME2`, `FORMAT2`, and `MESSAGE`.

The lab deliberately distinguishes identifiers from language words such as `PROCEDURE`, `DCL`, `CHAR`, `PUT`, `LIST`, and `END`.

## 5. Character set and blanks

The tutorial introduces letters, digits, national/special characters and the rule that blanks do not occur inside a single identifier. Blanks instead separate lexical elements in source statements.

## 6. z/OS context

Source is processed in the z/OS/EBCDIC environment. Naming rules must also be considered when PL/I names later map to external z/OS constructs such as JCL DD names; a name valid inside PL/I is not automatically a valid JCL name.

## 7. Compile, bind and run

Each practical exercise is validated through the full lifecycle:

```text
PL/I source -> IBMZPLI -> object -> IEWBLINK -> load module -> execution
```

This is why the lab records separate compiler, Binder and GO return codes instead of treating a successful final screen as sufficient evidence.
