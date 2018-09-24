library(tidyverse)

Data <- crossing(Stores  = c('Best Buy', 'Walmart', 'Target', 'Sams'),
                 Regions = c('Midwest', 'West', 'South', 'East'),
                 Date    = seq.Date(as.Date('2018-01-01'), as.Date('2018-01-31'), by = 1))

Data <- Data %>%
  rowwise() %>%
  mutate(Sales = runif(1, 1000, 2500)) %>%
  ungroup()

DataNested <- Data %>%
  group_by(Stores,
           Regions) %>%
  nest()
