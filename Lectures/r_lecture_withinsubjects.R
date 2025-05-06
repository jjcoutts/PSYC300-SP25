# Within-Subjects Designs Analysis
# PSYC300

# load required packages
library(ggplot2)
library(jtools)

# read in data
drugs <- read.table("drug_data.csv", sep=",",header=TRUE)

# scatterplot of injuries and exhaustion
gf_boxplot(BUY~NAME, data = drugs, xlab = "Drug Name", ylab = "Willingness to Purchase") + theme_apa()

# wrong t-test
t.test(BUY~NAME, data = drugs, var.equal=TRUE)

# proper model
t.test(BUY~NAME, data = drugs, paired=TRUE)



### end of script