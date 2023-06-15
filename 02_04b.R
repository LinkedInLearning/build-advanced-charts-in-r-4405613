library(tidyverse)
library(circlize)

## read the matrix
matr <- read_csv("data/renewable_data_35.csv") %>%
  column_to_rownames("name") %>%
  as.matrix()

## Create colour palette for the chord diagram
source_palette <- c("#1B9E77", "#D95F02", "#7570B3", "#A6761D")

## Create structure to assign to each renewable source a colour






## create a colour grid for the chord diagram



circos.par(start.degree = -90)
chordDiagram(
  matr,
  big.gap = 70, 
  small.gap = 3, 
  ## add colours

  annotationTrack = "grid", 
  annotationTrackHeight = c(0.03, 0.01), 
  preAllocateTracks = list(
    track.height = max(strwidth(unlist(dimnames(matr))))
  ) 
)
circos.track(
  track.index = 1,
  panel.fun = function(x, y) {
    circos.text(
      CELL_META$xcenter,
      CELL_META$ylim[1],
      CELL_META$sector.index,
      facing = "clockwise",
      niceFacing = TRUE, 
      adj = c(0, 0.5)    
    )
  },
  bg.border = NA 
)
# add title

## add footnote

## add data source as footnote.


circos.clear()
