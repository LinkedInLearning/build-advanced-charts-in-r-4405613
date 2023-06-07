library(tidyverse)

## read the data using read_csv
ren <- read_csv("data/renewable.csv",
                show_col_types = FALSE) #, col_types = "c")

## get column names
names(ren)

## get column specification
spec(ren)

## get the dimension of the data frame in rows x columns
dim(ren)

## create a summary table
summary(ren[1:9])


## extract all the country
unique_country <- ren %>%
  filter(type == "country") %>%
  distinct(territory)

