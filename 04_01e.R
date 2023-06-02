library(tidyverse)
library(RColorBrewer)
library(colorblindr)
library(recolorize)

## read slope graph with default colours
slope_graph <- readRDS("data/slope_04_01.rdata")

slope_graph +
  scale_colour_manual(name = "",
    values = c("blue", "lightblue", "darkblue", "purple")
  )

cvd_grid(
  slope_graph +
    scale_colour_manual(name = "",
      values = c("blue", "lightblue", "darkblue", "purple")
    )
)
## viridis colour palette
slope_graph +
  scale_colour_viridis_d(name = "", option = "magma", alpha = 0.5)

cvd_grid(slope_graph +
           scale_colour_viridis_d(name = "", option = "magma",
                                  alpha = 0.8))


## we select one of this palette and run again the code
slope_graph +
  scale_colour_brewer()

## use R colours brewer to find colour blind palette
display.brewer.all(colorblindFriendly = TRUE)

slope_graph +
  scale_colour_brewer(name = "",
                      palette = "Set2")

## brand colours

brand <- c("red", "darkgreen", "blue", "purple")
palette_plot(brand)
cvd_grid(palette_plot(brand, label_size = 4))


brand_rgb <- t(col2rgb(brand)/ 255 )

brand_sat <- adjust_color(brand_rgb, which_colors = c(2, 3),
                          saturation = 0.3, brightness = 0.9,
                          plotting = TRUE)
brand_hex <- rgb(brand_sat)

cvd_grid(palette_plot(brand_hex))