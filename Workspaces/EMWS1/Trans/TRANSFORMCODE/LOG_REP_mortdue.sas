label LOG_REP_mortdue = 'Transformed: Replacement: Amount due on existing mortgage';
if REP_mortdue eq . then LOG_REP_mortdue = .;
else do;
if REP_mortdue + 1 > 0 then LOG_REP_mortdue = log(REP_mortdue + 1);
else LOG_REP_mortdue = .;
end;
