{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

library(tidyverse)
library(ggplot2)
library(gtsummary)
library(readr)
flu<- read_csv("https://data.cdc.gov/resource/mmi4-8ajr.csv?$limit=50000")

names(flu)

library(gtsummary)
tbl1<- flu %>%
  select(seasonal) %>%
  tbl_summary(
    statistic=all_continuous()~"{mean} ({sd}) | {median} [{p25}, {p75}]"
  )
print(tbl1)

flu %>%
  select(state,seasonal) %>%
  arrange(seasonal) %>%
  mutate(state=fct_inorder(state))%>% 
  ggplot(aes(x=state, y=seasonal)) +
  geom_col()+
  coord_flip()