# This function takes a 2-letter state abbreviation, illness (outcome)
# and rank, and returns the hospital in the state with the specified
# ranking. For example, rankhospital("UT", "heart failure", 5) 
# returns the 5th best hospital in Utah for dealing with heart
# failure. Ranks are calculated using 30-day mortality (lower is better)

rankhospital <- function(state, outcome, num = "best"){
    
    #set working directory
    directory <- "C:/Users/rmadhok/Dropbox (Personal)/Coursera/R_programming/data"
    setwd(directory)
    
    ## read data
    data <- read.csv("outcome-of-care-measures.csv", na.strings = "Not Available")
    
    ## Check that state and outcome are valid
    valid_states <- levels(data[,7])
    valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
    
    if(!state %in% valid_states){
        stop("invalid state")
    }
    if(!outcome %in% valid_outcomes){
        stop("invalid outcome")
    }
    
    ## Return hospital in state with given rank
    # subset state data
    data_state <- data[data$State == state,]
    
    # Find column of outcome specified
    # Switch function does it in less lines than if/else statements
    col <- switch(outcome, "heart attack" = 11, "heart failure" = 17, 
                  "pneumonia" = 23)
    
    # Remove NA's -- this also excludes hospitals with no outcome data
    data_keep <- data_state[complete.cases(data_state[,col]), ]
    
    # Get positions of hospital rank. If tied, sorts on hospital name
    sort <- order(data_keep[,col], data_keep[,2])

    # return values
    if(num == "best"){
        as.character(data_keep[sort[1],2])
    }
    else if(num == "worst"){
        as.character(data_keep[sort[length(sort)], 2])
    }
    else if(num > nrow(data_keep)){
        return("NA")
    }
    else{
        as.character(data_keep[sort[num], 2])
    }
}