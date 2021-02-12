#R_code_exam_simulation.r
#we need a library to read nc data

#nc data: we need  library
# https://cran.r-project.org/web/packages/ncdf4/index.html

# install.packages("ncdf4")

v
library(ncdf4)
library(raster)
# setwd("C:/lab/")

tjan <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(tjan)

# Exercise: change the colorramppalette
cltjan <- colorRampPalette(c('blue','yellow','red'))(100) # 
plot(tjan, col=cltjan)

toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(toct, col=cltjan)

dift <- tjan - toct
cldif <- colorRampPalette(c('blue','white','red'))(100) # 
plot(dift, col=cldif)
