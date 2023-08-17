library(tidyverse)
library(dplyr)
library(rtweet)
files<-list.files(pattern="\\.csv$",full.names = TRUE)
all_data<-map_df(files,  ~read_csv(.x))
final_data<-all_data%>%distinct()
library(knitr)
ts_plot(X14_08_2022, "hours") +
  labs(x = NULL, y = NULL,
       title = "Frequency of tweets with Football",
       subtitle = paste0(format(min(X14_08_2022$created_at), "%d %B %Y"), " to ", format(max(X14_08_2022$created_at),"%d %B %Y")),
       caption = "Football tweets Data collected from Twitter") +
  theme_minimal()
X14_08_2022%>% 
  filter(!is.na(place)) %>% 
  count(place, sort = TRUE) %>% 
  top_n(18)