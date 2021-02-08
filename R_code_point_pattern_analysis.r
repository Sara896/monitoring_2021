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

#to plot

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

#to read the coastline and attach them to the map, we havo to install readOGR
#before recall rgdal
library(rgdal)

coastlines<-readOGR("ne_10m_coastline.shp")

#to see the coastlines
plot(density_map)
points(covid_planar)
plot(coastlines, add=TRUE)


#per salvare le immagini
png("figure1.png")
plot(density_map)
points(covid_planar)
plot(coastlines, add=TRUE)
dev.off()

pdf("figure1.pdf")
plot(density_map)
points(covid_planar)
plot(coastlines, add=TRUE)
dev.off()
#interpolate case data, vedo la mappa che evidenzia dove ci sono più casi
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)

plot(cases_map)
points(covid_planar)
plot(coastlines, add=TRUE)

install.packages("sf")
library(sf)
Spoints<- st_as_sf(covid, coords =c("lon","lat"))
# to plot the point dimension by the number of cases
plot(Spoints, cex=Spoints$cases, col= 'purple3', lwd=3, add=T)
#per sistemare
plot(Spoints, cex=Spoints$cases/10000, col= 'purple3', lwd=3, add=T)


########Leonardo Zabotti data#########
setwd("C:/lab/")
leo <- read.table("dati_zabotti.csv", header=T, sep=",")
#product the map
summary(leo) #to see the max and min values of X and Y
library(spatstat)
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))
plot(leo_ppp)


density_map<- density(leo_ppp)
plot(density_map)
points(leo_ppp)


                  
                 


