library(tidyverse)
library(cowplot)
library(circlize)
source("circos_function.R")
source("col_grid.R")

## read the data and create the matrix
matr <- read_csv("data/renewable_data_65.csv",
                  show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()

## define colour grid for the chord diagram
col_grid <- col_grid()

## chord diagram
circos.par(start.degree = -90)
## formula format for circlize charts
cd <- ~circos_function(matr, col_grid, small_gap = 4)

circos.clear()

## Read sparklines
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
title_gg <- ggplot() +
  labs(title = "Use of renewable energies per country",
       subtitle = "Share of renewable energy greater than 65% in 2021") +
  theme(
    plot.title = element_text(size = 24,
                              hjust = 0.5,
                              face = "bold"),
    plot.subtitle = element_text(size = 16,
                                 hjust = 0.5),
    plot.margin = margin(18, 0, 12, 0),
    plot.background = element_rect(
      fill = "grey92", colour = NA)
  )


panel <- plot_grid(title_gg,
          plot_col,
          ncol = 1, rel_heights = c(0.1, 1),
          align = "v") +
  theme(
    plot.background = element_rect(
      fill = "grey92",
      colour = NA)
  )
panel
circos.clear()

