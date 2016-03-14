 
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
