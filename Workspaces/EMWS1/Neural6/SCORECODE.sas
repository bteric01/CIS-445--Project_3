***********************************;
*** Begin Scoring Code for Neural;
***********************************;
DROP _DM_BAD _EPS _NOCL_ _MAX_ _MAXP_ _SUM_ _NTRIALS;
 _DM_BAD = 0;
 _NOCL_ = .;
 _MAX_ = .;
 _MAXP_ = .;
 _SUM_ = .;
 _NTRIALS = .;
 _EPS =                1E-10;
LENGTH _WARN_ $4 
;
      label S_REP_clage = 'Standard: REP_clage' ;

      label S_REP_clno = 'Standard: REP_clno' ;

      label S_REP_debtinc = 'Standard: REP_debtinc' ;

      label S_REP_delinq = 'Standard: REP_delinq' ;

      label S_REP_derog = 'Standard: REP_derog' ;

      label S_REP_loan = 'Standard: REP_loan' ;

      label S_REP_mortdue = 'Standard: REP_mortdue' ;

      label S_REP_ninq = 'Standard: REP_ninq' ;

      label S_REP_value = 'Standard: REP_value' ;

      label S_REP_yoj = 'Standard: REP_yoj' ;

      label jobMgr = 'Dummy: job=Mgr' ;

      label jobOffice = 'Dummy: job=Office' ;

      label jobOther = 'Dummy: job=Other' ;

      label jobProfEx = 'Dummy: job=ProfEx' ;

      label jobSales = 'Dummy: job=Sales' ;

      label reasonDebtCon = 'Dummy: reason=DebtCon' ;

      label H11 = 'Hidden: H1=1' ;

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

      label I_bad = 'Into: bad' ;

      label U_bad = 'Unnormalized Into: bad' ;

      label P_bad1 = 'Predicted: bad=1' ;

      label P_bad0 = 'Predicted: bad=0' ;

      label  _WARN_ = "Warnings"; 

*** Generate dummy variables for job ;
drop jobMgr jobOffice jobOther jobProfEx jobSales ;
*** encoding is sparse, initialize to zero;
jobMgr = 0;
jobOffice = 0;
jobOther = 0;
jobProfEx = 0;
jobSales = 0;
if missing( job ) then do;
   jobMgr = .;
   jobOffice = .;
   jobOther = .;
   jobProfEx = .;
   jobSales = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm6 $ 6; drop _dm6 ;
   %DMNORMCP( job , _dm6 )
   _dm_find = 0; drop _dm_find;
   if _dm6 <= 'OTHER'  then do;
      if _dm6 <= 'OFFICE'  then do;
         if _dm6 = 'MGR'  then do;
            jobMgr = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm6 = 'OFFICE'  then do;
               jobOffice = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm6 = 'OTHER'  then do;
            jobOther = 1;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm6 <= 'SALES'  then do;
         if _dm6 = 'PROFEX'  then do;
            jobProfEx = 1;
            _dm_find = 1;
         end;
         else do;
            if _dm6 = 'SALES'  then do;
               jobSales = 1;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm6 = 'SELF'  then do;
            jobMgr = -1;
            jobOffice = -1;
            jobOther = -1;
            jobProfEx = -1;
            jobSales = -1;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      jobMgr = .;
      jobOffice = .;
      jobOther = .;
      jobProfEx = .;
      jobSales = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for reason ;
drop reasonDebtCon ;
if missing( reason ) then do;
   reasonDebtCon = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm7 $ 7; drop _dm7 ;
   %DMNORMCP( reason , _dm7 )
   if _dm7 = 'DEBTCON'  then do;
      reasonDebtCon = 1;
   end;
   else if _dm7 = 'HOMEIMP'  then do;
      reasonDebtCon = -1;
   end;
   else do;
      reasonDebtCon = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** *************************;
*** Checking missing input Interval
*** *************************;

IF NMISS(
   REP_clage , 
   REP_clno , 
   REP_debtinc , 
   REP_delinq , 
   REP_derog , 
   REP_loan , 
   REP_mortdue , 
   REP_ninq , 
   REP_value , 
   REP_yoj   ) THEN DO;
   SUBSTR(_WARN_, 1, 1) = 'M';

   _DM_BAD = 1;
END;
*** *************************;
*** Writing the Node intvl ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   S_REP_clage  =    -2.22677700256924 +     0.01237131443959 * REP_clage ;
   S_REP_clno  =    -2.09120083900206 +     0.09845331494994 * REP_clno ;
   S_REP_debtinc  =    -4.49488150643288 +      0.1336303906768 * REP_debtinc
         ;
   S_REP_delinq  =    -0.43760021579916 +     1.05734701625827 * REP_delinq ;
   S_REP_derog  =    -0.35522020416509 +     1.75384737051562 * REP_derog ;
   S_REP_loan  =    -1.78683141618052 +     0.00009714343259 * REP_loan ;
   S_REP_mortdue  =    -1.78622038098681 +     0.00002451193439 * REP_mortdue
         ;
   S_REP_ninq  =    -0.74860118195179 +     0.67778389006928 * REP_ninq ;
   S_REP_value  =    -1.98311022661579 +     0.00001954597062 * REP_value ;
   S_REP_yoj  =    -1.16891375661418 +     0.13208548345713 * REP_yoj ;
END;
ELSE DO;
   IF MISSING( REP_clage ) THEN S_REP_clage  = . ;
   ELSE S_REP_clage  =    -2.22677700256924 +     0.01237131443959 * REP_clage
         ;
   IF MISSING( REP_clno ) THEN S_REP_clno  = . ;
   ELSE S_REP_clno  =    -2.09120083900206 +     0.09845331494994 * REP_clno ;
   IF MISSING( REP_debtinc ) THEN S_REP_debtinc  = . ;
   ELSE S_REP_debtinc  =    -4.49488150643288 +      0.1336303906768 * 
        REP_debtinc ;
   IF MISSING( REP_delinq ) THEN S_REP_delinq  = . ;
   ELSE S_REP_delinq  =    -0.43760021579916 +     1.05734701625827 * 
        REP_delinq ;
   IF MISSING( REP_derog ) THEN S_REP_derog  = . ;
   ELSE S_REP_derog  =    -0.35522020416509 +     1.75384737051562 * REP_derog
         ;
   IF MISSING( REP_loan ) THEN S_REP_loan  = . ;
   ELSE S_REP_loan  =    -1.78683141618052 +     0.00009714343259 * REP_loan ;
   IF MISSING( REP_mortdue ) THEN S_REP_mortdue  = . ;
   ELSE S_REP_mortdue  =    -1.78622038098681 +     0.00002451193439 * 
        REP_mortdue ;
   IF MISSING( REP_ninq ) THEN S_REP_ninq  = . ;
   ELSE S_REP_ninq  =    -0.74860118195179 +     0.67778389006928 * REP_ninq ;
   IF MISSING( REP_value ) THEN S_REP_value  = . ;
   ELSE S_REP_value  =    -1.98311022661579 +     0.00001954597062 * REP_value
         ;
   IF MISSING( REP_yoj ) THEN S_REP_yoj  = . ;
   ELSE S_REP_yoj  =    -1.16891375661418 +     0.13208548345713 * REP_yoj ;
END;
*** *************************;
*** Writing the Node nom ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =    -0.62908691581503 * S_REP_clage  +    -0.32501825337077 * 
        S_REP_clno  +    -0.55063341593129 * S_REP_debtinc
          +     0.53610311600309 * S_REP_delinq  +     0.31760313380137 * 
        S_REP_derog  +     0.76066880320622 * S_REP_loan
          +    -0.28789263834612 * S_REP_mortdue  +     0.40621809124292 * 
        S_REP_ninq  +     0.13015938731861 * S_REP_value
          +    -0.32068519738691 * S_REP_yoj ;
   H12  =     1.00990224082991 * S_REP_clage  +     1.00507167206229 * 
        S_REP_clno  +    -1.10662026428082 * S_REP_debtinc
          +      0.6998948133866 * S_REP_delinq  +    -0.38060034861396 * 
        S_REP_derog  +     0.23802876244022 * S_REP_loan
          +     1.46223703828863 * S_REP_mortdue  +     0.16221973340289 * 
        S_REP_ninq  +     0.20580076033145 * S_REP_value
          +    -0.36336973234685 * S_REP_yoj ;
   H13  =    -0.35847141424276 * S_REP_clage  +    -0.05395567288207 * 
        S_REP_clno  +    -1.56713434921689 * S_REP_debtinc
          +     0.40008753846173 * S_REP_delinq  +    -0.33466356832386 * 
        S_REP_derog  +     1.10371225343116 * S_REP_loan
          +     0.69224357492781 * S_REP_mortdue  +     0.51037405190683 * 
        S_REP_ninq  +     0.44808525211083 * S_REP_value
          +    -0.26760253087166 * S_REP_yoj ;
   H14  =    -0.11766819029086 * S_REP_clage  +     0.37675155536102 * 
        S_REP_clno  +    -1.40176529461934 * S_REP_debtinc
          +    -0.33347887334955 * S_REP_delinq  +    -0.93189382300241 * 
        S_REP_derog  +     0.14773119868753 * S_REP_loan
          +     0.65553319202921 * S_REP_mortdue  +    -0.51245471898902 * 
        S_REP_ninq  +    -0.09683863673345 * S_REP_value
          +    -0.13774995720744 * S_REP_yoj ;
   H15  =    -1.45700837806533 * S_REP_clage  +    -0.52984215542527 * 
        S_REP_clno  +     1.15948789842713 * S_REP_debtinc
          +     0.19011409641161 * S_REP_delinq  +    -2.02616431453247 * 
        S_REP_derog  +     -0.6553627920171 * S_REP_loan
          +    -0.14566068551477 * S_REP_mortdue  +     0.18837895409628 * 
        S_REP_ninq  +     0.03023882849475 * S_REP_value
          +     -0.2272136712169 * S_REP_yoj ;
   H11  = H11  +      0.4971837585444 * jobMgr  +     0.99108600553959 * 
        jobOffice  +     -0.0175936835238 * jobOther
          +    -0.64974941484421 * jobProfEx  +     0.54418567034446 * 
        jobSales  +    -0.14052025055858 * reasonDebtCon ;
   H12  = H12  +    -0.11996971867833 * jobMgr  +    -0.89911075787109 * 
        jobOffice  +     0.94148156880893 * jobOther
          +     0.00858214852939 * jobProfEx  +     0.94780143279274 * 
        jobSales  +    -0.17986016486928 * reasonDebtCon ;
   H13  = H13  +     0.42171167869344 * jobMgr  +     1.69024912052118 * 
        jobOffice  +     0.29962164605448 * jobOther
          +    -1.00495563265965 * jobProfEx  +    -0.29049612384344 * 
        jobSales  +    -0.51335639253942 * reasonDebtCon ;
   H14  = H14  +     0.33821409519278 * jobMgr  +    -0.32425917467918 * 
        jobOffice  +     1.25593183968499 * jobOther
          +    -0.46533260470105 * jobProfEx  +     0.63773311846622 * 
        jobSales  +     0.60689300908065 * reasonDebtCon ;
   H15  = H15  +    -0.04254576236664 * jobMgr  +    -0.82337471757333 * 
        jobOffice  +     0.26980517777569 * jobOther
          +    -1.04647618149321 * jobProfEx  +    -0.77143124331498 * 
        jobSales  +     0.60454409349743 * reasonDebtCon ;
   H11  =    -0.20425314196788 + H11 ;
   H12  =    -1.18134511087683 + H12 ;
   H13  =     1.36835995204487 + H13 ;
   H14  =     1.82309032577926 + H14 ;
   H15  =    -1.21360634280242 + H15 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
   H14  = TANH(H14 );
   H15  = TANH(H15 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
   H14  = .;
   H15  = .;
END;
*** *************************;
*** Writing the Node bad ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_bad1  =     3.04827710427339 * H11  +     2.87488930274442 * H12
          +    -3.13322020184657 * H13  +    -2.05104855569441 * H14
          +     1.75557568090107 * H15 ;
   P_bad1  =     1.21289221953622 + P_bad1 ;
   P_bad0  = 0; 
   _MAX_ = MAX (P_bad1 , P_bad0 );
   _SUM_ = 0.; 
   P_bad1  = EXP(P_bad1  - _MAX_);
   _SUM_ = _SUM_ + P_bad1 ;
   P_bad0  = EXP(P_bad0  - _MAX_);
   _SUM_ = _SUM_ + P_bad0 ;
   P_bad1  = P_bad1  / _SUM_;
   P_bad0  = P_bad0  / _SUM_;
END;
ELSE DO;
   P_bad1  = .;
   P_bad0  = .;
END;
IF _DM_BAD EQ 1 THEN DO;
   P_bad1  =     0.08693115519253;
   P_bad0  =     0.91306884480746;
END;
*** *************************;
*** Writing the I_bad  AND U_bad ;
*** *************************;
_MAXP_ = P_bad1 ;
I_bad  = "1           " ;
U_bad  =                    1;
IF( _MAXP_ LT P_bad0  ) THEN DO; 
   _MAXP_ = P_bad0 ;
   I_bad  = "0           " ;
   U_bad  =                    0;
END;
********************************;
*** End Scoring Code for Neural;
********************************;
