library(robotstxt)
library(rvest)
library(dplyr)
path =paths_allowed('https://mydramalist.com/shows/top')
link <-"https://mydramalist.com/shows/top"
web<- read_html(link)
name <- web%>%html_nodes(".content .text-muted , .title a:nth-child(1)")%>% html_text()
View(name)

drama_name <-web%>%html_nodes(".title a:nth-child(1)")%>% html_text()
View(drama_name)

drama_type <-web %>% html_nodes(".content .text-muted")%>% html_text()
View(drama_type)

mydramaRating <-data.frame(drama_name,drama_type)
View(mydramaRating)
write.csv(mydramaRating,"mydrama_rating.csv")
