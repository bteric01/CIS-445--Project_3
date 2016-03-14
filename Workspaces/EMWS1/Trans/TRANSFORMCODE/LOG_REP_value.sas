label LOG_REP_value = 'Transformed: Replacement: Value of current property';
if REP_value eq . then LOG_REP_value = .;
else do;
if REP_value + 1 > 0 then LOG_REP_value = log(REP_value + 1);
else LOG_REP_value = .;
end;
