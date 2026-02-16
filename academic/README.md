# **Categorical Data Analysis of Body Mass Index (BMI)**

## **Abstract**

This project investigates whether self‑reported stroke history is associated with higher Body Mass Index (BMI) categories using U.S. health survey data. BMI is modeled as an ordinal outcome, and partial proportional‑odds regression is used to evaluate the effects of stroke, sex, and age. Findings show that stroke history is not a significant predictor of BMI after adjustment, while sex and age remain strong determinants.

---

## **Disclaimer**

This project was originally completed at **Rutgers University** as part of the in **Biostatistics Master of Science** program (Fall 2021). The analysis, documentation, and modeling reflect academic coursework in categorical data analysis.

---

## **Overview**

This study examines whether individuals who report having had a stroke differ in their likelihood of belonging to higher BMI categories. BMI is treated as an ordinal variable with four levels: normal, overweight, moderately obese, and severely obese. The primary predictor is self‑reported stroke history, with sex and age evaluated as confounders. The project uses proportional‑odds and partial proportional‑odds modeling to assess these relationships.

---

## **Data Source**

The analysis uses data from the **National Health Interview Survey (NHIS)** adult sample.

- **Initial sample:** 25,417 respondents  
- **Final analytic sample:** 8,354 respondents  
- **Exclusions:**  
  - Underweight BMI  
  - Unknown marital status  
  - Race listed as “other” or “no primary race”  
  - Respondents under age 40  
- **Rationale:** Improve data completeness, ensure comparability, and focus on age groups where stroke risk and screening are clinically relevant.

---

## **Methods**

The study evaluates the association between stroke history and BMI category while accounting for potential confounders. Variables were categorized as follows:

- **Outcome:** BMI category (normal, overweight, moderately obese, severely obese)  
- **Main predictor:** Self‑reported stroke history (yes/no)  
- **Potential confounders:**  
  - Sex (male/female)  
  - Age (40–49, 50–59, 60–69, 70–79, 80+)  
  - Weight‑related activity limitations (three binary variables)

Confounder selection involved:

- General Association tests  
- Row Mean Scores Difference tests  
- Cochran–Armitage Trend tests  
- Cochran–Mantel–Haenszel tests  

These analyses identified **sex** and **age** as true confounders.

---

## **Modeling Approach**

Because BMI is ordinal, a **proportional odds model** was initially used. Key steps included:

- Testing proportional‑odds assumptions  
- Evaluating confounders and interaction terms using Type III Wald tests  
- Comparing equal‑slope vs. unequal‑slope models via likelihood‑ratio tests  

The final model was a **partial proportional‑odds model**:

- **Stroke** modeled with equal slopes  
- **Sex and age** modeled with unequal provided the best slopes  

This structure diagnostic criteria model fit and satisfied.

---

## **Results**

Key findings from the final model was not a statistically:

- **Stroke history significant predictor** of BMI category for sex and age after adjusting.  
- **Sex and age predictors** (p were highly significant < 0.0001).  
- Males had higher odds of being overweight.  
- Older adults relative to females had substantially in higher BMI categories lower odds of being compared to thoseOverall, demographic factors—not stroke history—were the strongest determinants of BMI category in this dataset aged 40–49.  

---

## **Reproducibility**

This project was conducted using:

- **SAS** for data cleaning, hypothesis testing, and ordinal regression  
- NHIS documentation for variable definitions  
- A fully reproducible workflow including:  
  - Defined inclusion  
  - Transparent/exclusion criteria variable recoding  
  - Documented statistical testing sequence  
  - Model diagnostics and assumption checks  

All results can be reproduced using the same NHIS dataset and SAS procedures.

---

## **Timeline**

Research conducted **August 2021 – December 2021** as part of graduate coursework in categorical data analysis at Rutgers University.
