* ;
*Variable: clno;
* ;
Label REP_clno= 'Replacement: Number of trade (credit) lines';
REP_clno= clno;
if clno eq . then REP_clno = .;
else
if clno<-9.572373879 then REP_clno=-9.572373879;
else
if clno>52.12653181 then REP_clno=52.12653181;
