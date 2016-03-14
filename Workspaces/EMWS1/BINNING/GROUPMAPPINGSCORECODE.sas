 length _LABEL_ $200;
 label _LABEL_="%sysfunc(sasmsg(sashelp.dmine, rpt_groupvalues_vlabel , NOQUOTE))";
 
if DISPLAY_VAR='LOG_REP_clage' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_clage< 4.76';
UB=4.76;
end;
else
if DISPLAY_VAR='LOG_REP_clage' and _GROUP_ = 3 then do;
_LABEL_='4.76<= LOG_REP_clage< 5.17';
UB=5.17;
end;
else
if DISPLAY_VAR='LOG_REP_clage' and _GROUP_ = 4 then do;
_LABEL_='5.17<= LOG_REP_clage< 5.45';
UB=5.45;
end;
else
if DISPLAY_VAR='LOG_REP_clage' and _GROUP_ = 5 then do;
_LABEL_='5.45<= LOG_REP_clage';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_clno' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_clno< 2.71';
UB=2.71;
end;
else
if DISPLAY_VAR='LOG_REP_clno' and _GROUP_ = 3 then do;
_LABEL_='2.71<= LOG_REP_clno< 3.04';
UB=3.04;
end;
else
if DISPLAY_VAR='LOG_REP_clno' and _GROUP_ = 4 then do;
_LABEL_='3.04<= LOG_REP_clno< 3.3';
UB=3.3;
end;
else
if DISPLAY_VAR='LOG_REP_clno' and _GROUP_ = 5 then do;
_LABEL_='3.3<= LOG_REP_clno';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_debtinc' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_debtinc< 3.4';
UB=3.4;
end;
else
if DISPLAY_VAR='LOG_REP_debtinc' and _GROUP_ = 3 then do;
_LABEL_='3.4<= LOG_REP_debtinc< 3.58';
UB=3.58;
end;
else
if DISPLAY_VAR='LOG_REP_debtinc' and _GROUP_ = 4 then do;
_LABEL_='3.58<= LOG_REP_debtinc< 3.69';
UB=3.69;
end;
else
if DISPLAY_VAR='LOG_REP_debtinc' and _GROUP_ = 5 then do;
_LABEL_='3.69<= LOG_REP_debtinc';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_delinq' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_delinq< 0';
UB=0;
end;
else
if DISPLAY_VAR='LOG_REP_delinq' and _GROUP_ = 3 then do;
_LABEL_='0<= LOG_REP_delinq';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_derog' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_derog< 0';
UB=0;
end;
else
if DISPLAY_VAR='LOG_REP_derog' and _GROUP_ = 3 then do;
_LABEL_='0<= LOG_REP_derog';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_loan' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_loan< 9.31';
UB=9.31;
end;
else
if DISPLAY_VAR='LOG_REP_loan' and _GROUP_ = 3 then do;
_LABEL_='9.31<= LOG_REP_loan< 9.69';
UB=9.69;
end;
else
if DISPLAY_VAR='LOG_REP_loan' and _GROUP_ = 4 then do;
_LABEL_='9.69<= LOG_REP_loan< 10.05';
UB=10.05;
end;
else
if DISPLAY_VAR='LOG_REP_loan' and _GROUP_ = 5 then do;
_LABEL_='10.05<= LOG_REP_loan';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_mortdue' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_mortdue< 10.75';
UB=10.75;
end;
else
if DISPLAY_VAR='LOG_REP_mortdue' and _GROUP_ = 3 then do;
_LABEL_='10.75<= LOG_REP_mortdue< 11.08';
UB=11.08;
end;
else
if DISPLAY_VAR='LOG_REP_mortdue' and _GROUP_ = 4 then do;
_LABEL_='11.08<= LOG_REP_mortdue< 11.45';
UB=11.45;
end;
else
if DISPLAY_VAR='LOG_REP_mortdue' and _GROUP_ = 5 then do;
_LABEL_='11.45<= LOG_REP_mortdue';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_ninq' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_ninq< 0';
UB=0;
end;
else
if DISPLAY_VAR='LOG_REP_ninq' and _GROUP_ = 3 then do;
_LABEL_='0<= LOG_REP_ninq< 0.69';
UB=0.69;
end;
else
if DISPLAY_VAR='LOG_REP_ninq' and _GROUP_ = 4 then do;
_LABEL_='0.69<= LOG_REP_ninq< 1.1';
UB=1.1;
end;
else
if DISPLAY_VAR='LOG_REP_ninq' and _GROUP_ = 5 then do;
_LABEL_='1.1<= LOG_REP_ninq';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_value' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_value< 11.1';
UB=11.1;
end;
else
if DISPLAY_VAR='LOG_REP_value' and _GROUP_ = 3 then do;
_LABEL_='11.1<= LOG_REP_value< 11.4';
UB=11.4;
end;
else
if DISPLAY_VAR='LOG_REP_value' and _GROUP_ = 4 then do;
_LABEL_='11.4<= LOG_REP_value< 11.71';
UB=11.71;
end;
else
if DISPLAY_VAR='LOG_REP_value' and _GROUP_ = 5 then do;
_LABEL_='11.71<= LOG_REP_value';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_yoj' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_yoj< 1.39';
UB=1.39;
end;
else
if DISPLAY_VAR='LOG_REP_yoj' and _GROUP_ = 3 then do;
_LABEL_='1.39<= LOG_REP_yoj< 2.08';
UB=2.08;
end;
else
if DISPLAY_VAR='LOG_REP_yoj' and _GROUP_ = 4 then do;
_LABEL_='2.08<= LOG_REP_yoj< 2.64';
UB=2.64;
end;
else
if DISPLAY_VAR='LOG_REP_yoj' and _GROUP_ = 5 then do;
_LABEL_='2.64<= LOG_REP_yoj';
UB=.;
end;
 
if DISPLAY_VAR='job' and _GROUP_ = 2 then
_LABEL_='OTHER';
else
if DISPLAY_VAR='job' and _GROUP_ = 3 then
_LABEL_='PROFEX';
else
if DISPLAY_VAR='job' and _GROUP_ = 4 then
_LABEL_='OFFICE';
else
if DISPLAY_VAR='job' and _GROUP_ = 5 then
_LABEL_='MGR';
else
if DISPLAY_VAR='job' and _GROUP_ = 6 then
_LABEL_='SELF';
else
if DISPLAY_VAR='job' and _GROUP_ = 7 then
_LABEL_='SALES';
 
if DISPLAY_VAR='reason' and _GROUP_ = 2 then
_LABEL_='DEBTCON';
else
if DISPLAY_VAR='reason' and _GROUP_ = 3 then
_LABEL_='HOMEIMP';
 
if DISPLAY_VAR='LOG_REP_clage' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_clage< 4.76';
UB=4.76;
end;
else
if DISPLAY_VAR='LOG_REP_clage' and _GROUP_ = 3 then do;
_LABEL_='4.76<= LOG_REP_clage< 5.17';
UB=5.17;
end;
else
if DISPLAY_VAR='LOG_REP_clage' and _GROUP_ = 4 then do;
_LABEL_='5.17<= LOG_REP_clage< 5.45';
UB=5.45;
end;
else
if DISPLAY_VAR='LOG_REP_clage' and _GROUP_ = 5 then do;
_LABEL_='5.45<= LOG_REP_clage';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_clno' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_clno< 2.71';
UB=2.71;
end;
else
if DISPLAY_VAR='LOG_REP_clno' and _GROUP_ = 3 then do;
_LABEL_='2.71<= LOG_REP_clno< 3.04';
UB=3.04;
end;
else
if DISPLAY_VAR='LOG_REP_clno' and _GROUP_ = 4 then do;
_LABEL_='3.04<= LOG_REP_clno< 3.3';
UB=3.3;
end;
else
if DISPLAY_VAR='LOG_REP_clno' and _GROUP_ = 5 then do;
_LABEL_='3.3<= LOG_REP_clno';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_debtinc' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_debtinc< 3.4';
UB=3.4;
end;
else
if DISPLAY_VAR='LOG_REP_debtinc' and _GROUP_ = 3 then do;
_LABEL_='3.4<= LOG_REP_debtinc< 3.58';
UB=3.58;
end;
else
if DISPLAY_VAR='LOG_REP_debtinc' and _GROUP_ = 4 then do;
_LABEL_='3.58<= LOG_REP_debtinc< 3.69';
UB=3.69;
end;
else
if DISPLAY_VAR='LOG_REP_debtinc' and _GROUP_ = 5 then do;
_LABEL_='3.69<= LOG_REP_debtinc';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_delinq' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_delinq< 0';
UB=0;
end;
else
if DISPLAY_VAR='LOG_REP_delinq' and _GROUP_ = 3 then do;
_LABEL_='0<= LOG_REP_delinq';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_derog' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_derog< 0';
UB=0;
end;
else
if DISPLAY_VAR='LOG_REP_derog' and _GROUP_ = 3 then do;
_LABEL_='0<= LOG_REP_derog';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_loan' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_loan< 9.31';
UB=9.31;
end;
else
if DISPLAY_VAR='LOG_REP_loan' and _GROUP_ = 3 then do;
_LABEL_='9.31<= LOG_REP_loan< 9.69';
UB=9.69;
end;
else
if DISPLAY_VAR='LOG_REP_loan' and _GROUP_ = 4 then do;
_LABEL_='9.69<= LOG_REP_loan< 10.05';
UB=10.05;
end;
else
if DISPLAY_VAR='LOG_REP_loan' and _GROUP_ = 5 then do;
_LABEL_='10.05<= LOG_REP_loan';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_mortdue' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_mortdue< 10.75';
UB=10.75;
end;
else
if DISPLAY_VAR='LOG_REP_mortdue' and _GROUP_ = 3 then do;
_LABEL_='10.75<= LOG_REP_mortdue< 11.08';
UB=11.08;
end;
else
if DISPLAY_VAR='LOG_REP_mortdue' and _GROUP_ = 4 then do;
_LABEL_='11.08<= LOG_REP_mortdue< 11.45';
UB=11.45;
end;
else
if DISPLAY_VAR='LOG_REP_mortdue' and _GROUP_ = 5 then do;
_LABEL_='11.45<= LOG_REP_mortdue';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_ninq' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_ninq< 0';
UB=0;
end;
else
if DISPLAY_VAR='LOG_REP_ninq' and _GROUP_ = 3 then do;
_LABEL_='0<= LOG_REP_ninq< 0.69';
UB=0.69;
end;
else
if DISPLAY_VAR='LOG_REP_ninq' and _GROUP_ = 4 then do;
_LABEL_='0.69<= LOG_REP_ninq< 1.1';
UB=1.1;
end;
else
if DISPLAY_VAR='LOG_REP_ninq' and _GROUP_ = 5 then do;
_LABEL_='1.1<= LOG_REP_ninq';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_value' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_value< 11.1';
UB=11.1;
end;
else
if DISPLAY_VAR='LOG_REP_value' and _GROUP_ = 3 then do;
_LABEL_='11.1<= LOG_REP_value< 11.4';
UB=11.4;
end;
else
if DISPLAY_VAR='LOG_REP_value' and _GROUP_ = 4 then do;
_LABEL_='11.4<= LOG_REP_value< 11.71';
UB=11.71;
end;
else
if DISPLAY_VAR='LOG_REP_value' and _GROUP_ = 5 then do;
_LABEL_='11.71<= LOG_REP_value';
UB=.;
end;
 
if DISPLAY_VAR='LOG_REP_yoj' and _GROUP_ = 2 then do;
_LABEL_='LOG_REP_yoj< 1.39';
UB=1.39;
end;
else
if DISPLAY_VAR='LOG_REP_yoj' and _GROUP_ = 3 then do;
_LABEL_='1.39<= LOG_REP_yoj< 2.08';
UB=2.08;
end;
else
if DISPLAY_VAR='LOG_REP_yoj' and _GROUP_ = 4 then do;
_LABEL_='2.08<= LOG_REP_yoj< 2.64';
UB=2.64;
end;
else
if DISPLAY_VAR='LOG_REP_yoj' and _GROUP_ = 5 then do;
_LABEL_='2.64<= LOG_REP_yoj';
UB=.;
end;
 
if DISPLAY_VAR='job' and _GROUP_ = 2 then
_LABEL_='OTHER';
else
if DISPLAY_VAR='job' and _GROUP_ = 3 then
_LABEL_='PROFEX';
else
if DISPLAY_VAR='job' and _GROUP_ = 4 then
_LABEL_='OFFICE';
else
if DISPLAY_VAR='job' and _GROUP_ = 5 then
_LABEL_='MGR';
else
if DISPLAY_VAR='job' and _GROUP_ = 6 then
_LABEL_='SELF';
else
if DISPLAY_VAR='job' and _GROUP_ = 7 then
_LABEL_='SALES';
 
if DISPLAY_VAR='reason' and _GROUP_ = 2 then
_LABEL_='DEBTCON';
else
if DISPLAY_VAR='reason' and _GROUP_ = 3 then
_LABEL_='HOMEIMP';
