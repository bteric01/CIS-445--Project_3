label LOG_REP_derog = 'Transformed: Replacement: Number of major derogatory reports';
if REP_derog eq . then LOG_REP_derog = .;
else do;
if REP_derog + 1 > 0 then LOG_REP_derog = log(REP_derog + 1);
else LOG_REP_derog = .;
end;
