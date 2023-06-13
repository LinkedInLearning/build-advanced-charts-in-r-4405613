library(tidyverse)

data <- read_csv("data/renewable_65_perc.csv",
                 show_col_types = FALSE)

## I want to compare the share of renewable energy per countries.
## We calculate the max and min for each countries


## colours for minimum and maximum
col <- c("min" = "#2c7bb6", "max" = "#d7191c")

## create the sparkline
data %>%
  ggplot(aes(x = , y = ))
  