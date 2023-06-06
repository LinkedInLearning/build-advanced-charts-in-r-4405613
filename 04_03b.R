library(tidyverse)
library(cowplot)
library(circlize)
source("circos_function.R")
source("col_grid.R")

## define colour grid for the chord diagram

matr <- read_csv("data/renewable_data_65.csv",
                  show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()




circos.clear()

## open the figure we created with cowplot previously.
sp <- readRDS("data/sparkline.rdata")

plot_col <- plot_grid(sp, cd,
                      labels = c("Share of renewable energy ",
                                 "Renewable source of energy in 2021"),
                      ncol = 2,
                      hjust = 0.1,
                      label_x = 0.1,
                      label_y = 1.5,
                      rel_widths = c(1.1, 2),
                      rel_heights = c(0.5, 2)) +
  theme(plot.margin = margin(20, 3, 4, 8))

circos.clear()

## Add a title and subtitle. We need to create a ggplot element

## create footnote
