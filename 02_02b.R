library(tidyverse)

## read the data from renewable energy
data <- read_csv("data/renewable_continents.csv",
                 show_col_types = FALSE)

## I select the variable I will use to create the chord diagram
## Remove all the data with primary energy share = 0%
data_0 <- data %>%
  filter(renewables_perc_electricity > 0,
         year == 2021)


## we run again the summary statistics


## we select all the data with share of primary energy > 35,
## which is the mean in 2021



## data for the matrix


