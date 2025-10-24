library(arules)
library(ggplot2)
library(readxl)
data <- read_excel("C:\\Users\\Daniel\\Downloads\\base-de-datos-violencia-intrafamiliar-ano-2024_v3.xlsx")

datos_4 <- datos[,c("VIC_ALFAB","VIC_REL_AGR","AGR_EDAD","VIC_EDAD","TOTAL_HIJOS","VIC_EST_CIV","HEC_TIPAGRE")]
datos_4 <- subset(datos_4, AGR_EDAD!=99)
datos_4 <- subset(datos_4, VIC_EDAD!=99)
datos_4 <- subset(datos_4, HEC_TIPAGRE == 1222)
datos_4[is.na(datos_4)] <- -1

cluster <- kmeans(datos_4, centers = 4)

ggplot(datos_4, aes(x = AGR_EDAD, y = VIC_EDAD, color =as.factor(cluster$cluster)))+
  geom_point()+
  geom_point(data = as.data.frame(cluster$centers), aes(x = AGR_EDAD, y = VIC_EDAD), color="black", size=4, shape=17)+
  labs(title = "Edad del Agresor vs Edad de la victima") +
  theme_minimal()


