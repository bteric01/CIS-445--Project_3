*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;

if NAME="LOG_REP_clage" then do;
   COMMENT = "log(REP_clage  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_clage" then delete;

if NAME="LOG_REP_clno" then do;
   COMMENT = "log(REP_clno  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_clno" then delete;

if NAME="LOG_REP_debtinc" then do;
   COMMENT = "log(REP_debtinc  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_debtinc" then delete;

if NAME="LOG_REP_delinq" then do;
   COMMENT = "log(REP_delinq  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_delinq" then delete;

if NAME="LOG_REP_derog" then do;
   COMMENT = "log(REP_derog  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_derog" then delete;

if NAME="LOG_REP_loan" then do;
   COMMENT = "log(REP_loan  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_loan" then delete;

if NAME="LOG_REP_mortdue" then do;
   COMMENT = "log(REP_mortdue  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_mortdue" then delete;

if NAME="LOG_REP_ninq" then do;
   COMMENT = "log(REP_ninq  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_ninq" then delete;

if NAME="LOG_REP_value" then do;
   COMMENT = "log(REP_value  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_value" then delete;

if NAME="LOG_REP_yoj" then do;
   COMMENT = "log(REP_yoj  + 1) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="REP_yoj" then delete;

if NAME="LOG_yoj" then do;
   COMMENT = "log(yoj  + 1) ";
ROLE ="REJECTED";
REPORT ="N";
LEVEL  ="INTERVAL";
end;
if NAME="yoj" then delete;
