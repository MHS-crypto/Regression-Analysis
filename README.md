# Berkeley Guidance Study and Cruise Ship Data Analyses

## Berkeley Guidance Study Analysis

### Overview

This repository includes analyses of two datasets: the Berkeley Guidance Study, focusing on the longitudinal monitoring of girls born in Berkeley, California, and cruise ship data, aiming to predict the number of crew members based on various ship characteristics. Each analysis is detailed in separate sections below.

## Berkeley Guidance Study Analysis

### Overview

The Berkeley Guidance Study analyzed data from a longitudinal study of girls born in Berkeley between January 1928 and June 1929, tracking them for at least 18 years. The analysis primarily involved regression modeling and hypothesis testing.

### Analysis Sections

#### Part A: Multiple Regression Model

- Fitting a multiple regression model and extracting parameter estimates.

#### Part B: Hypothesis Testing for Age 2 Predictors

- Testing the necessity of age 2 predictors using ANOVA with full and reduced models.

#### Part C: Hypothesis Testing for HT9 Alone

- Testing the hypothesis that HT9 alone explains variability in HT18 using ANOVA.

#### Part D: Confidence Interval for β2 − β4

- Computing a 95% confidence interval for the difference β2 − β4 using a T-test.

#### Part E: Significance of HT2 After Adjusting for WT2

- Determining the significance of HT2 after adjusting for WT2 using p-values.

### Conclusion

The Berkeley Guidance Study analysis involved assessing variable suitability, hypothesis testing, and model comparisons. ANOVA results, T-tests, and p-values were utilized to draw conclusions about the significance of predictors in the presence of others.

## Cruise Ship Data Analysis

### Overview

The cruise ship data analysis aimed to predict the number of crew members based on ship characteristics.

### Analysis Sections

#### Part A: Exploratory Data Analysis

- Utilizing a scatterplot matrix to identify relationships between crew and various ship characteristics.
- Generating individual histograms to identify skewed predictors.
- Analyzing the correlation matrix to identify relationships between variables.

#### Part B: Model Selection

- Employing backward elimination to identify and retain significant predictors.

#### Part C: Diagnostics and Problematic Observations

- Using QQ-plots, residuals vs. fitted model, and Cook's distance for diagnostics.
- Identifying influential observations and potential issues.

#### Part D: Robust Regression

- Applying robust regression to handle outliers and influential observations.

### Conclusion

The cruise ship data analysis employed a comprehensive approach, including exploratory analysis, model selection, diagnostics, and robust regression. The methodologies used enhanced the understanding of relationships between predictors and improved the model's robustness.

## Combined Summary

In summary, these analyses showcased the application of regression modeling, hypothesis testing, exploratory data analysis, and robust regression techniques across diverse datasets. The methodologies employed in each analysis contribute to a comprehensive understanding of relationships between variables and informed model selection.
