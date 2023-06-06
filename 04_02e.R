library(tidyverse)
library(cowplot)
library(circlize)


## read the matrix
matr <- read_csv("R/04_02/renewable_data_65.csv",
                 show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()

## Create colour palette for the chord diagram
source_palette <- c("#1B9E77", "#D95F02", "#7570B3", "#A6761D")

## create structure to assign to each renewable source a specific color

source_colour <- structure(source_palette, names = rownames(matr2))

country_colour <- structure(rep("#1F78B4",
                                length(colnames(matr2))),
                            names = colnames(matr2))
## create a colour grid for the chord diagram
col_grid <- c(source_colour, country_colour)

source("R/circos_function.R")
## chord diagram
circos.par(start.degree = -90)
circos_function(matr, col_grid, small_gap = 4)
circos.clear()

## formula format for circlize charts
cd <- ~circos_function(matr, col_grid, small_gap = 4)

circos.clear()

## Read sparklines
sp <- readRDS("R/04_02/sparkline.rdata")
## Add the two charts in one plot
plot_grid(sp, cd)

plot_panel <- plot_grid(sp, cd,
          labels = c("Share of renewable energy",
                     "Renewable source of energy in 2021"),
          label_x = 0.1,
          label_y = 1.03,
          hjust = 0.1,
          rel_widths = c(1.2, 2),
          rel_heights = c(0.5, 2)) +
  theme(plot.margin = margin(20, 3, 4, 8))
circos.clear()

plot_col <- plot_grid(sp,
                      cd,
                      labels = c("Share of renewable energy ",
                      "Renewable source of energy in 2021"),
                      ncol = 2,
                      #label_colour = "white",
                      #label_size = 14,
                      hjust = 0.1,
                      label_x = 0.1,
                      label_y = 1.5,
                      #align = 'v',
                      rel_widths = c(1.1, 2),
                      rel_heights = c(0.5, 2)
) +
  theme(plot.margin = margin(20, 3, 4, 8))