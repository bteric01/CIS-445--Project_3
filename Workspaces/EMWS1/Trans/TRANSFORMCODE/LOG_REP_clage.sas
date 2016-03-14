label LOG_REP_clage = 'Transformed: Replacement: Age of oldest trade line in months';
if REP_clage eq . then LOG_REP_clage = .;
else do;
if REP_clage + 1 > 0 then LOG_REP_clage = log(REP_clage + 1);
else LOG_REP_clage = .;
end;
