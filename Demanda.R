
library(readxl)
library(tidyverse)
library(knitr)
library(kableExtra)
library(ggplot2)
library(lubridate)
library(forecast)
library(tables)
library(PerformanceAnalytics)

if (!require('devtools')) install.packages('devtools')
devtools::install_github('fhernanb/model', force=TRUE)

library(model)


install.packages("forecast")
install.packages("tables")
install.packages("PerformanceAnalytics")


#Paso 1 carga de datos:

Datos <- read_excel("C:/Users/57350/Desktop/GITHUB/REGRESION/DEMANDA_AEROPUERTO/Datos.xlsx")
View(Datos)
plot(Datos)
attach(Datos)
#Datos.ts=ts(Datos, start = 2014, frequency = 12)

plot(Precio_Kerosene, Carga_KG_N)
plot(n, Carga_KG_N, xlab='Meses de 2014 a 2019', ylab='Carga nacional aerea en Kg', main = "Comportamiento de la variable en el tiempo", col = "blue")


#Paso 2: Se realiza un modelo simple de extrapolación lineal de las series de datos históricos (tiempo vs Y).
#Con el fin de estimar la demanda para el año 2031.

attach(Datos)
regresion0 <- lm(Carga_KG_N ~ n, data = Datos)
summary(regresion0)
Grafico1 = plot(Datos$n, Datos$Carga_KG_N, xlab='Meses de 2014 a 2019', ylab='Carga nacional aerea en Kg', main = "Linea de extrapolación", col = "blue"  ) +abline(regresion0, col = "red") 

#Paso 3: Se realiza la predicción:
nuevosn <- data.frame(n= seq(205,216)) #Son los meses del año 2031.
predic2031 = predict(regresion0, nuevosn)
plot(predic2031, xlab='Meses de 2031', ylab='Carga nacional aerea en Kg', main = "Estimación mensual de la demanda aerea de carga nacional en Kg.", col = "blue")
sum(predic2031)

Prediccion_2031 <- data.frame(predic2031)
Prediccion_2031 <- format(Prediccion_2031)


#Paso 4: Se guardan y analizan los resultados
predic2031
sum(predic2031)
summary(regresion0)

#Paso 5: Implementar otra alternativa a la extrapolación (Usar otra variable exógena)
#En este caso la demanda de carga aera en función del precio del queroseno.

attach(Datos)
plot(n, Precio_Kerosene, xlab='Meses de 2014 a 2019', ylab='Precio del Queroseno en yenes', main = "Comportamiento de la variable en el tiempo", col = "blue")
plot(Precio_Kerosene, Carga_KG_N, ylab='Carga nacional aerea en Kg', xlab='Precio del Queroseno en yenes', main = "Dispersión de los datos.", col = "blue")
pairs(Precio_Kerosene ~ Carga_KG_N)
cor(Precio_Kerosene, Carga_KG_N)
cor.test(Precio_Kerosene, Carga_KG_N)
cor(Precio_Kerosene, Carga_KG_N, method = "spearman")



regresion1 <- lm(Datos$`Carga_KG_N` ~ Precio_Kerosene, data = Datos)
summary(regresion1)
Grafico2 = plot(Datos$Precio_Kerosene, Datos$Carga_KG_N, ylab='Carga nacional aerea en Kg', xlab='Precio del Queroseno en yenes', main = "Regresión lineal.", col = "blue")+abline(regresion1, col=("red")) 

regresion2 <- lm(Precio_Kerosene ~ n, data = Datos)
summary(regresion2)
Grafico2 = plot(n, Precio_Kerosene, xlab='Meses de 2014 a 2019', ylab='Precio del Queroseno', col="blue", main = "Extrapolación del precio del queroseno." ) +abline(regresion2, col="red") 
predic2_2031 = predict(regresion2, nuevosn)
plot(predic2_2031, xlab='Meses del año 2031', ylab='Precio del Queroseno', main = "Extrapolación lineal del precio del queroseno.", col="blue")
sum(predic2_2031)


queroseno = data.frame(Precio_Kerosene = predic2_2031)
predic3_2031 = predict(regresion1, queroseno)
plot(predic3_2031, xlab='Precios proyectados del queroseno', ylab='Carga nacional aerea en Kg proyectada', main = "Proyección de la Carga nacional aerea en Kg", col="red") + abline(regresion1, col = "red") 

sum(predic3_2031)
