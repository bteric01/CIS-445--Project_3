*------------------------------------------------------------*;
* Neural3: Create decision matrix;
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
data EM_Neural3;
set EMWS1.BINNING_TRAIN(keep=
GRP_LOG_REP_clage GRP_LOG_REP_debtinc GRP_LOG_REP_ninq GRP_LOG_REP_value bad );
run;
*------------------------------------------------------------* ;
* Neural3: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    GRP_LOG_REP_clage(ASC) GRP_LOG_REP_debtinc(ASC) GRP_LOG_REP_ninq(ASC)
   GRP_LOG_REP_value(ASC) bad(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Neural3: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;

%mend DMDBVar;
*------------------------------------------------------------*;
* Neural3: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_Neural3
dmdbcat=WORK.Neural3_DMDB
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
* Neural3: Interval Input Variables Macro ;
*------------------------------------------------------------* ;
%macro INTINPUTS;

%mend INTINPUTS;
*------------------------------------------------------------* ;
* Neural3: Binary Inputs Macro ;
*------------------------------------------------------------* ;
%macro BININPUTS;

%mend BININPUTS;
*------------------------------------------------------------* ;
* Neural3: Nominal Inputs Macro ;
*------------------------------------------------------------* ;
%macro NOMINPUTS;

%mend NOMINPUTS;
*------------------------------------------------------------* ;
* Neural3: Ordinal Inputs Macro ;
*------------------------------------------------------------* ;
%macro ORDINPUTS;
    GRP_LOG_REP_clage GRP_LOG_REP_debtinc GRP_LOG_REP_ninq GRP_LOG_REP_value
%mend ORDINPUTS;
*------------------------------------------------------------*;
* Neural Network Training;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural3 dmdbcat=WORK.Neural3_DMDB
validdata = EMWS1.BINNING_VALIDATE
random=12345
;
nloptions
;
performance alldetails noutilfile;
netopts
decay=0;
input %ORDINPUTS / level=ordinal id=ord
;
target bad / level=NOMINAL id=bad
bias
;
arch MLP
Hidden=5
;
Prelim 5 preiter=10
pretime=3600
Outest=EMWS1.Neural3_PRELIM_OUTEST
;
save network=EMWS1.Neural3_NETWORK.dm_neural;
train Maxiter=50
maxtime=14400
Outest=EMWS1.Neural3_outest estiter=1
Outfit=EMWS1.Neural3_OUTFIT
;
run;
quit;
proc sort data=EMWS1.Neural3_OUTFIT(where=(_iter_ ne . and _NAME_="OVERALL")) out=fit_Neural3;
by _VAVERR_;
run;
%GLOBAL ITER;
data _null_;
set fit_Neural3(obs=1);
call symput('ITER',put(_ITER_, 6.));
run;
data EMWS1.Neural3_INITIAL;
set EMWS1.Neural3_outest(where=(_ITER_ eq &ITER and _OBJ_ ne .));
run;
*------------------------------------------------------------*;
* Neural Network Model Selection;
;
*------------------------------------------------------------*;
proc neural data=EM_Neural3 dmdbcat=WORK.Neural3_DMDB
validdata = EMWS1.BINNING_VALIDATE
network = EMWS1.Neural3_NETWORK.dm_neural
random=12345
;
nloptions noprint;
performance alldetails noutilfile;
initial inest=EMWS1.Neural3_INITIAL;
train tech=NONE;
code file="C:\Users\bteric01\Documents\Tutorials_Projects\Project_3\Workspaces\EMWS1\Neural3\SCORECODE.sas"
group=Neural3
;
;
code file="C:\Users\bteric01\Documents\Tutorials_Projects\Project_3\Workspaces\EMWS1\Neural3\RESIDUALSCORECODE.sas"
group=Neural3
residual
;
;
score data=EMWS1.BINNING_TRAIN out=_NULL_
outfit=WORK.FIT1
role=TRAIN
outkey=EMWS1.Neural3_OUTKEY;
score data=EMWS1.BINNING_VALIDATE out=_NULL_
outfit=WORK.FIT2
role=VALID
outkey=EMWS1.Neural3_OUTKEY;
run;
quit;
data EMWS1.Neural3_OUTFIT;
merge WORK.FIT1 WORK.FIT2;
run;
data EMWS1.Neural3_EMESTIMATE;
set EMWS1.Neural3_outest;
if _type_ ^in('HESSIAN' 'GRAD');
run;
proc datasets lib=work nolist;
delete EM_Neural3;
run;
quit;
