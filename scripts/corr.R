corr <- function(directory, threshold = 0){
    directory <- "C:/Users/rmadhok/Dropbox (Personal)/Coursera/R_programming/data/specdata"
    # set wd to directory
    setwd(directory)
    
    # collect all files in vector
    files <- list.files(directory)
    
    # initialize correlation vector
    corr_mtx <- vector('numeric')
    
    # loop through files and append correlation
    for(i in 1:length(files)){
        table <- read.csv(files[i])
        table_nm <- complete.cases(table)
        table_clean <- table[table_nm,]
        nr <- nrow(table_clean)
        if(nr>threshold){
            sulfate <- table_clean[,2]
            nitrate <- table_clean[,3]
            corr_mtx <- append(corr_mtx, cor(sulfate, nitrate))
        }
    }
    
    corr_mtx
}

    