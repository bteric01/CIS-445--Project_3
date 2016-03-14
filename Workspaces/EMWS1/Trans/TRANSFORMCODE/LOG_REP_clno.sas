label LOG_REP_clno = 'Transformed: Replacement: Number of trade (credit) lines';
if REP_clno eq . then LOG_REP_clno = .;
else do;
if REP_clno + 1 > 0 then LOG_REP_clno = log(REP_clno + 1);
else LOG_REP_clno = .;
end;
