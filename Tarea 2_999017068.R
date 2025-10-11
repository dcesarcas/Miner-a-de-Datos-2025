install.packages("arules", type = "binary")
library(arules)
install.packages("readxl")
library(readxl)
library(utf8)
datos <- read_excel("C:\\Users\\Daniel\\Downloads\\graduados-superior-2023.xlsx")

reglas <- apriori(datos, parameter = list(support=0.2, confidence = 0.5))

inspect(reglas[0:130])

data.frame(1:ncol(datos), colnames(datos))

datos <- datos[,-1]

reglas2 <- apriori(datos, parameter = list(support=0.2, confidence = 0.5))

inspect(reglas2[0:44])

datos_tecnico <- subset(datos, Nivel_Educativo == 'Técnico')
datos_tecnico <- datos_tecnico[,-3]
reglas3 <- apriori(datos_tecnico, parameter = list(support=0.2, confidence = 0.5))
inspect(reglas3[0:25])

datos_licenciatura <- subset(datos, Nivel_Educativo == 'Licenciatura')
data.frame(1:ncol(datos_licenciatura),colnames(datos))
datos_licenciatura <- datos_licenciatura[,-3]
reglas4 <- apriori(datos_licenciatura, parameter = list(support=0.2, confidence = 0.5))
inspect(reglas4[0:26])


datos_maestria <- subset(datos, Nivel_Educativo == 'Maestría')
data.frame(1:ncol(datos_maestria),colnames(datos))
datos_maestria <- datos_maestria[,-3]
reglas5 <- apriori(datos_maestria, parameter = list(support=0.2, confidence = 0.5))
inspect(reglas5[0:53])


datos_capital <- subset(datos, Departamento == "Guatemala")
data.frame(1:ncol(datos_capital),colnames(datos))
datos_maestria <- datos_capital[,-3]
reglas6 <- apriori(datos_capital, parameter = list(support=0.2, confidence = 0.5))
inspect(reglas6[0:120])
