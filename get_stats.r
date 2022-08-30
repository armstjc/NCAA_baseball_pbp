library(baseballr)
library(dplyr)
library(glue)
library(dplyr)

seasons = 2019:2022

for (s in seasons) {
  print(glue::glue("Donwloading all the play-by-play data for the NCAA Baseball season of {s}"))
  df = read.csv(glue::glue("{s}_batting_01.csv"))
  df2 = read.csv(glue::glue("{s}_batting_02.csv"))
  main_df <- union(df,df2)
  list = main_df$game_id
  #print(list)
  list = unique(list)
  list_len = length(list)
  count = 0
  
  l_range = 837:8406
  
  for (i in list){
    count = count + 1
    print(glue::glue("{count}/{list_len}: {i}"))
    filename <- glue::glue("pbp/{i}.csv")
    stats <- ncaa_baseball_pbp(glue::glue('https://stats.ncaa.org/game/play_by_play/{i}'))
    write.csv(stats,filename,row.names=FALSE)
    Sys.sleep(4)
  }
}
