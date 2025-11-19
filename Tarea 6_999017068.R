library(readxl)
library(randomForest)

data <- read_excel("C:\\Users\\Daniel\\Downloads\\base-de-datos-violencia-intrafamiliar-ano-2024_v3 (2).xlsx")

datar <- data[,c("AGR_GURPET", "VIC_DISC", "VIC_ESCOLARIDAD","VIC_SEXO","HEC_AREA")]

datar$AGR_GURPET <- as.factor(datar$AGR_GURPET)

datar <- na.omit(datar)


set.seed(100)

datar <- datar[sample(1:nrow(datar)),]

index <- sample(1:nrow(datar),0.8*nrow(datar))

train <- datar[index,]
test <- datar[-index,]


bosque <- randomForest( AGR_GURPET ~ 
                          VIC_DISC +
                          VIC_ESCOLARIDAD +
                          VIC_SEXO +
                          HEC_AREA,
                        data = train, 
                        ntree = 1000,
                        mtry = 4
)

table(datar$AGR_GURPET)

prueba <- predict(bosque, test) 
prueba

matriz <- table(test$AGR_GURPET, prueba)
matriz

pre <- sum(diag(matriz))/sum(matriz)
pre

persona <- data.frame(
  VIC_DISC = c(1),
  VIC_ESCOLARIDAD = c(39),
  VIC_SEXO = c(2),
  HEC_AREA = c(2)
  
)

result2 <- predict(bosque, persona, type ="prob")
result2
plot(bosque)
