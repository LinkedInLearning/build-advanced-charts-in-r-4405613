## Visual data exploration
library(tidyverse)

## read data from continents
ren <- read_csv("data/renewable_continents.csv")

## create histogram
ren %>%
  filter(year %in% 2000:2021) %>%
  ggplot() +
  geom_histogram(aes(share_electricity), binwidth = 1)

## create a frequency polygons
ren %>%
  ggplot() +
  geom_freqpoly(aes(share_electricity, colour = Continent))

## Countries that use more than 90% of renewable energy
ren %>%
  filter(share_electricity >= 90) %>%
  ggplot(aes(year, share_electricity, colour = territory)) +
  geom_line()

## Line chart for Europe and countries that use more
## than 50% of renewable energy
ren %>%
  filter(Continent == "Europe",
         share_electricity >= 50) %>%
  ggplot(aes(year, share_electricity, colour = territory)) +
  geom_line()
