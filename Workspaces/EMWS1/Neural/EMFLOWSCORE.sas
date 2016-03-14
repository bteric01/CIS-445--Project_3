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
      label GRP_LOG_REP_clage1 = 'Dummy: GRP_LOG_REP_clage=1' ;

      label GRP_LOG_REP_clage2 = 'Dummy: GRP_LOG_REP_clage=2' ;

      label GRP_LOG_REP_clage3 = 'Dummy: GRP_LOG_REP_clage=3' ;

      label GRP_LOG_REP_clage4 = 'Dummy: GRP_LOG_REP_clage=4' ;

      label GRP_LOG_REP_debtinc1 = 'Dummy: GRP_LOG_REP_debtinc=1' ;

      label GRP_LOG_REP_debtinc2 = 'Dummy: GRP_LOG_REP_debtinc=2' ;

      label GRP_LOG_REP_debtinc3 = 'Dummy: GRP_LOG_REP_debtinc=3' ;

      label GRP_LOG_REP_debtinc4 = 'Dummy: GRP_LOG_REP_debtinc=4' ;

      label GRP_LOG_REP_ninq1 = 'Dummy: GRP_LOG_REP_ninq=1' ;

      label GRP_LOG_REP_ninq3 = 'Dummy: GRP_LOG_REP_ninq=3' ;

      label GRP_LOG_REP_ninq4 = 'Dummy: GRP_LOG_REP_ninq=4' ;

      label GRP_LOG_REP_value1 = 'Dummy: GRP_LOG_REP_value=1' ;

      label GRP_LOG_REP_value2 = 'Dummy: GRP_LOG_REP_value=2' ;

      label GRP_LOG_REP_value3 = 'Dummy: GRP_LOG_REP_value=3' ;

      label GRP_LOG_REP_value4 = 'Dummy: GRP_LOG_REP_value=4' ;

      label H11 = 'Hidden: H1=1' ;

      label I_bad = 'Into: bad' ;

      label F_bad = 'From: bad' ;

      label U_bad = 'Unnormalized Into: bad' ;

      label P_bad1 = 'Predicted: bad=1' ;

      label R_bad1 = 'Residual: bad=1' ;

      label P_bad0 = 'Predicted: bad=0' ;

      label R_bad0 = 'Residual: bad=0' ;

      label  _WARN_ = "Warnings";

*** Generate dummy variables for GRP_LOG_REP_clage ;
drop GRP_LOG_REP_clage1 GRP_LOG_REP_clage2 GRP_LOG_REP_clage3
        GRP_LOG_REP_clage4 ;
if missing( GRP_LOG_REP_clage ) then do;
   GRP_LOG_REP_clage1 = .;
   GRP_LOG_REP_clage2 = .;
   GRP_LOG_REP_clage3 = .;
   GRP_LOG_REP_clage4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_REP_clage , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            GRP_LOG_REP_clage1 = -0.55901699437494;
            GRP_LOG_REP_clage2 = -0.55901699437494;
            GRP_LOG_REP_clage3 = -0.55901699437494;
            GRP_LOG_REP_clage4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_REP_clage1 = 0.55901699437494;
               GRP_LOG_REP_clage2 = -0.55901699437494;
               GRP_LOG_REP_clage3 = -0.55901699437494;
               GRP_LOG_REP_clage4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_REP_clage1 = 0.55901699437494;
            GRP_LOG_REP_clage2 = 0.55901699437494;
            GRP_LOG_REP_clage3 = -0.55901699437494;
            GRP_LOG_REP_clage4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_REP_clage1 = 0.55901699437494;
         GRP_LOG_REP_clage2 = 0.55901699437494;
         GRP_LOG_REP_clage3 = 0.55901699437494;
         GRP_LOG_REP_clage4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_REP_clage1 = 0.55901699437494;
            GRP_LOG_REP_clage2 = 0.55901699437494;
            GRP_LOG_REP_clage3 = 0.55901699437494;
            GRP_LOG_REP_clage4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_REP_clage1 = .;
      GRP_LOG_REP_clage2 = .;
      GRP_LOG_REP_clage3 = .;
      GRP_LOG_REP_clage4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_REP_debtinc ;
drop GRP_LOG_REP_debtinc1 GRP_LOG_REP_debtinc2 GRP_LOG_REP_debtinc3
        GRP_LOG_REP_debtinc4 ;
if missing( GRP_LOG_REP_debtinc ) then do;
   GRP_LOG_REP_debtinc1 = .;
   GRP_LOG_REP_debtinc2 = .;
   GRP_LOG_REP_debtinc3 = .;
   GRP_LOG_REP_debtinc4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_REP_debtinc , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            GRP_LOG_REP_debtinc1 = -0.55901699437494;
            GRP_LOG_REP_debtinc2 = -0.55901699437494;
            GRP_LOG_REP_debtinc3 = -0.55901699437494;
            GRP_LOG_REP_debtinc4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_REP_debtinc1 = 0.55901699437494;
               GRP_LOG_REP_debtinc2 = -0.55901699437494;
               GRP_LOG_REP_debtinc3 = -0.55901699437494;
               GRP_LOG_REP_debtinc4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_REP_debtinc1 = 0.55901699437494;
            GRP_LOG_REP_debtinc2 = 0.55901699437494;
            GRP_LOG_REP_debtinc3 = -0.55901699437494;
            GRP_LOG_REP_debtinc4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_REP_debtinc1 = 0.55901699437494;
         GRP_LOG_REP_debtinc2 = 0.55901699437494;
         GRP_LOG_REP_debtinc3 = 0.55901699437494;
         GRP_LOG_REP_debtinc4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_REP_debtinc1 = 0.55901699437494;
            GRP_LOG_REP_debtinc2 = 0.55901699437494;
            GRP_LOG_REP_debtinc3 = 0.55901699437494;
            GRP_LOG_REP_debtinc4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_REP_debtinc1 = .;
      GRP_LOG_REP_debtinc2 = .;
      GRP_LOG_REP_debtinc3 = .;
      GRP_LOG_REP_debtinc4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_REP_ninq ;
drop GRP_LOG_REP_ninq1 GRP_LOG_REP_ninq3 GRP_LOG_REP_ninq4 ;
if missing( GRP_LOG_REP_ninq ) then do;
   GRP_LOG_REP_ninq1 = .;
   GRP_LOG_REP_ninq3 = .;
   GRP_LOG_REP_ninq4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_REP_ninq , BEST12. );
   %DMNORMIP( _dm12 )
   if _dm12 = '3'  then do;
      GRP_LOG_REP_ninq1 = 0.63245553203367;
      GRP_LOG_REP_ninq3 = -0.63245553203367;
      GRP_LOG_REP_ninq4 = -0.63245553203367;
   end;
   else if _dm12 = '4'  then do;
      GRP_LOG_REP_ninq1 = 0.63245553203367;
      GRP_LOG_REP_ninq3 = 0.63245553203367;
      GRP_LOG_REP_ninq4 = -0.63245553203367;
   end;
   else if _dm12 = '5'  then do;
      GRP_LOG_REP_ninq1 = 0.63245553203367;
      GRP_LOG_REP_ninq3 = 0.63245553203367;
      GRP_LOG_REP_ninq4 = 0.63245553203367;
   end;
   else if _dm12 = '1'  then do;
      GRP_LOG_REP_ninq1 = -0.63245553203367;
      GRP_LOG_REP_ninq3 = -0.63245553203367;
      GRP_LOG_REP_ninq4 = -0.63245553203367;
   end;
   else do;
      GRP_LOG_REP_ninq1 = .;
      GRP_LOG_REP_ninq3 = .;
      GRP_LOG_REP_ninq4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;

*** Generate dummy variables for GRP_LOG_REP_value ;
drop GRP_LOG_REP_value1 GRP_LOG_REP_value2 GRP_LOG_REP_value3
        GRP_LOG_REP_value4 ;
if missing( GRP_LOG_REP_value ) then do;
   GRP_LOG_REP_value1 = .;
   GRP_LOG_REP_value2 = .;
   GRP_LOG_REP_value3 = .;
   GRP_LOG_REP_value4 = .;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
else do;
   length _dm12 $ 12; drop _dm12 ;
   _dm12 = put( GRP_LOG_REP_value , BEST12. );
   %DMNORMIP( _dm12 )
   _dm_find = 0; drop _dm_find;
   if _dm12 <= '3'  then do;
      if _dm12 <= '2'  then do;
         if _dm12 = '1'  then do;
            GRP_LOG_REP_value1 = -0.55901699437494;
            GRP_LOG_REP_value2 = -0.55901699437494;
            GRP_LOG_REP_value3 = -0.55901699437494;
            GRP_LOG_REP_value4 = -0.55901699437494;
            _dm_find = 1;
         end;
         else do;
            if _dm12 = '2'  then do;
               GRP_LOG_REP_value1 = 0.55901699437494;
               GRP_LOG_REP_value2 = -0.55901699437494;
               GRP_LOG_REP_value3 = -0.55901699437494;
               GRP_LOG_REP_value4 = -0.55901699437494;
               _dm_find = 1;
            end;
         end;
      end;
      else do;
         if _dm12 = '3'  then do;
            GRP_LOG_REP_value1 = 0.55901699437494;
            GRP_LOG_REP_value2 = 0.55901699437494;
            GRP_LOG_REP_value3 = -0.55901699437494;
            GRP_LOG_REP_value4 = -0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   else do;
      if _dm12 = '4'  then do;
         GRP_LOG_REP_value1 = 0.55901699437494;
         GRP_LOG_REP_value2 = 0.55901699437494;
         GRP_LOG_REP_value3 = 0.55901699437494;
         GRP_LOG_REP_value4 = -0.55901699437494;
         _dm_find = 1;
      end;
      else do;
         if _dm12 = '5'  then do;
            GRP_LOG_REP_value1 = 0.55901699437494;
            GRP_LOG_REP_value2 = 0.55901699437494;
            GRP_LOG_REP_value3 = 0.55901699437494;
            GRP_LOG_REP_value4 = 0.55901699437494;
            _dm_find = 1;
         end;
      end;
   end;
   if not _dm_find then do;
      GRP_LOG_REP_value1 = .;
      GRP_LOG_REP_value2 = .;
      GRP_LOG_REP_value3 = .;
      GRP_LOG_REP_value4 = .;
      substr(_warn_,2,1) = 'U';
      _DM_BAD = 1;
   end;
end;
*** *************************;
*** Writing the Node ord ;
*** *************************;
*** *************************;
*** Writing the Node H1 ;
*** *************************;
IF _DM_BAD EQ 0 THEN DO;
   H11  =  1.0000000133514E-10 * GRP_LOG_REP_clage1  +     0.04364206165471 *
        GRP_LOG_REP_clage2  +     0.13624993297965 * GRP_LOG_REP_clage3
          +     0.08615363436846 * GRP_LOG_REP_clage4
          +     0.57877992451216 * GRP_LOG_REP_debtinc1
          +  1.0000000827403E-10 * GRP_LOG_REP_debtinc2
          +  1.0000000827403E-10 * GRP_LOG_REP_debtinc3
          +  1.0000000827403E-10 * GRP_LOG_REP_debtinc4
          +  1.0000000827403E-10 * GRP_LOG_REP_ninq1
          +  1.0000000827403E-10 * GRP_LOG_REP_ninq3
          +  1.0000000827403E-10 * GRP_LOG_REP_ninq4
          +     1.25935285271008 * GRP_LOG_REP_value1
          +     0.01968411654557 * GRP_LOG_REP_value2
          +     0.02907157918835 * GRP_LOG_REP_value3
          +  1.0000000827403E-10 * GRP_LOG_REP_value4 ;
   H11  =    -0.60166259756818 + H11 ;
   H11  = TANH(H11 );
END;
ELSE DO;
   H11  = .;
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
   P_bad1  =    -4.49889696786094 * H11 ;
   P_bad1  =    -0.71524296738383 + P_bad1 ;
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
   P_bad1  =     0.19939577039274;
   P_bad0  =     0.80060422960725;
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
drop
H11
;
