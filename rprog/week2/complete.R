complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  directory <- file.path(getwd(),directory)
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  # initialize vector of complete cases
  complete <- rep(0,length(id))
  j <- 1
  for (i in id) {
    # get filename
    file <- file.path(directory, paste0(sprintf("%03d", i),".csv"))
    # read the csv data
    data <- read.csv(file)
    # store the complete cases in the complete vector
    complete[j] <- sum(complete.cases(data))
    # increment vector counter
    j <- j+1
  }
  
  return(data.frame(id=id, nobs=complete))
  
}