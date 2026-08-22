# Class Notes — PL/I Fundamentals

## PL/I

PL/I means **Programming Language One**. It was designed by IBM as a general-purpose language capable of supporting both business-oriented and scientific workloads.

## Basic structure

A main PL/I procedure can be introduced with:

```pli
 ADD: PROCEDURE OPTIONS(MAIN);
```

`PROCEDURE` starts a procedure and `OPTIONS(MAIN)` identifies the main procedure of the executable program.

PL/I statements terminate with a semicolon (`;`).

## Declarations

```pli
 DCL INP1 FIXED DECIMAL(5);
```

`DCL` declares a variable. `FIXED DECIMAL(5)` defines a fixed-point decimal value with five decimal digits of precision.

The result is declared with six digits because adding two five-digit positive values can require six digits.

## Input and output

```pli
 GET LIST(INP1,INP2);
```

reads values into the variables.

```pli
 PUT LIST('SUM OF TWO NUMBERS',RESULT);
```

writes text and the computed result.

## Program logic

```pli
 RESULT = INP1 + INP2;
```

assigns the sum to `RESULT`.

## Source margins in the legacy environment

The tutorial introduces the traditional mainframe layout where column 1 is not part of the normal statement area. The practical lab confirmed that this matters with the compiler configuration used here: starting `ADD` and `END` in column 1 caused them to be read effectively as `DD` and `ND`.

Therefore the repository source intentionally begins statements after column 1.
