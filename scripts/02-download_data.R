#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####
# [...ADD CODE HERE TO DOWNLOAD...]
# Define the URL and the relative path
url <- "https://projects.fivethirtyeight.com/polls/data/president_polls.csv"
relative_path <- "data/01-raw_data/raw_data.csv"


# Download the file and save it to the relative path
download.file(url, relative_path, mode = "wb")

# Confirm the download
cat("File downloaded to:", relative_path, "\n")




         
