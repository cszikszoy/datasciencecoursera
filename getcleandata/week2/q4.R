#! /usr/bin/Rscript

library(httr)
#library(XML)

url <- "http://biostat.jhsph.edu/~jleek/contact.html"

# this was all interesting.... but wrong
# get the data from the above URL
#response <- GET(url)

# this will be the parsed HTML using the XML library
#html <- htmlParse(content(response, as="text"),asText=TRUE)

# but we actually need it as text, so we can skip the step above
#lines <- scan(text=content(response, as="text"), sep='\n', what='character')

# real solution starts here
con <- url(url)
lines <- readLines(con)
close(con)

nchar(lines[10])
nchar(lines[20])
nchar(lines[30])
nchar(lines[100])

