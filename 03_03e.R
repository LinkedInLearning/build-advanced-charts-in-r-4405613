library(tidyverse)
library(ggpubr)

data <- read_csv("data/renewable_continents.csv", show_col_types = FALSE)


## select the top countries that use solar energy.
top_10 <- data %>%
  filter(year == 2021) %>%
  slice_max(solar_generation_TWh, n = 10)

ggdotchart(
  top_10,
  y = "solar_generation_TWh",
  x = "territory",
  color = "Continent",
  palette = "jco",
  legend.title = "Continents",
  sorting = "descending",
  rotate = TRUE,
  add = "segments",
  add.params = list(color = "black", size = 0.5),
  dot.size = 8,
  label = round(top_10$solar_generation_TWh),
  font.label = list(color = "grey95", size = 10, vjust = 0.5, face = "bold"),
  ggtheme = theme_void()
) +
  xlab("") + ylab("") +
  ggtitle("Solar energy in 2021 in TWh") +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    plot.title = element_text(hjust = 0.5, size = 22)
  )
