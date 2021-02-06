# R spatial

#recall sp package
library(sp)

data(meuse)
head(meuse)


#see data in space
coordinates(meuse)= ⁓x+y
plot(meuse)

#see the spread of the elements plotting them
spplot(meuse, "zinc")
#put the title
spplot(meuse, "zinc", main="concentration of zinc")

#see copper and zinc in the same graf with two different panels
spplot(meuse, c(zinc, copper))#no
spplot(meuse, c("zinc", "copper"))

#use bubbles instead of colors to show the concentration
bubble(meuse, "zinc")

#do the same for lead and change color
bubbles(meuse, "lead", col="red")
#zinc and lead can't be overlapped

#ecological dataframe
#prendiamo dati inventati come esempio
#biofuels
#built a new set
biofuels <- c(120, 200, 350, 570, 750) #array of values: c
#oxydative enzimes
oxydative <- c(1200, 1300, 21000, 34000,50000)
s<-data.fame(biofuels,oxydative)
s<-data.frame(biofuels, oxydative)

ggplot(s, aes(x= biofuels, y= oxydative))
ggplot2(s, aes(x= biofuels, y= oxydative))  

#we have to esxplai n that we are adding a geometry (a function) 
geaom_point
ggplot2(s, aes(x= biofuels, y= oxydative))+ eaom_point()
#to change the propriety of the table
ggplot(s, aes(x= biofuels, y= oxydative))+ geom_point(size=2, col="blue") + geom_line()

#to add lines to the graph
ggplot(s, aes(x= biofuels, y= oxydative))+ geom_point(size=2, col="blue") + geom_line()

)

#polygon
ggplot(s, aes(x= biofuels, y= oxydative))+ geom_polygon()


#######IMPORT DATA°°°°°°°°
#SET TH WORKING DIRECTORING (IMPORT AND ESPORT DATA)

setwd("C:\Users\Enrico Pisani\Desktop\GCE & SDG")
#salvare data in acer
setwd("C:/lab/")
#per leggere la tabella dei dati covid
covid<- read.table("covid_agg.csv", header=TRUE)
#per vedere se funziona
covid
#per vedere solo prime 6 righe
head(covid)

summary(covid)

#ggplot
library(ggplot2)
ggplot(covid, aes(x= lon, y= lat))+ geom_point() 

#change the size of the points according to the number of cases
ggplot(covid, aes(x= lon, y= lat, size= cases))+ geom_point() 

