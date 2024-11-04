#### Preamble ####
# Purpose: Tests analysis data
# Author: Daniel, Vandan
# Date: 4 November 2024
# Contact: danie.xu@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)
library(testthat)

data <- read_csv("data/02-analysis_data/analysis_data.csv")


#### Test data ####
# Define validation rules
rules <- validator(
  is.numeric(poll_id),                           # 'poll_id' is integer type
  is.character(state),                           # 'state' column is character type
  all(as.Date(end_date, format="%m/%d/%y") >= as.Date("2021-01-01") & 
        as.Date(end_date, format="%m/%d/%y") <= as.Date("2024-11-05")), # 'end_date' is between 2021-01-01 and 2024-11-05
  is.numeric(transparency_score),                # 'transparency_score' is numeric type
  is.character(candidate_name),                  # 'candidate_name' column is character type
  is.numeric(pct),                               # 'pct' column is numeric type
  all(transparency_score >= 0 & transparency_score <= 10), # 'transparency_score' is between 0 and 10
  
  # 'state' contains only valid US states or NA values
  all(is.na(state) | state %in% c("Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", 
                                  "Connecticut", "Delaware", "Florida", "Georgia", "Hawaii", "Idaho", 
                                  "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", 
                                  "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", 
                                  "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", 
                                  "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", 
                                  "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", 
                                  "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", 
                                  "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming", 
                                  "Nebraska CD-1", "Nebraska CD-2", "Nebraska CD-3","Maine CD-1", "Maine CD-2")),
  
  all(pct >= 0 & pct <= 100) # 'pct' is a percentage between 0 and 100 for each candidate
)

# Apply rules to data
validation_results <- confront(data, rules)

# Summary of validation
summary(validation_results)

