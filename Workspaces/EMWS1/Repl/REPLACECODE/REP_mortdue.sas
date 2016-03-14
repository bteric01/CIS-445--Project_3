* ;
*Variable: mortdue;
* ;
Label REP_mortdue= 'Replacement: Amount due on existing mortgage';
REP_mortdue= mortdue;
if mortdue eq . then REP_mortdue = .;
else
if mortdue<-57459.22434 then REP_mortdue=-57459.22434;
else
if mortdue>204609.02976 then REP_mortdue=204609.02976;
