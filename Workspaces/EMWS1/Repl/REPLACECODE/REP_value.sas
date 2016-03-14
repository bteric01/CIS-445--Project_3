* ;
*Variable: value;
* ;
Label REP_value= 'Replacement: Value of current property';
REP_value= value;
if value eq . then REP_value = .;
else
if value<-71444.80758 then REP_value=-71444.80758;
else
if value>276406.0448 then REP_value=276406.0448;
