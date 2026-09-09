# Theory Notes - Lab 03 Part 1

## PROCEDURE

A PL/I procedure is a block delimited by a `PROCEDURE` statement and its corresponding `END`. `OPTIONS(MAIN)` identifies the main procedure used as the application entry point for this lab.

## List-directed I/O

`GET LIST` reads values into variables in list order. `PUT LIST` writes values or expressions using list-directed formatting. `SKIP` advances output before the list is written.

In batch execution, the lab maps runtime input to the `GO` step through a `SYSIN DD *` instream data definition.

## Assignment

The basic form is:

```pli
target = expression;
```

The right-hand expression is evaluated and its result is stored in the target variable. `ASSIGN3` validates both constant assignment and expression assignment.

## Fixed decimal declarations used in Part 1

Declarations such as `DCL NUM1 FIXED DECIMAL(5);` are used here only as prerequisites for the exercises. Detailed treatment of decimal fixed-point constants and `DECLARE` is intentionally deferred to Lab 03 Part 2.
