## Visual data exploration
library(tidyverse)

## read data from continents
renewable_country <- read_csv("data/renewable_continents.csv")

## create histogram
renewable_country %>%
  filter(year %in% 2000:2021) %>%
  ggplot() +
  geom_histogram(aes(renewables_perc_electricity), binwidth = 1)

## create a frequency polygons
renewable_country %>%
  ggplot() +
  geom_freqpoly(aes(renewables_perc_electricity, colour = Continent))

## Countries that use more than 90% of renewable energy
renewable_country %>%
  filter(renewables_perc_electricity >= 90) %>%
  ggplot(aes(year, renewables_perc_electricity, colour = territory)) +
  geom_line()

## Line chart for Europe and countries that use more
## than 50% of renewable energy
renewable_country %>%
  filter(Continent == "Europe",
         renewables_perc_electricity >= 50) %>%
  ggplot(aes(year, renewables_perc_electricity, colour = territory)) +
  geom_line()
