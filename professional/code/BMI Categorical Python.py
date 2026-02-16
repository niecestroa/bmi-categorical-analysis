#====================================================================
#  PROJECT: NHIS 2018 – BMI & Stroke Ordinal Logistic Analysis
#  AUTHOR:  Aaron Niecestro
#  EDITTED: February 13, 2026
#  PURPOSE: Clean NHIS data, create categorical variables, apply
#           inclusion/exclusion criteria, and run ordinal logistic
#           and partial proportional odds models.
#====================================================================

import pandas as pd
import numpy as np
from scipy.stats import chi2_contingency
import statsmodels.api as sm
from statsmodels.miscmodels.ordinal_model import OrderedModel


#--------------------------------------------------------------------
# SECTION 1 — Load Data
#--------------------------------------------------------------------

df = pd.read_csv("SAMADULT_2018.csv")   # adjust path as needed


#--------------------------------------------------------------------
# SECTION 2 — Create Derived Variables + Apply Inclusion Criteria
#--------------------------------------------------------------------

# BMI categories
df["BMI_CAT"] = np.select(
    [
        (df["BMI"] >= 18.5) & (df["BMI"] < 25),
        (df["BMI"] >= 25)   & (df["BMI"] < 30),
        (df["BMI"] >= 30)   & (df["BMI"] < 40),
        (df["BMI"] >= 40)   & (df["BMI"] <= 80)
    ],
    [
        "1 Normal",
        "2 Overweight",
        "3 Moderately Obese",
        "4 Severely Obese"
    ],
    default=np.nan
)

df = df[df["BMI_CAT"].notna()]

# Stroke category
df["STROKE_CAT"] = df["STREV"].map({1: "1 Yes", 2: "2 No"})
df = df[df["STROKE_CAT"].notna()]

# Age category
df = df[df["AGE_P"] >= 40]
df["AGE_CAT"] = pd.cut(
    df["AGE_P"],
    bins=[40,50,60,70,80,200],
    labels=[
        "1 AGE=40-49",
        "2 AGE=50-59",
        "3 AGE=60-69",
        "4 AGE=70-79",
        "5 AGE=80+"
    ],
    right=False
)

# Sex category
df["SEX_CAT"] = df["SEX"].map({1: "1 Male", 2: "2 female"})
df = df[df["SEX_CAT"].notna()]

# Weight-related variables
df["WEIGHT_STROKE"] = df["AFLHCA8"].map({1: "1 Yes", 2: "2 No"})
df["WEIGHT_ACTIVE"] = df["AFLHCA18"].map({1: "1 Yes", 2: "2 No"})
df["WEIGHT_AGE"]    = df["AFLHC32_"].map({1: "1 Yes", 2: "2 No"})

df = df[
    df["WEIGHT_STROKE"].notna() &
    df["WEIGHT_ACTIVE"].notna() &
    df["WEIGHT_AGE"].notna()
]

# Marital status filter
df = df[df["R_MARITL"] != 9]

# Race filter
df = df[~df["MRACBPI2"].isin([16,17])]

# Remove remaining missing values
df = df.dropna(subset=[
    "BMI_CAT","STROKE_CAT","AGE_P","R_MARITL",
    "AFLHCA8","AFLHCA18","AFLHC32_","MRACBPI2","SEX"
])


#--------------------------------------------------------------------
# SECTION 3 — Descriptive Statistics
#--------------------------------------------------------------------

print(df["BMI_CAT"].value_counts())
print(df["STROKE_CAT"].value_counts())

print(df.groupby("BMI_CAT")["BMI"].mean())
print(df.groupby("AGE_CAT")["AGE_P"].mean())


#--------------------------------------------------------------------
# SECTION 4 — Confounder Screening (Chi-square tests)
#--------------------------------------------------------------------

def chi_square(var1, var2):
    table = pd.crosstab(df[var1], df[var2])
    chi2, p, dof, expected = chi2_contingency(table)
    print(f"\nChi-square test: {var1} vs {var2}")
    print(table)
    print(f"p-value = {p}")

chi_square("WEIGHT_STROKE", "STROKE_CAT")
chi_square("STROKE_CAT", "BMI_CAT")
chi_square("AGE_CAT", "BMI_CAT")


#--------------------------------------------------------------------
# SECTION 5 — Proportional Odds Model (Ordered Logistic)
#--------------------------------------------------------------------

df["BMI_CAT_ord"] = df["BMI_CAT"].astype("category").cat.codes

model1 = OrderedModel(
    df["BMI_CAT_ord"],
    pd.get_dummies(df["STROKE_CAT"], drop_first=True),
    distr="logit"
).fit(method="bfgs")

print(model1.summary())


#--------------------------------------------------------------------
# SECTION 6 — Confounder Models
#--------------------------------------------------------------------

model_sex = OrderedModel(
    df["BMI_CAT_ord"],
    pd.get_dummies(df[["STROKE_CAT","SEX_CAT"]], drop_first=True),
    distr="logit"
).fit(method="bfgs")

print(model_sex.summary())

model_age = OrderedModel(
    df["BMI_CAT_ord"],
    pd.get_dummies(df[["STROKE_CAT","AGE_CAT"]], drop_first=True),
    distr="logit"
).fit(method="bfgs")

print(model_age.summary())


#--------------------------------------------------------------------
# SECTION 7 — Partial Proportional Odds (Unequal Slopes)
#--------------------------------------------------------------------

# statsmodels generalized ordered logit
import statsmodels.formula.api as smf

# Convert categories to numeric for formula interface
df["BMI_CAT_num"] = df["BMI_CAT_ord"]

ppo_model = smf.mnlogit(
    "BMI_CAT_num ~ STROKE_CAT + AGE_CAT + SEX_CAT",
    data=df
).fit()

print(ppo_model.summary())


#--------------------------------------------------------------------
# SECTION 8 — Final Model (Your chosen model)
#--------------------------------------------------------------------

final_model = smf.mnlogit(
    "BMI_CAT_num ~ STROKE_CAT + AGE_CAT + SEX_CAT",
    data=df
).fit()

print(final_model.summary())
