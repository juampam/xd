library(moments)
library(psych)
library(ggplot2)

setwd(“.”)

carros<-read.csv("cars.csv")
View(carros)
Head(carros)
nrow(carros)
ncoll(carros)
str(carros)
head(carros)
tail(carros,3)
head(carros[,1:3]) #SHOW "Carros" 1 to 3

nrow(carros[carros$body_style=="hatchback",])
mean(carros[carros$body_style=="convertible","normalized_losses"],na.rm = TRUE)

peligrosos<-aggregate(carros[,1:2],list(carros$make),mean)
head(peligrosos)
peligrosos_completos<-peligrosos[complete.cases(peligrosos$perdidas),]
summary(carros)
describe(carros$normalized_losses)
hist(carros$normalized_losses)
boxplot(carros$normalized_losses)
CV<-(sd(carros$normalized_losses)/mean(carros$normalized_losses))*100
table(carros$fuel_type,carros$drive_wheels)
prop.table(table(carros$fuel_type,carros$drive_wheels))
prop.table(table(carros$fuel_type,carros$drive_wheels))*10



