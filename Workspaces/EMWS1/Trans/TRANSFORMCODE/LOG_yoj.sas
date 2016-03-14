label LOG_yoj = 'Transformed: Years on current job';
if yoj eq . then LOG_yoj = .;
else do;
if yoj + 1 > 0 then LOG_yoj = log(yoj + 1);
else LOG_yoj = .;
end;
