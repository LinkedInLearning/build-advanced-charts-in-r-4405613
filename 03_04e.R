library(tidyverse)
library(ggrepel)
library(ggpp)

data <- read_csv("data/renewable_03_04.csv",
                 show_col_types = FALSE)

ggs <- data %>%
  ggplot(
    aes(
      x = year, y = renewables_perc_electricity,
      group = territory,
      colour = Continent
    )) +
  geom_line(linewidth = 2, alpha = 0.5) +
  geom_point(size = 3) +
  scale_colour_manual(name = "Continents",
                      values = ggsci::pal_jco("default")(4)) +
  scale_x_continuous(breaks = c(2000, 2021)) +
  theme_void() +
  theme(
    axis.text.x = element_text(size = 16),
    legend.position = "bottom",
    legend.text = element_text(size = 9),
    plot.title = element_text(size = 30, face = "bold", hjust = 0.5,
                              margin = margin(10,0,10,0)),
    plot.margin = unit(c(1,8,1,8), "lines")
  )

## add labels
ggs +
  geom_text_repel(
    data = data,
    aes(x = year, y = renewables_perc_electricity,
      label = paste0(territory, " - ",
                       round(renewables_perc_electricity), "%")),
    force =  20,
    show.legend = FALSE,
    size = 5,
    position = position_nudge_to(x = c(2000-13, 2021 + 13))) +
  ggtitle("Share of renewable energy for the \ntop 10 countries that use solar energy")

