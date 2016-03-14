* ;
* Variable: clage ;
* ;
Label REP_clage='Replacement: Age of oldest trade line in months';
REP_clage =clage ;
if clage  eq . then REP_clage = . ;
else
if clage <-80.78147892  then REP_clage  = -80.78147892 ;
else
if clage >443.08767751  then REP_clage  = 443.08767751 ;
* ;
* Variable: clno ;
* ;
Label REP_clno='Replacement: Number of trade (credit) lines';
REP_clno =clno ;
if clno  eq . then REP_clno = . ;
else
if clno <-9.572373879  then REP_clno  = -9.572373879 ;
else
if clno >52.12653181  then REP_clno  = 52.12653181 ;
* ;
* Variable: debtinc ;
* ;
Label REP_debtinc='Replacement: Debt to income ratio';
REP_debtinc =debtinc ;
if debtinc  eq . then REP_debtinc = . ;
else
if debtinc <6.7670205261  then REP_debtinc  = 6.7670205261 ;
else
if debtinc >60.806885565  then REP_debtinc  = 60.806885565 ;
* ;
* Variable: delinq ;
* ;
Label REP_delinq='Replacement: Number of delinquent trade lines';
REP_delinq =delinq ;
if delinq  eq . then REP_delinq = . ;
else
if delinq <-3.153597798  then REP_delinq  = -3.153597798 ;
else
if delinq >4.0780488585  then REP_delinq  = 4.0780488585 ;
* ;
* Variable: derog ;
* ;
Label REP_derog='Replacement: Number of major derogatory reports';
REP_derog =derog ;
if derog  eq . then REP_derog = . ;
else
if derog <-2.197175111  then REP_derog  = -2.197175111 ;
else
if derog >2.6790936492  then REP_derog  = 2.6790936492 ;
* ;
* Variable: loan ;
* ;
Label REP_loan='Replacement: Amount of current loan request';
REP_loan =loan ;
if loan  eq . then REP_loan = . ;
else
if loan <-15948.4177  then REP_loan  = -15948.4177 ;
else
if loan >53316.594945  then REP_loan  = 53316.594945 ;
* ;
* Variable: mortdue ;
* ;
Label REP_mortdue='Replacement: Amount due on existing mortgage';
REP_mortdue =mortdue ;
if mortdue  eq . then REP_mortdue = . ;
else
if mortdue <-57459.22434  then REP_mortdue  = -57459.22434 ;
else
if mortdue >204609.02976  then REP_mortdue  = 204609.02976 ;
* ;
* Variable: ninq ;
* ;
Label REP_ninq='Replacement: Number of recent credit inquiries';
REP_ninq =ninq ;
if ninq  eq . then REP_ninq = . ;
else
if ninq <-3.960526971  then REP_ninq  = -3.960526971 ;
else
if ninq >6.2744975591  then REP_ninq  = 6.2744975591 ;
* ;
* Variable: value ;
* ;
Label REP_value='Replacement: Value of current property';
REP_value =value ;
if value  eq . then REP_value = . ;
else
if value <-71444.80758  then REP_value  = -71444.80758 ;
else
if value >276406.0448  then REP_value  = 276406.0448 ;
* ;
* Variable: yoj ;
* ;
Label REP_yoj='Replacement: Years on current job';
REP_yoj =yoj ;
if yoj  eq . then REP_yoj = . ;
else
if yoj <-14.03376741  then REP_yoj  = -14.03376741 ;
else
if yoj >31.770484152  then REP_yoj  = 31.770484152 ;
