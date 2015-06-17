#! /usr/bin/Rscript

if (!file.exists("q5data.for")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for", "q5data.for", 
"libcurl")
} else {
    print("data file exists... skipping download")
}

data <- read.fwf("q5data.for", c(12, 7,4, 9,4, 9,4, 9,4), skip=4)

sum(data$V4)
