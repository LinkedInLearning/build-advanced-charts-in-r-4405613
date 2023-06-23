library(tidyverse)
library(circlize)

## read the data from renewable energy
data <- read_csv("data/renewable_continents.csv",
                 show_col_types = FALSE)

## I select the variable I will use to create the chord diagram
## Remove all the data with primary energy share = 0%
data_0 <- data %>%
  filter(share_electricity > 0,
         year == 2021)

## summary statistics
summary(data_0)


## we select all the data with share of primary energy > 35,
## which is the mean in 2021

data_35 <- data_0 %>%
  filter(share_electricity > 35)

## data for the matrix
renewable_wider <- data_35 %>%
  select(-c("country_code", "year",
            "share_electricity", "Continent")) %>%
  ## remove punctuations from countries names.
  mutate(territory = str_remove(territory, "[[:punct:]]")) %>%
  column_to_rownames("territory") %>%
  rownames_to_column() %>%
  pivot_longer(-rowname) %>%
  pivot_wider(names_from=rowname, values_from=value)

