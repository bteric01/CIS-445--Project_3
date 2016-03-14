label LOG_REP_ninq = 'Transformed: Replacement: Number of recent credit inquiries';
if REP_ninq eq . then LOG_REP_ninq = .;
else do;
if REP_ninq + 1 > 0 then LOG_REP_ninq = log(REP_ninq + 1);
else LOG_REP_ninq = .;
end;
