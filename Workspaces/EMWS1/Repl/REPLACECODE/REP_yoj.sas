* ;
*Variable: yoj;
* ;
Label REP_yoj= 'Replacement: Years on current job';
REP_yoj= yoj;
if yoj eq . then REP_yoj = .;
else
if yoj<-14.03376741 then REP_yoj=-14.03376741;
else
if yoj>31.770484152 then REP_yoj=31.770484152;
