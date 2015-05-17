pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  directory <- file.path(getwd(),directory)
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  if (pollutant != "sulfate" && pollutant != "nitrate")
    return(NA)
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!
  
  # initialize all_data vector
  all_data <- c()
  
  for (i in id) {
    # get filename
    file <- file.path(directory, paste0(sprintf("%03d", i),".csv"))
    # read the file
    data <- read.csv(file)
    # remove the NA columns
    na_removed <- data[!is.na(data[, pollutant]), pollutant]
    # add the non NA to the all_data vector
    all_data <- c(all_data, na_removed)
  }
  
  # return the mean of all of the data
  mean(all_data)
}