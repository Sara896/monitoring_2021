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

#########deforestation example########
library(RStoolbox)
 
setwd("C:/lab/")

setwd("C:/lab/")


defor1 <- brick("defor1_.jpg")  
defor1

plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
#
defor2<- brick("defor2_.jpg")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

#####calculate 2 index, how they change in time########
###   DVI  #####
defor1#to see the name of the layers
dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
dev.off()
plot(dvi1)

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1, col=cl)
#dvi after the cut
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi2, col=cl)

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI before cut")
plot(dvi2, col=cl, main="DVI after cut")

# difference biomass before cut and after cut, which mean the amount of energy lost in the ecosystem
#hiher the value of the pixell, higher the loss
difdvi <- dvi1 -dvi2
dev.off()
plot(difdvi)

cldif <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cldif, main="amount of energy lost!")

