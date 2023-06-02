library(tidyverse)
library(circlize)

## read the matrix
matr <- read_csv("data/renewable_data_35.csv") %>%
  column_to_rownames("name") %>%
  as.matrix()

## Create colour palette for the chord diagram


## Create structure to assign to each renewable source a specific colour






## create a colour grid for the chord diagram



circos.par(start.degree = -90)
chordDiagram(
  matr,
  big.gap = 70, ## increase the gap between the upper and lower sectors.
  small.gap = 3, ## gap between sectors
  ## add colours

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

## add footnote

## add data source as footnote.


circos.clear()
