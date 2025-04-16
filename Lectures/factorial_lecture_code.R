# Factorial Analyses Lecture Code
# R script created by Jacob Coutts
# PSYC300

# load required packages
library(ggplot2)
library(jtools)
library(effectsize)
library(emmeans)
library(rstatix)

# read in the data set 
lawyer <- read.csv("~/PSYC300-AU24/Lectures/Factorial Research/lawyer2.csv", sep = ",", header = TRUE)
# change predictor to factor data type since it's categorical
lawyer$protest <- as.factor(lawyer$protest)

# describe the data 
summary(lawyer)

# check our model assumptions
# boxplots for categorical predictor and outcome
ggplot(data = lawyer) + 
  geom_boxplot(aes(x = protest, y = eval)) + 
  jtools::theme_apa() + 
  labs(x = "Protest Condition (0 = No, 1 = Ind., 2 = Col.)", y = "Liking")
# scatterplot for continuous predictor and outcome
ggplot(data = lawyer) + 
  geom_point(aes(x = sexism, y = eval)) + 
  jtools::theme_apa() + 
  labs(x = "Perceived Sexism", y = "Liking")

# fit the ANCOVA model
lawyer_mod <- aov(eval ~ sexism * protest, data = lawyer)

# check normality assumption
hist(resid(lawyer_mod))

#extract the results
summary(lawyer_mod) 

# create a multiple series scatterplot to interpret the interaction
ggplot(data = lawyer) + 
  geom_point(aes(x = sexism, y = eval, color = protest )) + 
  geom_smooth(aes(x = sexism, y = eval, color = protest ), method = "lm", se = FALSE) +
  jtools::theme_apa() + 
  labs(x = "Perceived Sexism", y = "Liking")


### end of script