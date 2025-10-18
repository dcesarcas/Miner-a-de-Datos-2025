library(readxl)
datos <- read_excel("C:\\Users\\Daniel\\Downloads\\base-de-datos-violencia-intrafamiliar-ano-2024_v3.xlsx")
datos_fp <- datos[, c("AGR_SEXO", "AGR_EDAD", "AGR_ESCOLARIDAD", "AGR_EST_CIV", "AGR_TRABAJA", "AGR_OCUP", "HEC_RECUR_DENUN")]


#datos_fp <- subset(datos_fp, AGR_SEXO==1)

reglas_fp <- fim4r(datos_fp, method="fpgrowth", target ="rules", supp =.2, conf=.5)
rf <- as(reglas_fp, "data.frame")



datos_victima_agre <- datos[,c("VIC_GRUPET", "VIC_NACIONAL", "HEC_TIPAGRE", "HEC_AREA")]
reglas_2 <- fim4r(datos_victima_agre, method="fpgrowth", target ="rules", supp =.2, conf=.5)

rf_vic_agr <- as(reglas_2, "data.frame")

#Victimas menores a 15 años
datos_3 <- datos[,c("VIC_EDAD", "AGR_EDAD", "VIC_REL_AGR", "HEC_RECUR_DENUN", "HEC_TIPAGRE")]
datos_3 <- subset(datos_3, VIC_EDAD<=15)
reglas_3 <- fim4r(datos_3, method="fpgrowth", target ="rules", supp =.2, conf=.5)

rf_3 <- as(reglas_3, "data.frame")


#Victimas mujeres
datos_4 <- datos[,c("VIC_EDAD", "AGR_EDAD", "VIC_REL_AGR", "HEC_RECUR_DENUN", "HEC_TIPAGRE","VIC_ESCOLARIDAD", "AGR_ESCOLARIDAD")]
datos_4 <- subset(datos_4, VIC_SEXO=1)
reglas_4 <- fim4r(datos_4, method="fpgrowth", target ="rules", supp =.2, conf=.5)

rf_4 <- as(reglas_4, "data.frame")
