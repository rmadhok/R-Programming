# This function takes an 2-letter state abbreviation and an illness,
# and returns the best hospital in that state for the specified 
# illness. "Best" refers to the hospital with the lowest 30-day
# mortality for that illness.

best <- function(state, outcome){
    
    # set wd
    directory <- "C:/Users/rmadhok/Dropbox (Personal)/Coursera/R_programming/data"
    setwd(directory)
    
    ## read data
    data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
    
    ## Check that state and outcome are valid
    valid_states <- unique(data[,7])
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    if(!state %in% valid_states){
        stop("invalid state")
    }
    if(!outcome %in% valid_outcomes){
        stop("invalid outcome")
    }
    
    ## Return hospital name in state with lowest mortality
    # Subset state data
    data_state <- data[data$State == state,]
    
    # Find column of outcome specified
    # Switch function does it in less lines than if/else statements
    col <- switch(outcome, "heart attack" = 11, "heart failure" = 17, 
                  "pneumonia" = 23)
    
    # Remove NA's -- this also excludes hospitals with no outcome data
    data_keep <- data_state[complete.cases(data_state[,col]), ]
    
    # Get row(s) with minimum mortality in state for outcome
    min_mortality <- min(data_keep[,col])
    rows_keep <- data_keep[data_keep[,col] == min_mortality,]
    hospitals <- rows_keep[, 2]
    
    # If there is a tie, return first hospital sorted alphabeitcally
    if(length(hospitals) > 1){
        sort <- sort(hospitals)
        as.character(sort[1])
    }
    else{
        as.character(hospitals)
    }
}