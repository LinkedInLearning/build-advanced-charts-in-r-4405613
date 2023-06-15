## define colours for chord diagram

col_grid <- function() {
  source_palette <- c("#1B9E77", "#D95F02", "#7570B3", "#A6761D")

  ## create structure to assign to each renewable source a specific color

  source_colour <- structure(source_palette, names = rownames(matr))

  country_colour <- structure(rep("#1F78B4",
                                  length(colnames(matr))),
                              names = colnames(matr))
  ## create a colour grid for the chord diagram
  col_grid <- c(source_colour, country_colour)
}
