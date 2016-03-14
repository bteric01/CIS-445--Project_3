 
*------------------------------------------------------------*;
* Variable: LOG_REP_debtinc;
*------------------------------------------------------------*;
LABEL GRP_LOG_REP_debtinc =
'Grouped: Transformed: Replacement: Debt to income ratio';
 
if MISSING(LOG_REP_debtinc) then do;
GRP_LOG_REP_debtinc = 1;
end;
else if NOT MISSING(LOG_REP_debtinc) then do;
if LOG_REP_debtinc < 3.4 then do;
GRP_LOG_REP_debtinc = 2;
end;
else
if 3.4 <= LOG_REP_debtinc AND LOG_REP_debtinc < 3.58 then do;
GRP_LOG_REP_debtinc = 3;
end;
else
if 3.58 <= LOG_REP_debtinc AND LOG_REP_debtinc < 3.69 then do;
GRP_LOG_REP_debtinc = 4;
end;
else
if 3.69 <= LOG_REP_debtinc then do;
GRP_LOG_REP_debtinc = 5;
end;
end;
