# Correlational analysis lecture code
# R script created by Jacob J. Coutts
# PSYC300 

# load required packages ggplot 2 and jtools
library()
library()

# read in dataset 
bl <- read.table()

# generate descriptive statistics
summary()

# visualize the data
ggplot(data = bl, aes(x = as.factor(binladen), y = mcivil)) +
  geom_boxplot() + 
  labs(x = "Condition (0 = Before Death, 1 = After Death", y = "Restriction of Civil Liberties") + 
  jtools::theme_apa()

# run the analysis between the binladen and mcivil variables
cor.test()

# exploratory data analysis
ggplot(data = bl, aes(x = as.factor(binladen), y = stereo)) +
  geom_boxplot() + 
  labs(x = "Condition (0 = Before Death, 1 = After Death", y = "Stereotype Endorsement") + 
  jtools::theme_apa()
cor.test(bl$binladen, bl$stereo)

ggplot(data = bl, aes(x = mcivil, y = stereo)) +
  geom_point() + 
  geom_jitter() + 
  labs(x = "Restriction of Civil Liberties", y = "Stereotype Endorsement") + 
  jtools::theme_apa()

# run the correlation between the mcivil and stereo variables
cor.test()



### end of script