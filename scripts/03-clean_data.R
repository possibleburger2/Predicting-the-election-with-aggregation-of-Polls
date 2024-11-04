#### Set-up ####
# Load libraries
library(tidyverse)
library(janitor)
library(lubridate)
library(arrow)


#### Prepare dataset ####
# Read in the data and clean variable names
data <- read_csv("data/01-raw_data/raw_data.csv") |>
  clean_names()


analysis_data <- data |>
  select(
    pollster, numeric_grade, state, candidate_name, pct, sample_size, pollscore,   # Selecting relevant columns
    population, end_date
    )|>
  drop_na(numeric_grade,pct,sample_size, end_date
          )|>
  filter(
    numeric_grade >= 2 # Based off mean and median 
  )|>
  mutate(
    state = if_else(is.na(state) | state == "--", "National", state),
    national_poll = if_else(state == "National",1,0)
  )|> 
  mutate(
    end_date = mdy(end_date)
  )|>
  filter(end_date >= as.Date("2024-07-21")
  )|>
  mutate(
    recency = as.numeric(difftime(as.Date("2024-11-05"), end_date, units = "days")) # Give newer polls higher weight
  )|>
  mutate(
    pollster = factor(pollster),
    state = factor(state),
    candidate_name = factor(candidate_name),
    population = factor(population),  
    national_poll = factor(national_poll)
  )


write_csv(analysis_data,"data/02-analysis_data/analysis_data.csv")
write_parquet(analysis_data,"data/02-analysis_data/analysis_data.parquet")
