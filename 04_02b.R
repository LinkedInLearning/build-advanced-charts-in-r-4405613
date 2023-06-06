library(tidyverse)
library(circlize)

## read the data 
matr <- read_csv("renewable_data_65.csv",
                 show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()

## Create colour palette for the chord diagram
source_palette <- c("#1B9E77", "#D95F02", "#7570B3", "#A6761D")

## create structure to assign to each renewable source a specific color

source_colour <- structure(source_palette, names = rownames(matr))

country_colour <- structure(rep("#1F78B4",
                                length(colnames(matr))),
                            names = colnames(matr))
## create a colour grid for the chord diagram
col_grid <- c(source_colour, country_colour)

## source the circos function
source("circos_function.R")

## chord diagram


## formula format for circlize charts


## Read sparklines

## Add the two charts in one plot




