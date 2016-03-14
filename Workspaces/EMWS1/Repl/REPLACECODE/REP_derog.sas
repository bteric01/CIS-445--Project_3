* ;
*Variable: derog;
* ;
Label REP_derog= 'Replacement: Number of major derogatory reports';
REP_derog= derog;
if derog eq . then REP_derog = .;
else
if derog<-2.197175111 then REP_derog=-2.197175111;
else
if derog>2.6790936492 then REP_derog=2.6790936492;
