## chord diagram function

circos_function <- function(matrix, col_grid, big_gap = 70, small_gap = 3) {
  circos.par(start.degree = -90)
  chordDiagram(
    matrix,
    big.gap = big_gap, ## increase the gap between the upper and lower sectors.
    small.gap = small_gap, ## gap between sectors
    grid.col = col_grid,  ## to change the colours
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
    bg.border = NA, ## colour for the border of the plotting region
  )
  circos.clear()
}
