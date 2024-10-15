library(tidyverse)
#install.packages("devtools")
#devtools::install_github("lbenz730/ncaahoopR")
library(ncaahoopR)

library(readxl)
pred_table <- read_excel("tsa-ws/tsa_prediction_template_2024_2025.xlsx")
names <- rbind(pred_table$home %>% as.data.frame(), pred_table$away %>% 
                 as.data.frame()) %>%
                distinct(.) %>% pull()
names(names) = "team"
teams_list = names$team

data <- NULL
for (i in 1:nrow(names)){
  temp = teams_list[i]
  time1 = "2022-23"
  time2 = "2023-24"
  data1 <- get_schedule(temp, time1) %>% glimpse()
  data2 <- get_schedule(temp, time2) %>% glimpse()
  data1$team = temp
  data2$team = temp
  data <- rbind(data, data1, data2)
}

data_distinct <- data %>%  group_by(game_id) %>% slice(1)
