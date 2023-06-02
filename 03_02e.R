library(tidyverse)

data <- read_csv("data/renewable_65_perc.csv",
                 show_col_types = FALSE)

## I want to compare The share of renewable energy per countries.
## We calculate the max and min for each countries

min_df <- data %>%
  group_by(territory) %>%
  slice(which.min(renewables_perc_electricity))

max_df <- data %>%
  group_by(territory) %>%
  slice(which.max(renewables_perc_electricity))

col <- c("min" = "#2c7bb6", "max" = "#d7191c")

data %>%
  ggplot(aes(x = year, y = renewables_perc_electricity)) +
  facet_wrap(territory ~ .,
             scales = "free_y",
             ncol = 3
             ) +
  geom_line(linewidth = 0.3) +
  geom_point(data = min_df, aes(colour = "min")) +
  geom_point(data = max_df, aes(colour = "max")) +
  geom_text(data = min_df, aes(label = round(renewables_perc_electricity, 1)),
            size = 5,
            vjust = -1) +
  geom_text(data = max_df, aes(label = round(renewables_perc_electricity, 1)),
            size = 5,
            vjust = 1.5, hjust = 0.5) +
  theme_minimal() +
  ylab("") + xlab("") +
  coord_cartesian(clip = "off") +
  scale_x_continuous(breaks = c(2000, 2021)) +
  scale_colour_manual(
    name = "",
    breaks = c("min", "max"),
    values = col) +
  theme(
    axis.text.x =element_text(size = 12),
    axis.text.y = element_blank(),
    axis.ticks = element_blank(),
    panel.grid = element_blank(),
    strip.text = element_text(size = 14),
    panel.spacing = unit(2, "lines"),
    legend.position = "bottom"
  )










# ggplot(aes(year, renewables_perc_electricity)) +
#   geom_segment(aes(
#     x = year, xend = year,
#     y = 0, yend = renewables_perc_electricity
#   ),
#   colour = "grey85",
#   linewidth = 1,
#   linetype = 5,
#   #position = position_dodge2(width = 0.8),
#   alpha = 0.7, colour = "gray70",
#   linewidth = 1.5) +
#   scale_colour_brewer(type = "qual",
#                       palette = "Set2",
#                       name = "") +
#   geom_point(size = 5) +
#   theme_minimal()
