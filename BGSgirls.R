BGS <- read.table('BGSgirls.txt', header = T)

head(BGS)

# part a
model <- lm(BGS$Ht18 ~ BGS$Wt2 + BGS$Ht2 + BGS$Wt9 + BGS$Ht9 + BGS$Lg9 + BGS$St9)

model$coef # Least Squares estimates for regression coefficients
# Ht18=4.68357700+0.34647879⋅Wt2+0.10665088⋅Ht2−0.48533126⋅Wt9+1.19856585⋅Ht9+0.20721233⋅Lg9−0.07040544⋅St9


summary_info <- summary(model)
standard_errors <- summary_info$coefficients[, "Std. Error"]
standard_errors


#(Intercept)     BGS$Wt2     BGS$Ht2     BGS$Wt9     BGS$Ht9     BGS$Lg9  BGS$St9
#15.92247474  0.42839704  0.20395791  0.20656122  0.15438483  0.39517032  0.03443194
 

# part b
full_model <- lm(Ht18 ~ Wt2 + Ht2 + Wt9 + Ht9 + Lg9 + St9, data = BGS)

reduced_model <- lm(Ht18 ~ Wt9 + Ht9 + Lg9 + St9, data = BGS)

anova_result <- anova(full_model, reduced_model)

print(anova_result)

#Analysis of Variance Table

#Model 1: Ht18 ~ Wt2 + Ht2 + Wt9 + Ht9 + Lg9 + St9
#Model 2: Ht18 ~ Wt9 + Ht9 + Lg9 + St9
#Res.Df    RSS Df Sum of Sq      F Pr(>F)
#1     63 675.36                           
#2     65 693.52 -2   -18.153 0.8467 0.4336

# As p value 0.4336 is larger and not significant for the full model 
# We can conclude that the reduced model without the terms Wt2, Ht2 work as good as the full model
# So we should not reject the null hypothesis


# part c
reduce_model <- lm(Ht18 ~ Ht9, data=BGS)
anova_result1 <- anova(full_model, reduce_model)
print(anova_result1)

#Model 1: Ht18 ~ Wt2 + Ht2 + Wt9 + Ht9 + Lg9 + St9
#Model 2: Ht18 ~ Ht9
#Res.Df    RSS Df Sum of Sq      F   Pr(>F)   
#1     63 675.36                                
#2     68 884.73 -5   -209.37 3.9061 0.003793 **

# As p value 0.003793 is significant for the full model.
# We reject the null hypothesis that HT9 alone is sufficient to explain the variability in HT18.


# part d
SE_beta2 <- 0.2039579   # from part a
SE_beta4 <- 0.20656122  # from part a

mse <- mean(residuals(model)^2)

SE_difference <- sqrt (mse)*(SE_beta2^2 + SE_beta4^2) 

# 63 is the df for the full model

t_test_value <- qt(0.975, 63)

margin_of_error <- t_test_value * SE_difference
margin_of_error

# Calculate the confidence interval
beta2_minus_beta4 <- model$coef["BGS$Ht2"] - model$coef["BGS$Ht9"]
confidence_interval <- c(beta2_minus_beta4 - margin_of_error, beta2_minus_beta4 + margin_of_error)


cat("95% Confidence Interval for (β2 - β4):", confidence_interval[1],confidence_interval[2]) # Print the confidence interval using the print function


#beta2_minus_beta4
#X0 = c(0,0,1,0,-1,0,0)
#X.mat = cbind(rep(1,nrow(BGS)),BGS$Wt2, BGS$Ht2, BGS$Wt9, BGS$Ht9, BGS$Lg9, BGS$St9)
#mse <- mean(residuals(model)^2)
#mse * solve( t(X.mat)%*% X.mat)

#CI <- beta2_minus_beta4 + qt(0.975, 63) * sqrt(mse * 0.018130247 )
#CI #-0.2561369 

# part e
adjusted_model <- lm(Ht18 ~ Wt2 + Ht2, data = BGS)

summary(adjusted_model)

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  62.4852    15.7471   3.968 0.000179 ***
#  Wt2           0.1224     0.4874   0.251 0.802469    
#Ht2           1.1746     0.2180   5.388 9.91e-07 ***
#  ---
#  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

# As the P value = 9.91e-07 *** is extremely significant for Ht2 so Ht2 is a significant variable after adjusting Wt2