label LOG_REP_delinq = 'Transformed: Replacement: Number of delinquent trade lines';
if REP_delinq eq . then LOG_REP_delinq = .;
else do;
if REP_delinq + 1 > 0 then LOG_REP_delinq = log(REP_delinq + 1);
else LOG_REP_delinq = .;
end;
