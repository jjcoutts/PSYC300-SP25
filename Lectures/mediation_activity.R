# Mediation activity code
# PSYC300

# read in the data
med_data = read.csv("~/PSYC300-SP25/Lectures/mediation_data.csv")
med_data$side_room = med_data$side_room - 1

# load required packages
library(ggplot2) # visualize data
library(jtools) # creat APA figures

# summarize the data
summary(med_data)
str(med_data) # structure similar to global environment

# analysis
cpath = lm(words ~ side_room, data = med_data) # total effect
summary(cpath) # total effect is significant. Imagery group recalled more words

apath = lm(imagery ~ side_room, data = med_data) # a path 
summary(apath) # a path is significant

bcpath = lm(words ~ imagery + side_room, data = med_data) # b and c prime (direct effect)
summary(bcpath) # b path is significant, so is direct effect

# conclusions
# it looks like the indirect effect through imagery is significant. Instructions caused people to use more imagery, which in turn cause them to recall more words. This is an illustration of deep processing theory. 



### End of script