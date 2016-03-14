 
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
