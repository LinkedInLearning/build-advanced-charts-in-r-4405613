library(tidyverse)

## read the data using read_csv
ren <- read_csv("data/renewable.csv",
                show_col_types = FALSE)

## get column names
names(ren)

## get column specification
spec(ren)

## create a summary table
summary(ren[1:9])


