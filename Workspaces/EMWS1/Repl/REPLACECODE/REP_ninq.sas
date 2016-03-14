* ;
*Variable: ninq;
* ;
Label REP_ninq= 'Replacement: Number of recent credit inquiries';
REP_ninq= ninq;
if ninq eq . then REP_ninq = .;
else
if ninq<-3.960526971 then REP_ninq=-3.960526971;
else
if ninq>6.2744975591 then REP_ninq=6.2744975591;
