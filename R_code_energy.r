#

install.packages("rasterdiv")
library(rasterdiv)
library(raster)
install.packages("rasterVis")
library(rasterVis)

#load data
data(copNDVI)
plot(copNDVI)

#overwrote the previous fle removing the blue which is not usefull for us
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)


#coloryellowminimale colors ( how to lie, we are evidencing
#the minimum parameters because them are yellow so our eyes catch more them
clymin <- colorRampPalette(c('yellow','red','blue'))(100) # 
plot(copNDVI, col=clymin)


clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)


#to catch the higher biomass
clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)

#to match the 2 maps
par(mfrow=c(1,2))
clymed <- colorRampPalette(c('red','yellow','blue'))(100) # 
plot(copNDVI, col=clymed)
clymax <- colorRampPalette(c('blue','red','yellow'))(100) # 
plot(copNDVI, col=clymax)


#to zoom i  a certain part of the planet7
#1 decide the extension of the area
#put the minimum latitude ax 0,20
# longitude 35,55
#
# crop
ext <- c(0,20,35,55)  # xmin xmax ymin ymax
copNDVI_Italy <- crop(copNDVI, ext)
plot(copNDVI_Italy, col=clymax)


library(RStoolbox)
 
setwd("C:/lab/")

setwd("C:/lab/")


defor1 <- brick("defor1_.jpg")  
