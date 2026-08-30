# Procedure

## FORMAT2

1. Create `IBMUSER.PLI.SRC(FORMAT2)` with the source supplied in this repository.
2. Copy the previously validated compile/bind/run JCL pattern into `IBMUSER.PLI.JCL(FORMAT2)`.
3. Point compiler `SYSIN` to `IBMUSER.PLI.SRC(FORMAT2)`.
4. Point Binder `SYSLMOD` to `IBMUSER.PLI.LOAD(FORMAT2)`.
5. Run `PGM=FORMAT2` in the GO step.
6. Verify the JCL before submission: compiler library, LE library, temporary object, Binder library, conditions, source member and load member.
7. Submit the job.
8. Verify `PLI`, `BIND` and `GO` at RC=0000.
9. Verify `PL/I FORMAT RULES VALIDATED` in the GO output.

## IDENT3

1. Create and save `IBMUSER.PLI.SRC(IDENT3)`.
2. Verify the member exists in the PDS before submission.
3. Copy the validated JCL pattern into `IBMUSER.PLI.JCL(IDENT3)`.
4. Change the job name, source member, load member and GO program to `IDENT3`.
5. Keep the validated compiler/binder/runtime libraries unchanged.
6. Submit only after preventive JCL review.
7. On the initial attempt, capture the `IBM1048I` / RC=16 failure rather than modifying unrelated Binder or GO steps.
8. Recreate/verify the source member.
9. Resubmit unchanged functional JCL.
10. Verify compiler RC=0000, Binder RC=0000 and GO RC=0000.
11. Verify output `DATA         NAMES`.
