library(rvest)
url <- "https://www.dhs.gov/immigration-statistics/yearbook/2017/table26"
table1 <- url %>% html() %>% html_nodes(xpath = '//*[@id="content-area"]/div/div/article/div[1]/div[2]/div/div/table[1]') %>% html_table()

table_clean <- table1[[1]]

names(table_clean) <- c('Region of Citizenship','2015','2016','2017')

write.csv(table_clean, file = "C:\\Users\\Rick\\Documents\\DV CA\\ImmigrationbyRegion.csv",row.names = FALSE)
