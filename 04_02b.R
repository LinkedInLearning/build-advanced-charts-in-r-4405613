library(tidyverse)
library(circlize)

## read the data 
matr <- read_csv("renewable_data_65.csv",
                 show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()

## Colour palette for the chord diagram
source("col_grid.R")
col_grid <- col_grid()

## source the circos function
source("circos_function.R")
## chord diagram


## formula format for circlize charts


## Read sparklines

## Add the two charts in one plot




