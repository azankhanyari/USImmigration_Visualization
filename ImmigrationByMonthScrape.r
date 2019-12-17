library(rvest)
url <- "https://www.dhs.gov/immigration-statistics/yearbook/2017/table31"
table2 <- url %>% html() %>% html_nodes(xpath = '//*[@id="content-area"]/div/div/article/div[1]/div[2]/div/div/table') %>% html_table(fill = TRUE)

tata <- table2[[1]]

ImmigrantByMonth <- tata[3:14,1:2]

names(ImmigrantByMonth) <- c('Month','Total')

write.csv(ImmigrantByMonth, file = "C:\\Users\\Rick\\Documents\\DV CA\\ImmigrantByMonth.csv",row.names = FALSE)

library(ggplot2)

p <- ggplot(ImmigrantByMonth, aes(x = Month))

p + geom_area(stat = 'bin')

### donut chart 

library(ggpubr)

byType <- tata[2,3:8]

names(byType) <- c('Temporary Visitors for Pleasure','Temporary Visitors for Business','Students & Exchange Visitors','Temporary Workers','Diplomats','Others')

df <- data.frame(group = c('Temporary Visitors for Pleasure','Temporary Visitors for Business','Students & Exchange Visitors','Temporary Workers','Diplomats','Others'), value =c(23637046,46419211,2534356,3969276,450457,575214))

ggdonutchart(df,"value",label = "group")

ggdonutchart(df, "value", label = "group",
             fill = "group", color = "white",
             palette = c("#26082f", "#E7B800", "#FC4E07","#00c7d5","#00bb0c","#bb0052") )





