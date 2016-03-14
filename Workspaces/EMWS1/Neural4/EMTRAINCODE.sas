*------------------------------------------------------------*;
* Neural4: Create decision matrix;
*------------------------------------------------------------*;
data WORK.bad(label="bad");
  length   bad                              $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
bad="1"; COUNT=594; DATAPRIOR=0.19939577039274; TRAINPRIOR=0.19939577039274; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
bad="0"; COUNT=2385; DATAPRIOR=0.80060422960725; TRAINPRIOR=0.80060422960725; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify bad(type=PROFIT label=bad);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_Neural4;
set EMWS1.Repl_TRAIN(keep=
REP_clage REP_clno REP_debtinc REP_delinq REP_derog REP_loan REP_mortdue
REP_ninq REP_value REP_yoj bad job reason );
run;
*------------------------------------------------------------* ;
* Neural4: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    bad(DESC) job(ASC) reason(ASC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural4: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    REP_clage REP_clno REP_debtinc REP_delinq REP_derog REP_loan REP_mortdue
   REP_ninq REP_value REP_yoj
%mend DMDBVar;
*------------------------------------------------------------*;
* Neural4: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural4
dmdbcat=WORK.Neural4_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
bad
;
run;
quit;
*------------------------------------------------------------* ;
* Neural4: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;
    REP_clage REP_clno REP_debtinc REP_delinq REP_derog REP_loan REP_mortdue
   REP_ninq REP_value REP_yoj
%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural4: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural4: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;
    job reason
%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural4: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;

%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural4 dmdbcat=WORK.Neural4_DMDB
validdata = EMWS1.Repl_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %INTINPUTS / level=interval id=intvl
;
input %NOMINPUTS / level=nominal id=nom
;
target bad / level=NOMINAL id=bad
bias
;
arch MLP
Hidden=1
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural4_PRELIM_OUTEST
;
save network=EMWS1.Neural4_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural4_outest estiter=1
Outfit=EMWS1.Neural4_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural4_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural4;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural4(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural4_INITIAL;
set EMWS1.Neural4_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural4 dmdbcat=WORK.Neural4_DMDB
validdata = EMWS1.Repl_VALIDATE
network = EMWS1.Neural4_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural4_INITIAL;
train tech=NONE;
code file="C:\Users\bteric01\Documents\Tutorials_Projects\Project_3\Workspaces\EMWS1\Neural4\SCORECODE.sas"
group=Neural4
;
;
code file="C:\Users\bteric01\Documents\Tutorials_Projects\Project_3\Workspaces\EMWS1\Neural4\RESIDUALSCORECODE.sas"
group=Neural4
residual
;
;
score data=EMWS1.Repl_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural4_OUTKEY;
score data=EMWS1.Repl_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS1.Neural4_OUTKEY;
run;
quit;
data EMWS1.Neural4_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS1.Neural4_EMESTIMATE;
set EMWS1.Neural4_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural4;
run;
quit;
