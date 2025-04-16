# Factorial Analyses Lecture Code
# R script created by Jacob Coutts
# PSYC300

# load required packages
library(ggplot2)
library(jtools)
library(interactions)

# read in the data set 
injuries <- read.csv("~/PSYC300-AU24/Lectures/Mediation and Moderation/injuries.csv", sep = ",", header = TRUE)

# describe the data 
summary(injuries)

# research question - Does exhaustion increase injuries? 
# visualize effect 
ggplot(data = injuries) + 
  geom_point(aes(x = exhaust, y = injury)) + 
  jtools::theme_apa() + 
  labs(x = "Exhaustion", y = "Injuries") + 
  geom_smooth(aes(x = exhaust, y = injury), method = "lm", color = "red", se = FALSE) # add line of best fit

# test relationship with regression
simp_mod <- lm(injury ~ exhaust, data = injuries)
summary(simp_mod)

# multiple regression where safety shortcuts and exhaustion are predictors
mult_mod <- lm(injury ~ exhaust + safety, data = injuries)
summary(mult_mod)

# moderation analysis
# Research question - Does exhaustion cause safety shortcuts to increase? And is this moderated by tenure? 
mod_model <- lm(safety ~ exhaust*tenure, data = injuries)
summary(mod_model)

# visualize interaction using outside library, though note it's not quite publication quality, this is for convenience
# NOTE: You may need to install packages
interactions::interact_plot(mod_model, pred = "exhaust", modx = "tenure", interval = FALSE, vary.lty= FALSE, colors = c("red","blue4","green")) + theme(panel.grid.major = element_blank(), panel.border = element_rect(colour = "black", fill=NA))
?interact_plot

# mediation analysis 
# Research question - Does safety shortcuts mediate the relationship between exhaustion and injuries? 

# total effect - c path - we already calculated in the first simple regression model above 

# a path - relationship between predictor and mediator 
ggplot(data = injuries) + 
  geom_point(aes(x = Exaustion, y = eval)) + 
  jtools::theme_apa() + 
  labs(x = "Perceived Sexism", y = "Liking")

# fit the model
a_mod <- lm(safety ~ exhaust, data = injuries)
summary(a_mod) # extract the results

# b-ish path - relationship between mediator and outcome
ggplot(data = injuries) + 
  geom_point(aes(x = sexism, y = eval)) + 
  jtools::theme_apa() + 
  labs(x = "Perceived Sexism", y = "Liking")

# fit the model for b path and c prime - the direct effect
bcp_mod <- lm(injury ~ exhaust + safety, data = injuries)
summary(bcp_mod) # extract the results

# since a and b are significant, M mediates this relationship by way of the joint test



### end of script