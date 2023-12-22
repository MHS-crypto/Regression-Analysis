cruise <-read.fwf("cruise.txt",width=c(20,20,rep(8,7)),col.names=c("ship","cline","age","tonnage","passengers","length","cabins","passdens","crew"))

attach(cruise)

head(cruise)

plot(cruise[3:9]) #scaterplot matrix

hist(crew, main="Histogram of Crew Size", xlab="Crew Size", col=1)
hist(age, main="Histogram of Age", xlab="Age (2013 Year Built)", col=2)
hist(tonnage, main="Histogram of tonnage", xlab="Tonnage (1000s of Tons)", col=3)
hist(passengers, main="Histogram of Passengers", xlab="Passengers(100s)", col=4)
hist(length, main="Histogram of Length", xlab="Length (100s of feet) ", col=5)
hist(cabins, main="Histogram of Cabins", xlab="Cabins (100s) ", col=6)
hist(passdens, main="Histogram of Passenger Density", xlab="Passenger Density (Passengers/Space)", col=7)


cor(cruise[, c("age", "tonnage", "passengers", "length", "cabins", "passdens", "crew")])
pairs(crew ~ age + tonnage + passengers + length + cabins + passdens)


# The number of crew members on a cruise ship tends to increase as the ship's size (tonnage), the number of passengers, the ship's length, and the number of cabins increase. In simpler terms, larger ships with more passengers, longer lengths, and more cabins typically require a larger crew to operate effectively.
# there also seam to be a high correlation between passengers & cabins

par(mfrow = c(1, 1))
model = lm(crew ~ age + tonnage + passengers + length + cabins + passdens)
plot(model)

# The curve should be flat which is not seen here in the graph
# There are outliers identified at some points.

pairs(crew ~ age + tonnage + passengers + length + cabins + passdens)


install.packages("moments")

library(moments)

# age seems to be skewed so we will perform transformation 
# we will perform log transformation
transformed_age <- log(cruise$age)
skewness(cruise$length)



library(MASS)

fit <- lm(crew ~ transformed_age + tonnage + passengers + length + cabins + passdens)

# step wise regression
step_wise <- stepAIC(fit, direction="both")
step_wise$anova

# The following model was obtained having the lowest AIC value
# crew ~ tonnage + passengers + length + cabins


# backward elimination
backward <- step(fit, direction = 'backward')
backward$anova

# The same model is pbtained at the end
# crew ~ tonnage + passengers + length + cabins

# part c

red_model <- lm(crew ~tonnage + passengers + length + cabins)
r_model = lm(crew ~ age + tonnage + length + cabins + passdens)

plot(red_model)


model2 = lm(crew ~  tonnage + passengers + length + cabins)
summary(model2)


final_model = lm(crew ~  tonnage + passengers + length + cabins)
plot(final_model)


I = influence.measures(final_model)
summary(I)
str(I)
cook = I$infmat[,"dffit"]
plot(cook,type="h",lwd=3,col="red", ylab = "Cook’s Distance")


boxcox(lm(age ~ crew, cruise), plotit=T) 
plot(age, crew)
plot(log(age), crew)


install.packages("robustbase")

library(robustbase)

ols_model <- lm(crew ~ tonnage + passengers + length + cabins)
robust_model <- lmrob(crew ~ tonnage + passengers + length + cabins)

summary(ols_model)
summary(robust_model)


# Compare R-squared values
rsquared_ols <- summary(ols_model)$r.squared
rsquared_robust <- summary(robust_model)$r.squared

# Compare residual standard errors
residual_std_ols <- summary(ols_model)$sigma
residual_std_robust <- summary(robust_model)$s

