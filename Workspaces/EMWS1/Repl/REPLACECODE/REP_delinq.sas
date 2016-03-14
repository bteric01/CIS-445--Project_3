* ;
*Variable: delinq;
* ;
Label REP_delinq= 'Replacement: Number of delinquent trade lines';
REP_delinq= delinq;
if delinq eq . then REP_delinq = .;
else
if delinq<-3.153597798 then REP_delinq=-3.153597798;
else
if delinq>4.0780488585 then REP_delinq=4.0780488585;
