# This function takes an illness and a rank, and returns a 
# data frame with the hospital in each state with the specified ranking
# for the outcome. For example, rankall("heart attack", 2) returns 
# the second best (second lowest mortality) hospital in each state.

rankall <- function(outcome, num = "best"){
    
    #set working directory
    directory <- "C:/Users/rmadhok/Dropbox (Personal)/Coursera/R_programming/data"
    setwd(directory)
    
    ## read data
    data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
    
    # create list of states
    state <- unique(data[,7])
    
    # initialize vector for hospitals
    hospital <- vector()
    
    # For each state, find hospital of given rank
    for(i in seq(state)){
        hospital[i] <- rankhospital(state[i], outcome, num)
        
    }
    data.frame(hospital, state)
}