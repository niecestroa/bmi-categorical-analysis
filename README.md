# **Academic‑to‑Professional Journey**

This project represents the evolution of my analytical workflow from **academic coursework** to a **professional‑grade, reproducible, cross‑platform analysis pipeline**. What began as a traditional SAS assignment in a graduate biostatistics course has been transformed into a fully modern, multi‑language, production‑ready project demonstrating:

- **Rigorous statistical reasoning**  
- **Clean, validated data engineering**  
- **Cross‑language reproducibility (SAS -> R -> Python)**  
- **Professional documentation and workflow design**  
- **Industry‑aligned modeling practices**  

The goal was not only to answer a research question, but to demonstrate the ability to **translate academic methods into professional analytical systems** that are transparent, reproducible, and extensible.

---

# **Abstract**

**Background:**  
Body mass index (BMI) is a key indicator of obesity‑related health risk, and stroke remains a major contributor to morbidity among U.S. adults. Understanding whether stroke history is associated with higher BMI categories may provide insight into functional limitations, chronic disease burden, and health disparities. Using nationally representative data from the 2018 National Health Interview Survey (NHIS), this study evaluates the association between stroke history and BMI category among adults aged 40 years and older.

**Methods:**  
Respondents were restricted to adults aged ≥40 with valid BMI, stroke history, race, marital status, and weight‑related functional limitation responses. BMI was categorized into four ordered levels (Normal, Overweight, Moderately Obese, Severely Obese). Stroke history served as the primary predictor. Covariates included age category, sex, and three weight‑related functional limitation indicators. Ordinal logistic regression was used to estimate associations, with proportional odds assumptions evaluated and partial proportional odds models fitted when necessary. Confounders were assessed using statistical significance, clinical relevance, and the 10% change‑in‑estimate rule.

**Results:**  
Stroke history was not significantly associated with BMI category in proportional odds or partial proportional odds models. Age category and sex were strong predictors of BMI category and violated the proportional odds assumption, requiring a partial proportional odds model. The final model allowed unequal slopes for age and sex, improving model fit. Stroke remained non‑significant after adjustment.

**Conclusions:**  
Among U.S. adults aged 40 and older, stroke history was not independently associated with BMI category after adjusting for demographic and functional factors. Age and sex were the strongest predictors of BMI category, and their effects varied across BMI levels. These findings highlight the importance of demographic characteristics in obesity research and demonstrate the value of flexible ordinal modeling approaches in public health analytics.

---

## **Academic Foundation**

The original analysis was developed in SAS as part of a graduate‑level categorical data analysis course. The academic objectives included:

- Constructing ordinal response variables  
- Applying proportional odds logistic regression  
- Testing proportional odds assumptions  
- Fitting partial proportional odds models  
- Evaluating confounders using the 10% change‑in‑estimate rule  
- Interpreting model coefficients in a public health context  

These foundations shaped the statistical logic of the project.

---

## **Professional Transformation**

To elevate the work beyond a classroom assignment, the project was redesigned with professional standards in mind:

### **1. Clean, Modular Code Architecture**
The analysis was restructured into a clear, modular pipeline:

```
Data Cleaning -> Variable Engineering -> Descriptive Statistics -> 
Confounder Assessment -> Ordinal Modeling -> Partial Proportional Odds -> Final Model
```

Each step is documented, reproducible, and language‑agnostic.

### **2. Cross‑Platform Reproducibility**
The entire workflow was implemented in:

- **SAS** (original academic implementation)  
- **R** (tidyverse + MASS + VGAM)  
- **Python** (pandas + statsmodels + scipy)  

This demonstrates the ability to translate statistical logic across ecosystems — a key professional skill in biostatistics and data science.

### **3. Professional Documentation**
The project includes:

- A polished README  
- A formal abstract  
- A clear inclusion/exclusion flow  
- A structured explanation of modeling decisions  
- A comparison table of SAS/R/Python implementations  

This mirrors the documentation standards used in clinical research, regulatory submissions, and industry analytics.

### **4. Industry‑Aligned Modeling Practices**
The analysis applies:

- Proportional odds logistic regression  
- Partial proportional odds (generalized ordered logit)  
- Likelihood ratio testing  
- Confounder evaluation  
- Sensitivity analyses  

These are the same methods used in epidemiology, health outcomes research, and clinical trial analytics.

---

# **Skills Gained**

This project strengthened a broad set of analytical, statistical, and professional competencies, including:

### **Statistical Modeling**
- Ordinal logistic regression (proportional odds)
- Partial proportional odds / generalized ordered logit
- Confounder assessment using the 10% change‑in‑estimate rule
- Likelihood ratio testing and model comparison
- Interpretation of ordinal model coefficients

### **Data Engineering**
- Complex variable recoding and categorical construction
- Rigorous inclusion/exclusion criteria
- Handling survey‑style health data
- Ensuring complete‑case analysis and reproducibility

### **Cross‑Platform Programming**
- SAS DATA step engineering and PROC LOGISTIC modeling
- R implementation using `dplyr`, `polr()`, and `vglm()`
- Python implementation using `pandas`, `OrderedModel`, and `statsmodels`
- Ensuring consistent results across three languages

### **Professional Workflow Development**
- Modular, readable code architecture
- Clear documentation and version control
- Creation of a polished, portfolio‑ready README
- Translation of academic methods into industry‑aligned pipelines

### **Communication & Reporting**
- Writing a professional abstract
- Documenting modeling decisions
- Presenting results clearly for technical and non‑technical audiences

---

# **Lessons Learned**

This project provided several key insights that shaped my growth as a biostatistician and data scientist:

### **1. Clean data engineering is the foundation of valid modeling.**  
The NHIS dataset required extensive recoding, filtering, and validation. I learned that careful data preparation often determines the success of the entire analysis.

### **2. Statistical assumptions matter as much as the model itself.**  
The proportional odds assumption failed for age and sex — and ignoring that would have produced misleading results. This reinforced the importance of diagnostic testing and flexible modeling.

### **3. Cross‑language reproducibility builds confidence and credibility.**  
Re‑implementing the entire pipeline in SAS, R, and Python strengthened my understanding of the underlying statistical concepts and demonstrated professional versatility.

### **4. Documentation transforms analysis into communication.**  
A well‑structured README, clear comments, and a polished abstract turn code into a professional deliverable that others can understand, trust, and build upon.

### **5. Academic work becomes professional work through structure and clarity.**  
The transition from a homework assignment to a portfolio‑ready project required rethinking the workflow, improving code quality, and presenting results with intention.

---

## **Why This Journey Matters**

This project demonstrates the ability to:

- Start with an academic problem  
- Apply rigorous statistical methodology  
- Engineer clean, validated datasets  
- Build reproducible pipelines in multiple languages  
- Document the analysis professionally  
- Communicate results clearly and effectively  

It reflects the transition from **student‑level coding** to **professional analytical practice**, showcasing both technical depth and communication skills.

---

## **Summary**

This repository is more than a homework assignment — it is a **portfolio‑quality demonstration** of:

- Statistical modeling expertise  
- Cross‑platform programming  
- Clean code architecture  
- Professional documentation  
- Reproducible research principles  

It represents the kind of work expected in **biostatistics, data science, clinical research, and public health analytics**.

---

# ** Professional Project Introduction (LinkedIn / Portfolio)**

Here is a polished introduction you can paste directly into LinkedIn, your portfolio, or your GitHub project description:

---

### **BMI & Stroke Ordinal Logistic Regression — NHIS 2018 (SAS, R, Python)**  
I completed a full categorical data analysis using the 2018 National Health Interview Survey (NHIS) to evaluate whether stroke history is associated with BMI category among adults aged 40+. What began as a graduate‑level SAS assignment evolved into a fully professional, cross‑platform analytical pipeline implemented in **SAS**, **R**, and **Python**.

The project includes:

- Rigorous data cleaning and variable engineering  
- Proportional and partial proportional odds modeling  
- Confounder assessment using statistical and epidemiologic criteria  
- Cross‑language reproducibility  
- A polished, publication‑ready README and abstract  

This work demonstrates my ability to translate academic statistical methods into **clean, reproducible, industry‑aligned analytical workflows** suitable for biostatistics, clinical research, and public health analytics.

