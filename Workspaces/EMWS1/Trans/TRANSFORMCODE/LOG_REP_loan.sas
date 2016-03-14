label LOG_REP_loan = 'Transformed: Replacement: Amount of current loan request';
if REP_loan eq . then LOG_REP_loan = .;
else do;
if REP_loan + 1 > 0 then LOG_REP_loan = log(REP_loan + 1);
else LOG_REP_loan = .;
end;
