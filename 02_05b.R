library(tidyverse)
library(circlize)

## read the matrix, the columns are ordered by continents
matr <- read_csv("data/renewable_02_05.csv",
                 show_col_types = FALSE) %>%
  column_to_rownames("name") %>%
  as.matrix()

## Create colour palette for the chord diagram
source_palette <- c("#1B9E77", "#D95F02", "#7570B3", "#A6761D")

## create structure to assign to each renewable source a specific colour

source_colour <- structure(source_palette, names = rownames(matr))

country_colour <- structure(rep("#1F78B4",
                                length(colnames(matr))),
                            names = colnames(matr))
## create a colour grid for the chord diagram
col_grid <- c(source_colour, country_colour)

## chord diagram
circos.par(start.degree = -90)
chordDiagram(
  matr,
  big.gap = 70, ## increase the gap between the upper and lower sectors.
  small.gap = 3, ## gap between sectors
  ## add colours
  grid.col = col_grid,
  annotationTrack = "grid", ## show only the track and the sectors, no names
  annotationTrackHeight = c(0.03, 0.01), ## height of annotation track
  preAllocateTracks = list(
    track.height = max(strwidth(unlist(dimnames(matr))))
  ) ## number of pre-allocated empty tracks this allow an easy customisation
)
circos.track(
  track.index = 1,
  panel.fun = function(x, y) {
    circos.text(
      CELL_META$xcenter,
      CELL_META$ylim[1],
      CELL_META$sector.index,
      facing = "clockwise",
      niceFacing = TRUE, ## Make sure that the label on the left fit human eyes. Anticlockwise
      adj = c(0, 0.5)    ## offset of the text to male sure that the text doesn't overlap with the track.
    )
  },
  bg.border = NA ## colour for the border of the plotting region
)

# add title
title("Renewable source of energy per countries", cex = 10)
## add footnote
text(-0.6, -1, "*other include geothermal, biomass and other sources")
## add data source as foot note.
text(0.8, -1, pos = 4, "Source: `Our world in data`")

## define continents


## highlight sectors


circos.clear()
