#Point pattern analysis
install.packages("spatstat")
library(spatstat)#


setwd("C:/lab/")

> covid<- read.table("covid_agg.csv", header=TRUE)
> covid

# see the density of covid data
#make a planar point pattern
#before we have to attach the dataset 

attach(covid)

#I can see the range of lat and long from the summary, it gives the extension of the final map so we can use a bigger range

covid_planar<-ppp(lon, lat, c(-180, 180), c(-90, 90))

density_map<-density(covid_planar)

@yo plot

density_map<-density(covid_planar)

#per vedere la mappa della densità
plot(density_map)

#per vedere i punti sulla mappa
points(covid_planar)

#to change the colors
cl<-colorRampPalette(c('green','light blue', 'violet'))(100)
plot(density_map, col=cl)
points(covid_planar)

#pUTTING THE COUNTRIE ONTOP OF THE MAP
install.packages("rgdal")
