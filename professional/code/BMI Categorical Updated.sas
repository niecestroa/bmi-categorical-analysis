/*====================================================================
   PROJECT: NHIS 2018 – BMI & Stroke Ordinal Logistic Analysis
   AUTHOR:  Aaron Niecestro
   PURPOSE: Clean NHIS Sample Adult data, create categorical variables,
            apply inclusion/exclusion criteria, and run proportional
            and partial proportional odds models.
====================================================================*/


/*--------------------------------------------------------------------
  SECTION 1 — Explore Raw Data
--------------------------------------------------------------------*/

proc contents data=NHIS.SAMADULT;
    title "Contents of the 2018 NHIS Sample Adult File";
run;

proc freq data=NHIS.SAMADULT;
    tables BMI SEX STREV AGE_P R_MARITL MRACBPI2
           AFLHCA8 AFLHCA18 AFLHC32_;
run;

proc means data=NHIS.SAMADULT;
    var BMI AGE_P;
run;



/*--------------------------------------------------------------------
  SECTION 2 — Create Derived Variables + Apply Inclusion Criteria
--------------------------------------------------------------------*/

data NHIS.SAMADULT2;
    set NHIS.SAMADULT;

    /*------------------------------
      BMI Category (Ordinal Outcome)
    ------------------------------*/
    length BMI_CAT $20;

    if BMI < 18.5 then delete;
    else if 18.5 <= BMI < 25 then BMI_CAT = "1 Normal";
    else if 25 <= BMI < 30 then BMI_CAT = "2 Overweight";
    else if 30 <= BMI < 40 then BMI_CAT = "3 Moderately Obese";
    else if 40 <= BMI <= 80 then BMI_CAT = "4 Severely Obese";
    else delete;

    /*------------------------------
      Stroke Category (Predictor)
    ------------------------------*/
    length STROKE_CAT $20;

    select (STREV);
        when (1) STROKE_CAT = "1 Yes";
        when (2) STROKE_CAT = "2 No";
        otherwise delete;
    end;

    /*------------------------------
      Age Category (Confounder)
    ------------------------------*/
    length AGE_CAT $20;

    if AGE_P < 40 then delete;
    else if 40 <= AGE_P < 50 then AGE_CAT = "1 AGE=40-49";
    else if 50 <= AGE_P < 60 then AGE_CAT = "2 AGE=50-59";
    else if 60 <= AGE_P < 70 then AGE_CAT = "3 AGE=60-69";
    else if 70 <= AGE_P < 80 then AGE_CAT = "4 AGE=70-79";
    else if AGE_P >= 80 then AGE_CAT = "5 AGE=80+";

    /*------------------------------
      Sex Category
    ------------------------------*/
    length SEX_CAT $20;

    if SEX = 1 then SEX_CAT = "1 Male";
    else if SEX = 2 then SEX_CAT = "2 female";
    else delete;

    /*------------------------------
      Weight‑Related Limitation Variables
    ------------------------------*/
    length WEIGHT_STROKE WEIGHT_ACTIVE WEIGHT_AGE $20;

    if AFLHCA8 in (1,2) then WEIGHT_STROKE = cats(AFLHCA8, " ", ifc(AFLHCA8=1,"Yes","No"));
    else delete;

    if AFLHCA18 in (1,2) then WEIGHT_ACTIVE = cats(AFLHCA18, " ", ifc(AFLHCA18=1,"Yes","No"));
    else delete;

    if AFLHC32_ in (1,2) then WEIGHT_AGE = cats(AFLHC32_, " ", ifc(AFLHC32_=1,"Yes","No"));
    else delete;

    /*------------------------------
      Marital Status Filter
    ------------------------------*/
    if R_MARITL = 9 then delete;

    /*------------------------------
      Race Filter
    ------------------------------*/
    if MRACBPI2 in (16,17) then delete;

    /*------------------------------
      Remove Remaining Missing Values
    ------------------------------*/
    if missing(BMI_CAT)     then delete;
    if missing(STROKE_CAT)  then delete;
    if missing(AGE_P)       then delete;
    if missing(R_MARITL)    then delete;
    if missing(AFLHCA8)     then delete;
    if missing(AFLHCA18)    then delete;
    if missing(AFLHC32_)    then delete;
    if missing(MRACBPI2)    then delete;
    if missing(SEX)         then delete;

run;



/*--------------------------------------------------------------------
  SECTION 3 — Final Analysis Dataset
--------------------------------------------------------------------*/

data NHIS.SAMADULT3;
    set NHIS.SAMADULT2;
    keep BMI BMI_CAT STROKE_CAT STREV AGE_P R_MARITL MRACBPI2
         SEX AGE_CAT WEIGHT_STROKE WEIGHT_AGE WEIGHT_ACTIVE SEX_CAT;
run;

proc contents data=NHIS.SAMADULT3; run;

proc freq data=NHIS.SAMADULT3;
    tables BMI_CAT STROKE_CAT AGE_P R_MARITL
           WEIGHT_STROKE WEIGHT_AGE WEIGHT_ACTIVE
           MRACBPI2 SEX AGE_CAT / nocum;
run;



/*--------------------------------------------------------------------
  SECTION 4 — Descriptive Statistics
--------------------------------------------------------------------*/

proc means data=NHIS.SAMADULT3;
    var BMI;
    class BMI_CAT;
run;

proc means data=NHIS.SAMADULT3;
    var BMI;
    class STROKE_CAT WEIGHT_STROKE WEIGHT_ACTIVE
          WEIGHT_AGE SEX_CAT AGE_CAT;
run;



/*--------------------------------------------------------------------
  SECTION 5 — Confounder Screening (Table 1 & 2)
--------------------------------------------------------------------*/

proc freq data=NHIS.SAMADULT3;
    tables WEIGHT_STROKE*STROKE_CAT
           WEIGHT_ACTIVE*STROKE_CAT
           WEIGHT_AGE*STROKE_CAT
           SEX*STROKE_CAT
           AGE_CAT*STROKE_CAT / measures chisq cmh;
run;

proc freq data=NHIS.SAMADULT3;
    tables STROKE_CAT*BMI_CAT
           WEIGHT_STROKE*BMI_CAT
           WEIGHT_ACTIVE*BMI_CAT
           WEIGHT_AGE*BMI_CAT
           SEX_CAT*BMI_CAT / measures chisq trend;
run;

proc freq data=NHIS.SAMADULT3;
    tables AGE_CAT*BMI_CAT / measures chisq cmh;
run;



/*--------------------------------------------------------------------
  SECTION 6 — Proportional Odds Models
--------------------------------------------------------------------*/

proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") / param=ref;
    model BMI_CAT = STROKE_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal") / param=ref;
    model BMI_CAT = STREV;
run;



/*--------------------------------------------------------------------
  SECTION 7 — Weight‑Related Confounder Models
--------------------------------------------------------------------*/

%macro test_confounder(var=);
    proc logistic data=NHIS.SAMADULT3 descending;
        class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") &var(ref="2 No") / param=ref;
        model BMI_CAT = STROKE_CAT &var;
    run;

    proc logistic data=NHIS.SAMADULT3 descending;
        class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") &var(ref="2 No") / param=ref;
        model BMI_CAT = STROKE_CAT &var STROKE_CAT*&var;
    run;
%mend;

%test_confounder(var=WEIGHT_STROKE);
%test_confounder(var=WEIGHT_ACTIVE);
%test_confounder(var=WEIGHT_AGE);



/*--------------------------------------------------------------------
  SECTION 8 — Sex and Age Confounder Models
--------------------------------------------------------------------*/

proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") SEX_CAT(ref="2 female") / param=ref;
    model BMI_CAT = STROKE_CAT SEX_CAT;
run;

proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal") STROKE_CAT(ref="2 No") AGE_CAT(ref="1 AGE=40-49") / param=ref;
    model BMI_CAT = STROKE_CAT AGE_CAT;
    oddsratio AGE_CAT;
run;



/*--------------------------------------------------------------------
  SECTION 9 — Partial Proportional Odds (Unequal Slopes) Models
--------------------------------------------------------------------*/

proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal")
          STROKE_CAT(ref="2 No")
          SEX_CAT(ref="2 female") / param=ref;
    model BMI_CAT = STROKE_CAT SEX_CAT / unequalslopes;
run;

/* Unequal slopes for SEX only */
proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal")
          STROKE_CAT(ref="2 No")
          SEX_CAT(ref="2 female") / param=ref;
    model BMI_CAT = STROKE_CAT SEX_CAT / unequalslopes=SEX_CAT;
run;

/* Unequal slopes for STROKE only */
proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal")
          STROKE_CAT(ref="2 No")
          SEX_CAT(ref="2 female") / param=ref;
    model BMI_CAT = STROKE_CAT SEX_CAT / unequalslopes=STROKE_CAT;
run;

/* AGE_CAT unequal slopes */
proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal")
          STROKE_CAT(ref="2 No")
          AGE_CAT(ref="1 AGE=40-49") / param=ref;
    model BMI_CAT = STROKE_CAT AGE_CAT / unequalslopes;
    oddsratio AGE_CAT;
run;

/* Unequal slopes for STROKE only (AGE model) */
proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal")
          STROKE_CAT(ref="2 No")
          AGE_CAT(ref="1 AGE=40-49") / param=ref;
    model BMI_CAT = STROKE_CAT AGE_CAT / unequalslopes=STROKE_CAT;
run;



/*--------------------------------------------------------------------
  SECTION 10 — Final Model (Chosen)
--------------------------------------------------------------------*/

proc logistic data=NHIS.SAMADULT3 descending;
    class BMI_CAT(ref="1 Normal")
          STROKE_CAT(ref="2 No")
          AGE_CAT(ref="1 AGE=40-49")
          SEX_CAT(ref="2 female") / param=ref;
    model BMI_CAT = STROKE_CAT AGE_CAT SEX_CAT
          / unequalslopes=(AGE_CAT SEX_CAT);
    oddsratio AGE_CAT;
run;
