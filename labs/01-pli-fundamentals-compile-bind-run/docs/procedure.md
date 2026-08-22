# Procedure — Lab 01

## 1. Discover the compiler

Search the ADCD installation and verify:

```text
IEL390.SIBMZCMP(IBMZPLI)
```

Also verify the presence of Language Environment (`CEE.*`).

## 2. Prepare libraries

Create:

```text
IBMUSER.PLI.SRC
IBMUSER.PLI.JCL
IBMUSER.PLI.LOAD
```

Keep source/JCL as fixed-block 80-byte records and use a suitable load-library allocation for executable members.

## 3. Create source member

Create:

```text
IBMUSER.PLI.SRC(ADD)
```

Copy the source from `pli/ADD.pli`. Preserve the leading blank/source margin.

## 4. Create JCL member

Create:

```text
IBMUSER.PLI.JCL(PLICLG)
```

Copy the JCL from `jcl/PLICLG.jcl` and adapt the JOB card if required by the local JES installation.

## 5. Submit

From ISPF edit:

```text
SUB
```

## 6. Inspect SDSF

Use SDSF `ST` and inspect the job. Check:

- compiler `SYSPRINT`;
- Binder `SYSPRINT`;
- JES messages and return codes;
- GO-step `SYSOUT`.

## 7. Verify result

Input:

```text
10 20
```

Expected output:

```text
SUM OF TWO NUMBERS          30
```
