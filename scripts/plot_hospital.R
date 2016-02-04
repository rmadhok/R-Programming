directory <- "C:/Users/rmadhok/Dropbox (Personal)/Coursera/R_programming/data"

# Set wd
setwd(directory)

# read data
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

# convert column 11 (mortality) to numeric
outcome[,11] <- as.numeric(outcome[, 11])

# plot histogram of mortality
hist(outcome[, 11])

