complete <- function(directory, id = 1:332){
    directory <- "C:/Users/rmadhok/Dropbox (Personal)/Coursera/R_programming/data/specdata"
    # set wd to directory
    setwd(directory)
    
    # collect all files in character vector
    allFiles <- list.files(directory)
    
    # initialize empty data frames
    complete_cases <- data.frame()
    
    # make df with file and num obs
    for(id in id){
        raw_data <- read.csv(allFiles[id])
        nobs <- sum(complete.cases(raw_data))
        data_nm <- cbind(id, nobs)
        complete_cases <- rbind(complete_cases, data_nm)
    }
    
    complete_cases
}