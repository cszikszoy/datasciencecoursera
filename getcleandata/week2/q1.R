#! /usr/bin/Rscript

library(httr)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("rgetcleandata", key = "6601cff8a84cba8810a0", secret = "a7510a05e93f25f53a785e826b2fc267b4cc4dec")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- with_config(gtoken, GET("https://api.github.com/users/jtleek/repos"))
stop_for_status(req)

# content now contains info about the repositories
content <- content(req)

# convert this to JSON so we can read it using jsonlite
data <- fromJSON(toJSON(content))

# get the index of the repository
index <- which(data$name == "datasharing")

# get create time for this repository
data$created_at[index]
