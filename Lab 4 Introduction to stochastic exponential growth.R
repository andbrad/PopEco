# Lab 4: Introduction to stochastic exponential growth

# Install/load the PVA package
devtools::install_github("brucekendall/PVA")
library(PVA)

# Simulate a dataset from the stochastic exponential growth (SEG) model
pop.data <- data.frame(Year = 2000:2010, 
                       Nt = c(1000, simulateSEG(-0.0105, 0.2, 1000, 10)))

# Plot Nt against year
#  1. Is the population growing or declining?
#  2. Does the population appear to be growing/declining exponentially? 
#     HINT: plot Nt on a log scale!

# Use a linear regression of Nt vs. Year to estimate the average trend in 
#   the population.
# Use the confint function to get a 95% CI for the trend estimate

# Use a linear regression of log(Nt) vs. Year to estimate the average trend in 
#   the log abundance



# Come to board and record, for your population:
# a. Final population size
# b. The trend estimate
# c. The 95% CI of the trend estimate
# d. Estimated trend in log abundance