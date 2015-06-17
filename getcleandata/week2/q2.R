#! /usr/bin/Rscript

library(sqldf)
library(data.table)

# only download if we need to
if (!file.exists("q2data.csv")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "q2data.csv", "libcurl")
} else {
    print("data file exists... skipping download")
}

# read this into a data table
acs <- fread("q2data.csv")

result <- sqldf("select pwgtp1 from acs where AGEP < 50", drv="SQLite")

result
