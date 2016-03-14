* ;
*Variable: loan;
* ;
Label REP_loan= 'Replacement: Amount of current loan request';
REP_loan= loan;
if loan eq . then REP_loan = .;
else
if loan<-15948.4177 then REP_loan=-15948.4177;
else
if loan>53316.594945 then REP_loan=53316.594945;
