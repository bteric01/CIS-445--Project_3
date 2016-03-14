length _UFormat $200;
drop _UFormat;
_UFormat='';
 
*------------------------------------------------------------*;
* Variable: LOG_REP_clage;
*------------------------------------------------------------*;
LABEL GRP_LOG_REP_clage =
'Grouped: Transformed: Replacement: Age of oldest trade line in months';
 
if MISSING(LOG_REP_clage) then do;
GRP_LOG_REP_clage = 1;
end;
else if NOT MISSING(LOG_REP_clage) then do;
if LOG_REP_clage < 4.76 then do;
GRP_LOG_REP_clage = 2;
end;
else
if 4.76 <= LOG_REP_clage AND LOG_REP_clage < 5.17 then do;
GRP_LOG_REP_clage = 3;
end;
else
if 5.17 <= LOG_REP_clage AND LOG_REP_clage < 5.45 then do;
GRP_LOG_REP_clage = 4;
end;
else
if 5.45 <= LOG_REP_clage then do;
GRP_LOG_REP_clage = 5;
end;
end;
 
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
 
*------------------------------------------------------------*;
* Variable: LOG_REP_ninq;
*------------------------------------------------------------*;
LABEL GRP_LOG_REP_ninq =
'Grouped: Transformed: Replacement: Number of recent credit inquiries';
 
if MISSING(LOG_REP_ninq) then do;
GRP_LOG_REP_ninq = 1;
end;
else if NOT MISSING(LOG_REP_ninq) then do;
if LOG_REP_ninq < 0 then do;
GRP_LOG_REP_ninq = 2;
end;
else
if 0 <= LOG_REP_ninq AND LOG_REP_ninq < 0.69 then do;
GRP_LOG_REP_ninq = 3;
end;
else
if 0.69 <= LOG_REP_ninq AND LOG_REP_ninq < 1.1 then do;
GRP_LOG_REP_ninq = 4;
end;
else
if 1.1 <= LOG_REP_ninq then do;
GRP_LOG_REP_ninq = 5;
end;
end;
 
*------------------------------------------------------------*;
* Variable: LOG_REP_value;
*------------------------------------------------------------*;
LABEL GRP_LOG_REP_value =
'Grouped: Transformed: Replacement: Value of current property';
 
if MISSING(LOG_REP_value) then do;
GRP_LOG_REP_value = 1;
end;
else if NOT MISSING(LOG_REP_value) then do;
if LOG_REP_value < 11.1 then do;
GRP_LOG_REP_value = 2;
end;
else
if 11.1 <= LOG_REP_value AND LOG_REP_value < 11.4 then do;
GRP_LOG_REP_value = 3;
end;
else
if 11.4 <= LOG_REP_value AND LOG_REP_value < 11.71 then do;
GRP_LOG_REP_value = 4;
end;
else
if 11.71 <= LOG_REP_value then do;
GRP_LOG_REP_value = 5;
end;
end;
