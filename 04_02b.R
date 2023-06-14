library(tidyverse)
library(circlize)
library(cowplot)

## read the data 
matr <- read_csv("data/renewable_data_65.csv",
                 show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()

## Colour palette for the chord diagram
source("col_grid.R")


## source the circos function
source("circos_function.R")
## formula format for circlize charts


## Read sparklines

## Add the two charts in one plot




