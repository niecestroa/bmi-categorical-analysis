# **README.md — BMI & Stroke Ordinal Logistic Regression (NHIS 2018)**  
*A fully documented, reproducible categorical data analysis pipeline implemented in SAS, R, and Python.*

---

# ** Abstract**

**Background:**  
Body mass index (BMI) is a widely used indicator of obesity‑related health risk, and stroke remains a major cause of morbidity among U.S. adults. Understanding whether stroke history is associated with higher BMI categories may provide insight into functional limitations, lifestyle changes, and chronic disease burden. Using nationally representative data from the 2018 National Health Interview Survey (NHIS), this study evaluates the relationship between stroke history and BMI category among adults aged 40 years and older.

**Methods:**  
Data were restricted to respondents aged ≥40 with valid BMI, stroke history, race, marital status, and weight‑related functional limitation responses. BMI was categorized into four ordered levels (Normal, Overweight, Moderately Obese, Severely Obese). Stroke history (Yes/No) served as the primary predictor. Additional covariates included age category, sex, and three weight‑related functional limitation indicators. Ordinal logistic regression was used to estimate the association between stroke and BMI category. Proportional odds assumptions were evaluated, and partial proportional odds models were fitted when assumptions were violated. Confounders were assessed using statistical significance, clinical relevance, and the 10% change‑in‑estimate rule.

**Results:**  
In the proportional odds model, stroke history was not significantly associated with BMI category. Age category and sex were significant predictors of higher BMI categories, and both violated the proportional odds assumption. A partial proportional odds model allowing unequal slopes for age and sex provided the best fit. After adjustment, stroke history remained non‑significant, while age and sex continued to show strong associations with BMI category.

**Conclusions:**  
Among U.S. adults aged 40 and older, stroke history was not independently associated with BMI category after adjusting for demographic and functional factors. Age and sex were the strongest predictors of BMI category, and their effects varied across BMI levels, supporting the use of partial proportional odds modeling. These findings highlight the importance of demographic and functional characteristics in understanding obesity patterns among older adults and demonstrate the value of flexible ordinal modeling approaches in public health research.

---

# **Project Overview**

This project analyzes the association between **BMI category** (ordinal outcome) and **stroke history** (primary predictor) using the **2018 NHIS Sample Adult dataset**. The analysis applies:

- **Proportional odds models**  
- **Partial proportional odds models (unequal slopes)**  
- **Confounder assessment** using statistical significance, clinical relevance, and the 10% change‑in‑estimate rule  
- **Rigorous inclusion/exclusion criteria**  
- **Reproducible pipelines** in **SAS**, **R**, and **Python**

This repository demonstrates a complete, end‑to‑end workflow for categorical data analysis in a public health/biostatistics context.

---

# **Repository Structure**

```
/code
   ├── 01_sas_analysis_clean.sas
   ├── 02_r_analysis_clean.R
   ├── 03_python_analysis_clean.py
/data
   └── SAMADULT_2018.csv   (not included; user must download NHIS data)
/docs
   ├── flowchart_inclusion_exclusion.png
   ├── model_results_summary.pdf
README.md
```

---

# **Research Question**

**Is stroke history associated with BMI category among U.S. adults aged 40+?**

BMI is categorized into four ordered levels:

1. Normal  
2. Overweight  
3. Moderately Obese  
4. Severely Obese  

Stroke history is binary:

- Yes  
- No  

The analysis evaluates whether stroke status predicts higher BMI category after adjusting for:

- Age category  
- Sex  
- Weight‑related functional limitations  

---

# **Data Cleaning & Variable Creation**

### **Inclusion Criteria**
- Age ≥ 40  
- Valid BMI (18.5–80)  
- Valid stroke response (STREV = 1 or 2)  
- Valid weight‑related limitation responses (AFLHCA8, AFLHCA18, AFLHC32_ ∈ {1,2})  
- Valid race (exclude categories 16 and 17)  
- Valid marital status (exclude 9 = unknown)  
- Complete cases for all variables used in modeling  

### **Derived Variables**
| Variable | Description |
|---------|-------------|
| `BMI_CAT` | Ordinal BMI category (Normal → Severe Obesity) |
| `STROKE_CAT` | Stroke history (Yes/No) |
| `AGE_CAT` | Age grouped into 40–49, 50–59, 60–69, 70–79, 80+ |
| `SEX_CAT` | Male/Female |
| `WEIGHT_STROKE` | Weight affects stroke? (Yes/No) |
| `WEIGHT_ACTIVE` | Weight affects activity? (Yes/No) |
| `WEIGHT_AGE` | Weight affects age‑related limitations? (Yes/No) |

All recoding and filtering are implemented cleanly in SAS, R, and Python.

---

# **Descriptive Statistics**

The analysis includes:

- Frequency tables for all categorical variables  
- Mean BMI by category  
- Mean age by age group  
- Crosstabulations with chi‑square and CMH tests  

These steps establish baseline relationships and guide confounder selection.

---

# **Modeling Strategy**

### **1. Proportional Odds Model (Baseline)**  
Outcome: `BMI_CAT`  
Predictor: `STROKE_CAT`  

This tests whether stroke history is associated with higher BMI category.

### **2. Confounder Assessment**
Each potential confounder is evaluated using:

- Statistical significance  
- Clinical relevance  
- 10% change‑in‑estimate rule  
- Proportional odds assumption  

Variables tested:

- Age category  
- Sex  
- Weight‑related limitations  

### **3. Partial Proportional Odds Models (Unequal Slopes)**  
When proportional odds assumption fails, models allow:

- Unequal slopes for AGE_CAT  
- Unequal slopes for SEX_CAT  
- Unequal slopes for both  
- Comparison via likelihood ratio tests  

### **4. Final Model**
The final selected model:

```
BMI_CAT = STROKE_CAT + AGE_CAT + SEX_CAT
with unequal slopes for AGE_CAT and SEX_CAT
```

Stroke is not statistically significant after adjustment, but age and sex remain strong predictors.

---

# **Software Implementations**

Below is a comparison of the three fully equivalent analysis pipelines implemented in this project:

| **Task** | **SAS Implementation** | **R Implementation** | **Python Implementation** |
|---------|------------------------|----------------------|---------------------------|
| **Data Cleaning & Recoding** | DATA step (`DATA`, `SET`, `IF`, `LENGTH`, `DELETE`) | `dplyr::mutate()`, `filter()`, `case_when()` | `pandas` (`assign()`, `loc[]`, `np.select`) |
| **Descriptive Statistics** | `PROC FREQ`, `PROC MEANS` | `janitor::tabyl()`, `summary()`, `group_by()` | `pandas.crosstab()`, `groupby().agg()` |
| **Chi‑Square Tests** | `PROC FREQ / CHISQ` | `chisq.test()` | `scipy.stats.chi2_contingency()` |
| **Ordinal Logistic Regression (Proportional Odds)** | `PROC LOGISTIC` with `DESCENDING` | `MASS::polr()` | `statsmodels.miscmodels.ordinal_model.OrderedModel` |
| **Partial Proportional Odds (Unequal Slopes)** | `PROC LOGISTIC / UNEQUALSLOPES` | `VGAM::vglm(family = cumulative(parallel = FALSE))` | `statsmodels.mnlogit()` (generalized ordered logit) |
| **Confounder Assessment** | Manual model comparison, 10% rule | Nested models, Δβ evaluation | Nested models, Δβ evaluation |
| **Final Model** | Partial proportional odds with unequal slopes for AGE_CAT and SEX_CAT | `vglm()` with non‑parallel terms | `mnlogit()` with non‑parallel terms |

---

# **Key Findings**

- Stroke history **is not significantly associated** with BMI category after adjusting for age and sex.  
- Age category is a **strong predictor** of BMI category.  
- Sex is a **moderate predictor**.  
- Proportional odds assumption fails for age and sex → partial proportional odds model required.  
- Final model uses **unequal slopes for AGE_CAT and SEX_CAT**.

---

# **Why This Project Matters**

This analysis demonstrates:

- Proper handling of complex survey data  
- Correct use of ordinal logistic regression  
- Understanding of proportional odds assumptions  
- Ability to implement the same analysis in SAS, R, and Python  
- Clean, reproducible, professional statistical programming  

It is an excellent demonstration of biostatistical modeling, data cleaning, and cross‑platform reproducibility.

