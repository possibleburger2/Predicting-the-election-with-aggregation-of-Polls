#### Preamble ####
# Purpose: Models winner of 2024 US election
# Author: Daniel, Vandan
# Date: 4 November 2024
# Contact: danie.xu@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(here)
library(arrow)

#### Read data ####
analysis_data <- read_parquet("data/02-analysis_data/analysis_data.parquet")
harris_data <- filter(analysis_data, candidate_name == "Kamala Harris")
trump_data <- filter(analysis_data, candidate_name == "Donald Trump")
# Model 1: Only pollster and sample size as predictors
model1 <- lm(pct ~ pollster + sample_size, data = harris_data)

saveRDS(model1, here("models", "model1.rds"))

# Model 2: Adding state as a predictor
model2 <-
  lm(pct ~ pollster + sample_size + state, data = harris_data)
saveRDS(model2, here("models", "model2.rds"))

# Model 3: Adding recency as a predictor
model3 <-
  lm(pct ~ pollster + sample_size + state + recency, data = harris_data)
saveRDS(model3, here("models", "model3.rds"))

# Model 4: Only pollster and sample size as predictors
model4 <- lm(pct ~ pollster + sample_size, data = trump_data)

saveRDS(model4, here("models", "model4.rds"))

# Model 5: Adding state as a predictor
model5 <-
  lm(pct ~ pollster + sample_size + state, data = trump_data)
saveRDS(model5, here("models", "model5.rds"))

# Model 6: Adding recency as a predictor
model6 <-
  lm(pct ~ pollster + sample_size + state + recency, data = trump_data)
saveRDS(model6, here("models", "model6.rds"))



