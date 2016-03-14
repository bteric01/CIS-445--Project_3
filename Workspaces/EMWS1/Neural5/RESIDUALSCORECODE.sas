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
      F_bad  $ 12
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

      label I_bad = 'Into: bad' ;

      label F_bad = 'From: bad' ;

      label U_bad = 'Unnormalized Into: bad' ;

      label P_bad1 = 'Predicted: bad=1' ;

      label R_bad1 = 'Residual: bad=1' ;

      label P_bad0 = 'Predicted: bad=0' ;

      label R_bad0 = 'Residual: bad=0' ;

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
   H11  =     0.37370244339385 * S_REP_clage  +    -0.72326603391775 * 
        S_REP_clno  +    -1.98328521434898 * S_REP_debtinc
          +    -0.44045107851083 * S_REP_delinq  +    -0.02530242927394 * 
        S_REP_derog  +     0.27625589592266 * S_REP_loan
          +     0.73022882138825 * S_REP_mortdue  +     0.05359278885665 * 
        S_REP_ninq  +    -0.82873876654809 * S_REP_value
          +    -0.19300389165533 * S_REP_yoj ;
   H12  =    -0.72742475418803 * S_REP_clage  +     1.52318335470205 * 
        S_REP_clno  +     2.31427792976021 * S_REP_debtinc
          +    -1.67947046306888 * S_REP_delinq  +      0.1424631957191 * 
        S_REP_derog  +    -0.02729503797831 * S_REP_loan
          +     -2.0420623879531 * S_REP_mortdue  +    -0.78678483380181 * 
        S_REP_ninq  +    -0.53111835275351 * S_REP_value
          +     0.54269611586006 * S_REP_yoj ;
   H13  =    -0.36275918430612 * S_REP_clage  +    -1.00303529518028 * 
        S_REP_clno  +      0.5860047004012 * S_REP_debtinc
          +     0.48956751946998 * S_REP_delinq  +     1.03382006084598 * 
        S_REP_derog  +    -0.18340003090107 * S_REP_loan
          +    -0.26125056567554 * S_REP_mortdue  +     0.58685266745239 * 
        S_REP_ninq  +    -0.39557941102681 * S_REP_value
          +    -0.52312960795784 * S_REP_yoj ;
   H11  = H11  +    -0.62199212720467 * jobMgr  +     1.73580634348761 * 
        jobOffice  +     0.15978497891849 * jobOther
          +    -0.07808479496552 * jobProfEx  +     -1.0515285291699 * 
        jobSales  +    -0.33297618953746 * reasonDebtCon ;
   H12  = H12  +    -0.33708066408613 * jobMgr  +     0.40850157902532 * 
        jobOffice  +     0.61980142255564 * jobOther
          +     0.76583117261994 * jobProfEx  +    -3.00435069171545 * 
        jobSales  +    -0.42914469414845 * reasonDebtCon ;
   H13  = H13  +    -0.87783922904262 * jobMgr  +     0.02205395180983 * 
        jobOffice  +     0.54407435489188 * jobOther
          +    -0.25155638720328 * jobProfEx  +    -0.86137211445728 * 
        jobSales  +     -0.2546936048405 * reasonDebtCon ;
   H11  =     3.46710281200971 + H11 ;
   H12  =      3.7781405552927 + H12 ;
   H13  =    -0.48735415294329 + H13 ;
   H11  = TANH(H11 );
   H12  = TANH(H12 );
   H13  = TANH(H13 );
END;
ELSE DO;
   H11  = .;
   H12  = .;
   H13  = .;
END;
*** *************************;
*** Writing the Node bad ;
*** *************************;

*** Generate dummy variables for bad ;
drop bad1 bad0 ;
label F_bad = 'From: bad' ;
length F_bad $ 12;
F_bad = put( bad , BEST12. );
%DMNORMIP( F_bad )
if missing( bad ) then do;
   bad1 = .;
   bad0 = .;
end;
else do;
   if F_bad = '0'  then do;
      bad1 = 0;
      bad0 = 1;
   end;
   else if F_bad = '1'  then do;
      bad1 = 1;
      bad0 = 0;
   end;
   else do;
      bad1 = .;
      bad0 = .;
   end;
end;
IF _DM_BAD EQ 0 THEN DO;
   P_bad1  =    -4.51178269898123 * H11  +    -1.97966705748432 * H12
          +     2.19539087664339 * H13 ;
   P_bad1  =     2.79580860906993 + P_bad1 ;
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
*** *****************************;
*** Writing the Residuals  of the Node bad ;
*** ******************************;
IF MISSING( bad1 ) THEN R_bad1  = . ;
ELSE R_bad1  = bad1  - P_bad1 ;
IF MISSING( bad0 ) THEN R_bad0  = . ;
ELSE R_bad0  = bad0  - P_bad0 ;
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
