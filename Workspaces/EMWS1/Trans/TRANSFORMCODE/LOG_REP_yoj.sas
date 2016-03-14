label LOG_REP_yoj = 'Transformed: Replacement: Years on current job';
if REP_yoj eq . then LOG_REP_yoj = .;
else do;
if REP_yoj + 1 > 0 then LOG_REP_yoj = log(REP_yoj + 1);
else LOG_REP_yoj = .;
end;
