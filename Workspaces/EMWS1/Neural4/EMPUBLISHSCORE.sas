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
   H11  =      0.5131908092698 * S_REP_clage  +    -0.33974756462434 *
        S_REP_clno  +    -1.84826332972638 * S_REP_debtinc
          +    -0.71894464986145 * S_REP_delinq  +    -0.21448745477968 *
        S_REP_derog  +     0.19091660069461 * S_REP_loan
          +     0.50208666423614 * S_REP_mortdue  +    -0.32535925288246 *
        S_REP_ninq  +    -0.59000285203392 * S_REP_value
          +    -0.23942462411482 * S_REP_yoj ;
   H11  = H11  +     -0.0612734207067 * jobMgr  +     1.95081480490553 *
        jobOffice  +     0.18802232089434 * jobOther
          +    -0.00052144666791 * jobProfEx  +    -1.47852896530515 *
        jobSales  +    -0.47538341232871 * reasonDebtCon ;
   H11  =     3.74030724693985 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
END;
*** *************************;
*** Writing the Node bad ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   P_bad1  =    -5.99760759404159 * H11 ;
   P_bad1  =     2.97558722742604 + P_bad1 ;
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
drop
H11
;
drop S_:;
