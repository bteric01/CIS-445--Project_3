*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;
*------------------------------------------------------------*;
* TRANSFORM: REP_clage , log(REP_clage + 1);
*------------------------------------------------------------*;
label LOG_REP_clage = 'Transformed: Replacement: Age of oldest trade line in months';
if REP_clage eq . then LOG_REP_clage = .;
else do;
if REP_clage + 1 > 0 then LOG_REP_clage = log(REP_clage + 1);
else LOG_REP_clage = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_clno , log(REP_clno + 1);
*------------------------------------------------------------*;
label LOG_REP_clno = 'Transformed: Replacement: Number of trade (credit) lines';
if REP_clno eq . then LOG_REP_clno = .;
else do;
if REP_clno + 1 > 0 then LOG_REP_clno = log(REP_clno + 1);
else LOG_REP_clno = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_debtinc , log(REP_debtinc + 1);
*------------------------------------------------------------*;
label LOG_REP_debtinc = 'Transformed: Replacement: Debt to income ratio';
if REP_debtinc eq . then LOG_REP_debtinc = .;
else do;
if REP_debtinc + 1 > 0 then LOG_REP_debtinc = log(REP_debtinc + 1);
else LOG_REP_debtinc = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_delinq , log(REP_delinq + 1);
*------------------------------------------------------------*;
label LOG_REP_delinq = 'Transformed: Replacement: Number of delinquent trade lines';
if REP_delinq eq . then LOG_REP_delinq = .;
else do;
if REP_delinq + 1 > 0 then LOG_REP_delinq = log(REP_delinq + 1);
else LOG_REP_delinq = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_derog , log(REP_derog + 1);
*------------------------------------------------------------*;
label LOG_REP_derog = 'Transformed: Replacement: Number of major derogatory reports';
if REP_derog eq . then LOG_REP_derog = .;
else do;
if REP_derog + 1 > 0 then LOG_REP_derog = log(REP_derog + 1);
else LOG_REP_derog = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_loan , log(REP_loan + 1);
*------------------------------------------------------------*;
label LOG_REP_loan = 'Transformed: Replacement: Amount of current loan request';
if REP_loan eq . then LOG_REP_loan = .;
else do;
if REP_loan + 1 > 0 then LOG_REP_loan = log(REP_loan + 1);
else LOG_REP_loan = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_mortdue , log(REP_mortdue + 1);
*------------------------------------------------------------*;
label LOG_REP_mortdue = 'Transformed: Replacement: Amount due on existing mortgage';
if REP_mortdue eq . then LOG_REP_mortdue = .;
else do;
if REP_mortdue + 1 > 0 then LOG_REP_mortdue = log(REP_mortdue + 1);
else LOG_REP_mortdue = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_ninq , log(REP_ninq + 1);
*------------------------------------------------------------*;
label LOG_REP_ninq = 'Transformed: Replacement: Number of recent credit inquiries';
if REP_ninq eq . then LOG_REP_ninq = .;
else do;
if REP_ninq + 1 > 0 then LOG_REP_ninq = log(REP_ninq + 1);
else LOG_REP_ninq = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_value , log(REP_value + 1);
*------------------------------------------------------------*;
label LOG_REP_value = 'Transformed: Replacement: Value of current property';
if REP_value eq . then LOG_REP_value = .;
else do;
if REP_value + 1 > 0 then LOG_REP_value = log(REP_value + 1);
else LOG_REP_value = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: REP_yoj , log(REP_yoj + 1);
*------------------------------------------------------------*;
label LOG_REP_yoj = 'Transformed: Replacement: Years on current job';
if REP_yoj eq . then LOG_REP_yoj = .;
else do;
if REP_yoj + 1 > 0 then LOG_REP_yoj = log(REP_yoj + 1);
else LOG_REP_yoj = .;
end;
*------------------------------------------------------------*;
* TRANSFORM: yoj , log(yoj + 1);
*------------------------------------------------------------*;
label LOG_yoj = 'Transformed: Years on current job';
if yoj eq . then LOG_yoj = .;
else do;
if yoj + 1 > 0 then LOG_yoj = log(yoj + 1);
else LOG_yoj = .;
end;
