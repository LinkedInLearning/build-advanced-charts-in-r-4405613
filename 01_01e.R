library(tidyverse)

## read the data using read_csv
ren <- read_csv("data/renewable.csv",
                show_col_types = FALSE) #, col_types = "c")

## get column names
names(ren)

## get column specification
spec(ren)

## get the dimension of the data frame in rows x columns
d <- dim(ren)

## create a summary table
summary(ren)



## extract all the country
unique_country <- ren %>%
  filter(type == "country") %>%
  distinct(territory)

## select data from continents
cont <- ren %>%
  filter(type == "continent") %>%
  distinct(territory) %>%
  pull
