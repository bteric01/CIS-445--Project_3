 
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
