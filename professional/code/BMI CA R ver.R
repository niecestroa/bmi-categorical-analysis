#====================================================================
#  PROJECT: NHIS 2018 – BMI & Stroke Ordinal Logistic Analysis
#  AUTHOR:  Aaron Niecestro
#  EDITTED: February 12, 2026
#  PURPOSE: Clean NHIS data, create categorical variables, apply
#           inclusion/exclusion criteria, and run ordinal logistic
#           and partial proportional odds models.
#====================================================================

library(dplyr)
library(janitor)
library(MASS)       # polr()
library(ordinal)    # clm()
library(VGAM)       # vglm() for partial proportional odds
library(gmodels)    # CrossTable()


#--------------------------------------------------------------------
# SECTION 1 — Load Data
#--------------------------------------------------------------------

samadult <- read.csv("SAMADULT_2018.csv")   # adjust path as needed


#--------------------------------------------------------------------
# SECTION 2 — Create Derived Variables + Apply Inclusion Criteria
#--------------------------------------------------------------------

samadult2 <- samadult %>%
  
  # BMI categories
  mutate(
    BMI_CAT = case_when(
      BMI < 18.5 ~ NA_character_,        # remove underweight
      BMI >= 18.5 & BMI < 25 ~ "1 Normal",
      BMI >= 25   & BMI < 30 ~ "2 Overweight",
      BMI >= 30   & BMI < 40 ~ "3 Moderately Obese",
      BMI >= 40   & BMI <= 80 ~ "4 Severely Obese",
      BMI > 80 ~ NA_character_
    )
  ) %>%
  filter(!is.na(BMI_CAT)) %>%
  
  # Stroke category
  mutate(
    STROKE_CAT = case_when(
      STREV == 1 ~ "1 Yes",
      STREV == 2 ~ "2 No",
      TRUE ~ NA_character_
    )
  ) %>%
  filter(!is.na(STROKE_CAT)) %>%
  
  # Age category
  filter(AGE_P >= 40) %>%
  mutate(
    AGE_CAT = case_when(
      AGE_P < 50 ~ "1 AGE=40-49",
      AGE_P < 60 ~ "2 AGE=50-59",
      AGE_P < 70 ~ "3 AGE=60-69",
      AGE_P < 80 ~ "4 AGE=70-79",
      AGE_P >= 80 ~ "5 AGE=80+"
    )
  ) %>%
  
  # Sex category
  mutate(
    SEX_CAT = case_when(
      SEX == 1 ~ "1 Male",
      SEX == 2 ~ "2 female",
      TRUE ~ NA_character_
    )
  ) %>%
  filter(!is.na(SEX_CAT)) %>%
  
  # Weight-related variables
  mutate(
    WEIGHT_STROKE = case_when(
      AFLHCA8 == 1 ~ "1 Yes",
      AFLHCA8 == 2 ~ "2 No",
      TRUE ~ NA_character_
    ),
    WEIGHT_ACTIVE = case_when(
      AFLHCA18 == 1 ~ "1 Yes",
      AFLHCA18 == 2 ~ "2 No",
      TRUE ~ NA_character_
    ),
    WEIGHT_AGE = case_when(
      AFLHC32_ == 1 ~ "1 Yes",
      AFLHC32_ == 2 ~ "2 No",
      TRUE ~ NA_character_
    )
  ) %>%
  filter(!is.na(WEIGHT_STROKE),
         !is.na(WEIGHT_ACTIVE),
         !is.na(WEIGHT_AGE)) %>%
  
  # Marital status filter
  filter(R_MARITL != 9) %>%
  
  # Race filter
  filter(!MRACBPI2 %in% c(16,17)) %>%
  
  # Remove remaining missing values
  drop_na(BMI_CAT, STROKE_CAT, AGE_P, R_MARITL,
          AFLHCA8, AFLHCA18, AFLHC32_, MRACBPI2, SEX)


#--------------------------------------------------------------------
# SECTION 3 — Descriptive Statistics
#--------------------------------------------------------------------

tabyl(samadult2, BMI_CAT)
tabyl(samadult2, STROKE_CAT)

samadult2 %>% group_by(BMI_CAT) %>% summarise(mean_BMI = mean(BMI))
samadult2 %>% group_by(AGE_CAT) %>% summarise(mean_age = mean(AGE_P))


#--------------------------------------------------------------------
# SECTION 4 — Confounder Screening (Table 1 & 2)
#--------------------------------------------------------------------

CrossTable(samadult2$WEIGHT_STROKE, samadult2$STROKE_CAT, chisq = TRUE)
CrossTable(samadult2$STROKE_CAT, samadult2$BMI_CAT, chisq = TRUE)


#--------------------------------------------------------------------
# SECTION 5 — Proportional Odds Model (polr)
#--------------------------------------------------------------------

samadult2$BMI_CAT <- factor(samadult2$BMI_CAT, ordered = TRUE)

model1 <- polr(BMI_CAT ~ STROKE_CAT, data = samadult2, Hess = TRUE)
summary(model1)


#--------------------------------------------------------------------
# SECTION 6 — Confounder Models
#--------------------------------------------------------------------

model_sex <- polr(BMI_CAT ~ STROKE_CAT + SEX_CAT, data = samadult2, Hess = TRUE)
model_age <- polr(BMI_CAT ~ STROKE_CAT + AGE_CAT, data = samadult2, Hess = TRUE)


#--------------------------------------------------------------------
# SECTION 7 — Partial Proportional Odds (Unequal Slopes)
#--------------------------------------------------------------------

# Allow non-parallel slopes for AGE_CAT and SEX_CAT
ppo_model <- vglm(
  BMI_CAT ~ STROKE_CAT + AGE_CAT + SEX_CAT,
  family = cumulative(parallel = FALSE),
  data = samadult2
)

summary(ppo_model)


#--------------------------------------------------------------------
# SECTION 8 — Final Model (Your chosen model)
#--------------------------------------------------------------------

final_model <- vglm(
  BMI_CAT ~ STROKE_CAT + AGE_CAT + SEX_CAT,
  family = cumulative(parallel = FALSE ~ AGE_CAT + SEX_CAT),
  data = samadult2
)

summary(final_model)
