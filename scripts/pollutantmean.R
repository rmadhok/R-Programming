pollutantmean <- function(directory, pollutant, id = 1:332) {
    directory <- "C:/Users/rmadhok/Dropbox (Personal)/Coursera/R_programming/data/specdata"
    # Change wd to directory
    setwd(directory)
    
    # get character vector with all file names
    allFiles <- list.files(directory)
    
    # initialize empty data frame
    data <- data.frame()
    
    # append csv's for selected files
    for(i in id){
        # read csv
        file <- read.csv(allFiles[i])
        
        # add to data frame
        data <- rbind(data, file)
    }
    
    # return mean
    if(pollutant == 'sulfate'){
       mean(data$sulfate, na.rm = T)
    }
    else if(pollutant == 'nitrate'){
        mean(data$nitrate, na.rm = T)
    }
    else{
        print("Pollutant not captured by monitor")
    }
   
}
