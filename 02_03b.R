library(tidyverse)
library(circlize)

## read the matrix
matr <- read_csv("data/renewable_data_35.csv",
           show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()

## Create a very basic chord diagram

## get information about the diagram

## clear the environment

## create another chord diagram at -90 degree and add a gap,

chordDiagram(

)

circos.clear()
## change the column's name of the matrix

circos.par(start.degree = )
chordDiagram(
  matr,
)

circos.clear()
