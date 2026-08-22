//PLICLG   JOB (ACCT),'PLI LAB01',
//             CLASS=A,MSGCLASS=X,
//             MSGLEVEL=(1,1),NOTIFY=&SYSUID
//*
//* LAB 01 - FIRST PL/I COMPILE, BIND AND RUN
//* ENTERPRISE PL/I V3.9 / ADCD Z/OS 1.11
//*
//* -------------------------------------------------------
//* STEP 1 - COMPILE
//* -------------------------------------------------------
//PLI      EXEC PGM=IBMZPLI,REGION=0M,
//             PARM='OBJECT,OPTIONS'
//STEPLIB  DD DSN=IEL390.SIBMZCMP,DISP=SHR
//         DD DSN=CEE.SCEERUN,DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSLIN   DD DSN=&&LOADSET,DISP=(MOD,PASS),
//             UNIT=SYSDA,SPACE=(TRK,(5,5)),
//             DCB=(RECFM=FB,LRECL=80,BLKSIZE=3200)
//SYSUT1   DD UNIT=SYSDA,SPACE=(TRK,(5,5))
//SYSIN    DD DSN=IBMUSER.PLI.SRC(ADD),DISP=SHR
//*
//* -------------------------------------------------------
//* STEP 2 - BIND
//* -------------------------------------------------------
//BIND     EXEC PGM=IEWBLINK,COND=(4,LT,PLI)
//SYSLIB   DD DSN=CEE.SCEELKED,DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSLIN   DD DSN=&&LOADSET,DISP=(OLD,DELETE)
//SYSLMOD  DD DSN=IBMUSER.PLI.LOAD(ADD),DISP=SHR
//SYSDEFSD DD DUMMY
//SYSIN    DD DUMMY
//*
//* -------------------------------------------------------
//* STEP 3 - RUN
//* -------------------------------------------------------
//GO       EXEC PGM=ADD,COND=((4,LT,PLI),(4,LT,BIND))
//STEPLIB  DD DSN=IBMUSER.PLI.LOAD,DISP=SHR
//         DD DSN=CEE.SCEERUN,DISP=SHR
//SYSPRINT DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//CEEDUMP  DD SYSOUT=*
//SYSUDUMP DD SYSOUT=*
//SYSIN    DD *
10 20
/*
