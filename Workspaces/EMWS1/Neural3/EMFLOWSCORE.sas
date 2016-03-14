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

      label H12 = 'Hidden: H1=2' ;

      label H13 = 'Hidden: H1=3' ;

      label H14 = 'Hidden: H1=4' ;

      label H15 = 'Hidden: H1=5' ;

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
   H11  =     0.36840373951829 * GRP_LOG_REP_clage1  +     0.12438563967578 *
        GRP_LOG_REP_clage2  +     0.39054354328776 * GRP_LOG_REP_clage3
          +  1.0000000133514E-10 * GRP_LOG_REP_clage4
          +  1.0000000133514E-10 * GRP_LOG_REP_debtinc1
          +     0.35191902313123 * GRP_LOG_REP_debtinc2
          +     0.58711651871332 * GRP_LOG_REP_debtinc3
          +     1.14630034913606 * GRP_LOG_REP_debtinc4
          +     0.94525809676037 * GRP_LOG_REP_ninq1
          +  9.9999994396249E-11 * GRP_LOG_REP_ninq3
          +     1.05041103023488 * GRP_LOG_REP_ninq4
          +                1E-10 * GRP_LOG_REP_value1
          +     0.05700090819135 * GRP_LOG_REP_value2
          +       0.073139389026 * GRP_LOG_REP_value3
          +     1.09993265465417 * GRP_LOG_REP_value4 ;
   H12  =     0.94670540532205 * GRP_LOG_REP_clage1  +     0.37558984948784 *
        GRP_LOG_REP_clage2  +     0.38869998393804 * GRP_LOG_REP_clage3
          +  9.9999994396249E-11 * GRP_LOG_REP_clage4
          +  9.9999994396249E-11 * GRP_LOG_REP_debtinc1
          +     0.46674068187192 * GRP_LOG_REP_debtinc2
          +  1.0000000133514E-10 * GRP_LOG_REP_debtinc3
          +     0.54564647069176 * GRP_LOG_REP_debtinc4
          +     0.24013085745236 * GRP_LOG_REP_ninq1
          +      1.3580841864924 * GRP_LOG_REP_ninq3
          +  1.0000000827403E-10 * GRP_LOG_REP_ninq4
          +  1.0000000827403E-10 * GRP_LOG_REP_value1
          +     0.93117396341947 * GRP_LOG_REP_value2
          +  1.0000000827403E-10 * GRP_LOG_REP_value3
          +     1.67855555842194 * GRP_LOG_REP_value4 ;
   H13  =  9.9999999600419E-11 * GRP_LOG_REP_clage1  +     0.68540880418435 *
        GRP_LOG_REP_clage2  +                1E-10 * GRP_LOG_REP_clage3
          +     0.00398238280116 * GRP_LOG_REP_clage4
          +     0.47677786968651 * GRP_LOG_REP_debtinc1
          +      0.4514778557237 * GRP_LOG_REP_debtinc2
          +  9.9999994396249E-11 * GRP_LOG_REP_debtinc3
          +  1.0000000827403E-10 * GRP_LOG_REP_debtinc4
          +  1.0000000133514E-10 * GRP_LOG_REP_ninq1
          +     0.87194527570119 * GRP_LOG_REP_ninq3
          +  9.9999999600419E-11 * GRP_LOG_REP_ninq4
          +     0.61962606892354 * GRP_LOG_REP_value1
          +     1.28346951911467 * GRP_LOG_REP_value2
          +     0.42076627888219 * GRP_LOG_REP_value3
          +     1.16434901314866 * GRP_LOG_REP_value4 ;
   H14  =     0.84554618573511 * GRP_LOG_REP_clage1  +     0.07720801617349 *
        GRP_LOG_REP_clage2  +  9.9999999600419E-11 * GRP_LOG_REP_clage3
          +   9.999999997989E-11 * GRP_LOG_REP_clage4
          +     1.37220836387642 * GRP_LOG_REP_debtinc1
          +     0.67981851438063 * GRP_LOG_REP_debtinc2
          +     0.34290652323994 * GRP_LOG_REP_debtinc3
          +  9.9999994396249E-11 * GRP_LOG_REP_debtinc4
          +     0.17808036879842 * GRP_LOG_REP_ninq1
          +  1.0000000133514E-10 * GRP_LOG_REP_ninq3
          +      0.2528051440027 * GRP_LOG_REP_ninq4
          +     1.91808061968737 * GRP_LOG_REP_value1
          +     0.19452685302949 * GRP_LOG_REP_value2
          +  1.0000000133514E-10 * GRP_LOG_REP_value3
          +      0.3564764462649 * GRP_LOG_REP_value4 ;
   H15  =  1.0000000133514E-10 * GRP_LOG_REP_clage1  +  1.0000000133514E-10 *
        GRP_LOG_REP_clage2  +     0.74746559572198 * GRP_LOG_REP_clage3
          +     0.55653446959909 * GRP_LOG_REP_clage4
          +     0.29410852076146 * GRP_LOG_REP_debtinc1
          +  9.9999994396249E-11 * GRP_LOG_REP_debtinc2
          +  1.0000000827403E-10 * GRP_LOG_REP_debtinc3
          +  9.9999994396249E-11 * GRP_LOG_REP_debtinc4
          +     0.59027344576098 * GRP_LOG_REP_ninq1
          +  1.0000000133514E-10 * GRP_LOG_REP_ninq3
          +  1.0000000133514E-10 * GRP_LOG_REP_ninq4
          +     1.69073832484697 * GRP_LOG_REP_value1
          +  1.0000000133514E-10 * GRP_LOG_REP_value2
          +  1.0000000827403E-10 * GRP_LOG_REP_value3
          +  1.0000000133514E-10 * GRP_LOG_REP_value4 ;
   H11  =      2.1886922993405 + H11 ;
   H12  =    -1.90857431587321 + H12 ;
   H13  =    -1.83236277034657 + H13 ;
   H14  =    -0.05113457355768 + H14 ;
   H15  =    -0.40731971515441 + H15 ;
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
   P_bad1  =     3.53703813013825 * H11  +     2.86869513765632 * H12
          +    -2.88010639481836 * H13  +    -3.08330697909427 * H14
          +    -2.48611665348773 * H15 ;
   P_bad1  =    -0.63368290042738 + P_bad1 ;
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
H12
H13
H14
H15
;
