library(tidyverse)
library(circlize)

## read the matrix, the columns are ordered by continents
matr <- read_csv("data/renewable_02_05.csv") %>%
  column_to_rownames("name") %>%
  as.matrix()

## Create colour palette for the chord diagram
source_palette <- c("#1B9E77", "#D95F02", "#7570B3", "#A6761D") ## colour blind friendly

## create structure to assign to each renewable source a specific color

source_colour <- structure(source_palette, names = rownames(matr))

country_colour <- structure(rep("#1F78B4",
                                length(colnames(matr))),
                            names = colnames(matr))
## create a colour grid for the chord diagram
col_grid <- c(source_colour, country_colour)

## define continents
asia <- colnames(matr)[1:3]
europe <- colnames(matr)[4:23]
north_america <- colnames(matr)[24]
oceania <- colnames(matr)[25]
south_america <- colnames(matr)[26:31]

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

highlight.sector(c("hydro", "wind", "solar", "other"), col = NA,
                 border = "grey95",
                 lwd = 2,
                 #track.index = 2,
                 #padding = c(0, 0, 0, 0),
                 text = "Source of renewable\n energy",
                 facing = "clockwise",
                 niceFacing = TRUE,
                 text.vjust = "18mm",
                 cex = 1.2
)

highlight.sector(asia, col = NA,
                 border = "grey95",
                 lwd = 2,
                 #track.index = 2,
                 padding = c(0.01, 0.15, 0, 0.1),
                 text = "Asia",
                 facing = "clockwise",
                 text.vjust = "18mm",
                 cex = 1.2
)
highlight.sector(europe, col = NA,
                 border = "grey95",
                 lwd = 2,
                 #track.index = 2,
                 padding = c(0.01, 0.02, 0, 0.01),
                 text = "Europe",
                 facing = "clockwise",
                 text.vjust = "20mm",
                 cex = 1.2
)
highlight.sector(north_america, col = NA,
                 border = "grey95",
                 lwd = 2,
                 #track.index = 2,
                 padding = c(0, 0.01, 0, 0),
                 text = "North America",
                 facing = "clockwise",
                 text.vjust = "22mm",
                 cex = 1.2
)

highlight.sector(oceania, col = NA,
                 border = "grey95",
                 lwd = 2,
                 #track.index = 2,
                 padding = c(0.01, 1, 0, 1.5),
                 text = "Oceania",
                 facing = "clockwise",
                 text.vjust = "18mm",
                 cex = 1.2
)
highlight.sector(south_america, col = NA,
                 border = "grey95",
                 lwd = 2,
                 #track.index = 2,
                 padding = c(0.01, 0.01, 0, 0.04),
                 text = "South America",
                 facing = "clockwise",
                 text.vjust = "18mm",
                 cex = 1.2
)

# add title
title("Renewable source of energy per countries", cex = 10)
## add footnote
text(-0.6, -1, "*other include geothermal, biomass and other sources")
## add data source as foot note.
text(0.8, -1, pos = 4, "Source: `Our world in data`")
circos.clear()
