corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
    
  # read all complete cases
  all_complete <- complete(directory,1:332)
  
  # get the number of complete cases per element
  nobs <- all_complete$nobs
      
  # get the valid ids
  ids <- all_complete$id[nobs > threshold]
  
  # initlaiize the correlation vector
  cor_vector <- rep(0, length(ids))
  
  j <- 1
  for (i in ids) {
    # get filename
    file <- file.path(directory, paste0(sprintf("%03d", i),".csv"))
    # read the csv data
    data <- read.csv(file)
    
    # get the correlation
    cor_vector[j] <- cor(data$sulfate, data$nitrate, use="complete.obs")

    # increment counter
    j <- j + 1
  }
  return(cor_vector)
}