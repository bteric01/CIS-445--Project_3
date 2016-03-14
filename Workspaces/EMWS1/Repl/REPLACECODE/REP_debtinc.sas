* ;
*Variable: debtinc;
* ;
Label REP_debtinc= 'Replacement: Debt to income ratio';
REP_debtinc= debtinc;
if debtinc eq . then REP_debtinc = .;
else
if debtinc<6.7670205261 then REP_debtinc=6.7670205261;
else
if debtinc>60.806885565 then REP_debtinc=60.806885565;
