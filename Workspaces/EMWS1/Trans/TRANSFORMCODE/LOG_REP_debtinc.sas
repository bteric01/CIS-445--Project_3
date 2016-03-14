label LOG_REP_debtinc = 'Transformed: Replacement: Debt to income ratio';
if REP_debtinc eq . then LOG_REP_debtinc = .;
else do;
if REP_debtinc + 1 > 0 then LOG_REP_debtinc = log(REP_debtinc + 1);
else LOG_REP_debtinc = .;
end;
