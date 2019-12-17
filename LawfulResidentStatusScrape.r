library(rvest)

url <- "https://www.dhs.gov/immigration-statistics/yearbook/2017/table2"
table3 <- url %>% html() %>% html_nodes(xpath = '//*[@id="content-area"]/div/div/article/div[1]/div[2]/div/div/table') %>% html_table(fill = TRUE)

table3_unlist <- table3[[1]]

NaturalisationByRegion <- table3_unlist[2:88,c(1,4)]

names(NaturalisationByRegion) <- c('Country','Total People in 2017')

write.csv(NaturalisationByRegion, file = "C:\\Users\\Rick\\Documents\\DV CA\\LawfulResidenceByCountry.csv",row.names = FALSE)
