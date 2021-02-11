#R code for remote sensing data analysis in ecosystem
install.packages("raster")
install.packages("RStoolbox")

library(raster)
library(RStoolbox)

 setwd("C:/lab/") 
 p224r63_2011 <- brick("p224r63_2011_masked.grd")
 p224r63_2011
 plot(p224r63_2011)
 
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

#to change the palette, if we want to see only the first 4 bands
par(mfrow=c(2,2))

#if we want to change colors only for blue

clb <- colorRampPalette(c('dark blue','blue','light blue'))(100)
plot(p224r63_2011$B1_sre, col=clb)

clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

cly <- colorRampPalette(c('yellow','orange','red'))(100)
plot(p224r63_2011$B4_sre, col=cly)

# dev.off()
#per vedere a colori veri
plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")

#per vedere ad esempio nel vicino infrarosso

plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
à#we have putted the blue in green, red in green,and NIR in yje red componente, 
#so all the vegetation became red because there is a big refòectance

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")

