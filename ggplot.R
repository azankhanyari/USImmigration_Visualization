data(mtcars)
summary(mtcars)
str(mtcars)

library(ggplot2)

ggplot(data = mtcars, aes(x= disp, y= hp)) + 
  geom_point() +
  ggtitle("Displacement vs Horsepower", subtitle = "Using mtcars") +
  xlab("Displacement")+
  ylab("HP") +
  theme(plot.title = element_text(face = "bold.italic", colour = "blue", size = 20)) +
  theme(axis.title.x = element_text(face = "bold", colour = "green", size = 15)) +
  theme(axis.title.y = element_text(face = "bold", colour = "green", size = 15))
