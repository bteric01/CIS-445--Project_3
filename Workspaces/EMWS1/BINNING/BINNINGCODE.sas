*------------------------------------------------------------*;
* Generating Bins for interval variables;
*------------------------------------------------------------*;
if LOG_REP_clage eq . then BIN_LOG_REP_clage= .;
else do;
if LOG_REP_clage < 4.76 then BIN_LOG_REP_clage=1;
else if LOG_REP_clage < 5.17 then BIN_LOG_REP_clage=2;
else if LOG_REP_clage < 5.45 then BIN_LOG_REP_clage=3;
else if LOG_REP_clage >= 5.45 then BIN_LOG_REP_clage=4;
end;
if LOG_REP_clno eq . then BIN_LOG_REP_clno= .;
else do;
if LOG_REP_clno < 2.71 then BIN_LOG_REP_clno=1;
else if LOG_REP_clno < 3.04 then BIN_LOG_REP_clno=2;
else if LOG_REP_clno < 3.3 then BIN_LOG_REP_clno=3;
else if LOG_REP_clno >= 3.3 then BIN_LOG_REP_clno=4;
end;
if LOG_REP_debtinc eq . then BIN_LOG_REP_debtinc= .;
else do;
if LOG_REP_debtinc < 3.4 then BIN_LOG_REP_debtinc=1;
else if LOG_REP_debtinc < 3.58 then BIN_LOG_REP_debtinc=2;
else if LOG_REP_debtinc < 3.69 then BIN_LOG_REP_debtinc=3;
else if LOG_REP_debtinc >= 3.69 then BIN_LOG_REP_debtinc=4;
end;
if LOG_REP_delinq eq . then BIN_LOG_REP_delinq= .;
else do;
if LOG_REP_delinq < 0 then BIN_LOG_REP_delinq=1;
else if LOG_REP_delinq >= 0 then BIN_LOG_REP_delinq=2;
end;
if LOG_REP_derog eq . then BIN_LOG_REP_derog= .;
else do;
if LOG_REP_derog < 0 then BIN_LOG_REP_derog=1;
else if LOG_REP_derog >= 0 then BIN_LOG_REP_derog=2;
end;
if LOG_REP_loan eq . then BIN_LOG_REP_loan= .;
else do;
if LOG_REP_loan < 9.31 then BIN_LOG_REP_loan=1;
else if LOG_REP_loan < 9.69 then BIN_LOG_REP_loan=2;
else if LOG_REP_loan < 10.05 then BIN_LOG_REP_loan=3;
else if LOG_REP_loan >= 10.05 then BIN_LOG_REP_loan=4;
end;
if LOG_REP_mortdue eq . then BIN_LOG_REP_mortdue= .;
else do;
if LOG_REP_mortdue < 10.75 then BIN_LOG_REP_mortdue=1;
else if LOG_REP_mortdue < 11.08 then BIN_LOG_REP_mortdue=2;
else if LOG_REP_mortdue < 11.45 then BIN_LOG_REP_mortdue=3;
else if LOG_REP_mortdue >= 11.45 then BIN_LOG_REP_mortdue=4;
end;
if LOG_REP_ninq eq . then BIN_LOG_REP_ninq= .;
else do;
if LOG_REP_ninq < 0 then BIN_LOG_REP_ninq=1;
else if LOG_REP_ninq < 0.69 then BIN_LOG_REP_ninq=2;
else if LOG_REP_ninq < 1.1 then BIN_LOG_REP_ninq=3;
else if LOG_REP_ninq >= 1.1 then BIN_LOG_REP_ninq=4;
end;
if LOG_REP_value eq . then BIN_LOG_REP_value= .;
else do;
if LOG_REP_value < 11.1 then BIN_LOG_REP_value=1;
else if LOG_REP_value < 11.4 then BIN_LOG_REP_value=2;
else if LOG_REP_value < 11.71 then BIN_LOG_REP_value=3;
else if LOG_REP_value >= 11.71 then BIN_LOG_REP_value=4;
end;
if LOG_REP_yoj eq . then BIN_LOG_REP_yoj= .;
else do;
if LOG_REP_yoj < 1.39 then BIN_LOG_REP_yoj=1;
else if LOG_REP_yoj < 2.08 then BIN_LOG_REP_yoj=2;
else if LOG_REP_yoj < 2.64 then BIN_LOG_REP_yoj=3;
else if LOG_REP_yoj >= 2.64 then BIN_LOG_REP_yoj=4;
end;
drop
LOG_REP_clage
LOG_REP_clno
LOG_REP_debtinc
LOG_REP_delinq
LOG_REP_derog
LOG_REP_loan
LOG_REP_mortdue
LOG_REP_ninq
LOG_REP_value
LOG_REP_yoj
;
drop
LOG_REP_clage
LOG_REP_clno
LOG_REP_debtinc
LOG_REP_delinq
LOG_REP_derog
LOG_REP_loan
LOG_REP_mortdue
LOG_REP_ninq
LOG_REP_value
LOG_REP_yoj
;
