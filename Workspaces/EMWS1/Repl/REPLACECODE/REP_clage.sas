* ;
*Variable: clage;
* ;
Label REP_clage= 'Replacement: Age of oldest trade line in months';
REP_clage= clage;
if clage eq . then REP_clage = .;
else
if clage<-80.78147892 then REP_clage=-80.78147892;
else
if clage>443.08767751 then REP_clage=443.08767751;
