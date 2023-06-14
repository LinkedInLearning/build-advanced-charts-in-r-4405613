library(tidyverse)
library(cowplot)
library(circlize)


## read the matrix
matr <- read_csv("data/renewable_data_65.csv",
                 show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()

## Colour palette for the chord diagram
source("col_grid.R")
col_grid <- col_grid()


## chord diagram
source("circos_function.R")
## formula format for circlize charts
cd <- ~circos_function(matr, col_grid)

circos.clear()

## Read sparklines
sp <- readRDS("data/sparkline.rdata")
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