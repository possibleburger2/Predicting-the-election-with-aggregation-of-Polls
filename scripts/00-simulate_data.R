#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
set.seed(853)

# Number of Observations
n <- 1000
# Simulation parameters
harris_support <- 50 # assumption of harris support
poll_deviation <- 2.2 # Average polling standard deviation  https://5harad.com/papers/polling-errors.pdf page 612


# Define a few pollsters and their ratings and method
pollsters <- tribble(
  ~name,                          ~rating,~method,
  "The New York Times/Siena College", 4.3, "Phone",
  "YouGov",                           4.5, "Online",
  "Ipsos",                            4.3, "Online",
  "TIPP Insights",                    4.0, "Mixed",
  "Emerson",                          4.2, "Mixed"
)

# Define swing states with their baseline characteristics
swing_states <- tribble(
  ~state,  ~harris_margin,
  "AZ",     0.5,
  "GA",    -0.3,
  "MI",     2.1,
  "NV",    -0.8,
  "PA",     1.4,
  "WI",     0.9
)


# State names
states <- c(
  "Alabama",
  "Alaska",
  "Arizona",
  "Arkansas",
  "California",
  "Colorado",
  "Connecticut",
  "Delaware",
  "Florida",
  "Georgia",
  "Hawaii",
  "Idaho",
  "Illinois",
  "Indiana",
  "Iowa",
  "Kansas",
  "Kentucky",
  "Louisiana",
  "Maine",
  "Maryland",
  "Massachusetts",
  "Michigan",
  "Minnesota",
  "Mississippi",
  "Missouri",
  "Montana",
  "Nebraska",
  "Nevada",
  "New Hampshire",
  "New Jersey",
  "New Mexico",
  "New York",
  "North Carolina",
  "North Dakota",
  "Ohio",
  "Oklahoma",
  "Oregon",
  "Pennsylvania",
  "Rhode Island",
  "South Carolina",
  "South Dakota",
  "Tennessee",
  "Texas",
  "Utah",
  "Vermont",
  "Virginia",
  "Washington",
  "West Virginia",
  "Wisconsin",
  "Wyoming"
)



#### Save data ####
write_csv(analysis_data, "data/00-simulated_data/simulated_data.csv")
