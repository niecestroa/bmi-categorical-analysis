/*--------------------------------------------------------------------
  Compatibility shim: a small synthetic NHIS.SAMADULT with the exact
  columns the pipeline reads, so the derived-variable logic runs in
  isolation. Real NHIS microdata is not shipped; these are invented rows
  covering the BMI / stroke / age / sex / limitation combinations the
  script's inclusion criteria and models exercise.
--------------------------------------------------------------------*/
data NHIS.SAMADULT;
    input BMI SEX STREV AGE_P R_MARITL MRACBPI2 AFLHCA8 AFLHCA18 AFLHC32_;
    datalines;
22.4 1 2 45 1 1 2 2 2
27.1 2 2 52 5 2 1 2 2
31.8 1 1 63 1 1 2 1 2
42.0 2 2 71 4 1 2 2 1
19.9 1 2 40 1 2 2 2 2
26.5 2 2 58 5 1 1 2 2
33.2 1 2 66 2 1 2 2 2
45.5 2 1 82 7 2 2 2 2
23.7 2 2 49 1 1 2 2 2
28.9 1 2 55 5 2 2 1 2
30.5 2 2 61 1 1 2 2 2
38.4 1 2 74 4 1 2 2 2
21.2 2 2 43 1 2 2 2 2
29.3 1 2 57 5 1 1 2 2
34.7 2 1 68 1 1 2 2 2
41.9 1 2 79 4 2 2 2 1
24.8 2 2 47 1 1 2 2 2
26.0 1 2 51 5 1 2 2 2
32.1 2 2 64 1 2 2 2 2
44.2 1 2 77 4 1 2 2 2
20.6 2 2 41 1 1 2 2 2
27.8 1 1 53 5 2 1 2 2
35.9 2 2 69 1 1 2 2 2
39.1 1 2 72 4 1 2 2 2
23.0 2 2 46 1 1 2 2 2
28.2 1 2 59 5 2 2 2 2
31.0 2 2 62 1 1 2 2 2
40.7 1 2 81 7 1 2 2 2
22.9 2 2 44 1 1 2 2 2
29.9 1 2 56 5 1 2 2 2
;
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
