library(tidyverse)
library(ggpubr)

data <- read_csv("data/renewable_continents.csv",
                 show_col_types = FALSE)

## select the top countries that use solar energy.
top_10 <- data %>%
  filter(year == 2021) %>%
  slice_max(solar_generation_TWh, n = 10)

## create lollipop plot
