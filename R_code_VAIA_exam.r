#I want to investigate the effects of the Vaia storm that hit North-eastern Italy on October 27-30th 2018
#for my study I choose 2 index
#NDVI 
#FCOVER

#I use satellite imagine from copernicus program provided by ESA, sensor SPOT-VGT, PROBA-V with a resolution of 1 Km
# 
# compare NDVI for october 2018 and november 2018 
# compare FCOVER for october 2018 and november 2018

# NDVI for october 2017 and november 2017 
# FCOVER for october  2017 and november 2017

#in the end I want to compare NDVI and FCCOVER from june 2018 and june 2019 to avoid problems on remote sensing due to clouds cover




#we need a package to work with raster, gridded images composed by pixels
#if a package isn't already installed in R we have to use the function install.packages
#install.packages(raster)
library(raster) 

#for remote sensing image processing and analysis 
library(RStoolbox)

#to read .nc files provided by copernicus program
library(ncdf4)

#to plot graphs of the calculated values around the maps 
library(rasterVis) #to use the function levelplot

                            
                             

 
###############################     2018    ##################



#first I want to compare the NDVI from october to november 2018

# data from: https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home
#Vegetation Indicators - NDVI 1km V2.2 Global
#NDVI_201810010000_GLOBE_PROBAV_V2.2.1	01/10/2018	10/10/201
#NDVI_201811110000_GLOBE_PROBAV_V2.2.1	11/11/2018	20/11/2018

#to set the working directory to upload data into R
setwd("C:/lab/")

# we use raster function to upload the satellite images
N1018<-raster("c_gls_NDVI_201810010000_GLOBE_PROBAV_V2.2.1.nc") #october
N1118<-raster("c_gls_NDVI_201811110000_GLOBE_PROBAV_V2.2.1.nc") #november

#if we want to see the uploaded raster
plot(N1018)


#we want to zoom on our interested area, North-East Italy
#do an array to set the coordinates
ext<-c(7,14,44,48)

#to crop the images
vN1018<-crop(N1018, ext)
vN1118<-crop(N1118, ext)

#if we want to plot the coastline map
#...and if we have a shapefile with them..
library(rgdal)
coastlines <-readOGR("ne_10m_coastline.shp")
plot(coastlines, add = TRUE)

#for the NDVI maps I have choosen a colour rampalette whichi is :Perceptually uniform, Perceptually ordered and Colour­vision­deficiency (CVD) friendly
#http://www.fabiocrameri.ch/colourmap-type.php
install.packages('scico')
library(scico)
scico_palette_show()#to see the palettes in the package
scico(10, palette = 'bamako') # to see 10 colors in the choosen palette
#to set the colors of the maps
cNDVI<-colorRampPalette(c("#FFE599","#EFD67A","#DFC55B","#CBB33A","#AE9D1A", "#929104","#7A8B05" ,"#647F12", "#53751B", "#436A25"))(100)

#to see the images
par(mfrow=c(1,2)) #to show them togheter on the same row with 2 columns
# col= to attach the rampalette
# main= let us give a title to the image
plot(vN1018, col=cNDVI, main="NDVI october 2018") #plot the image
plot(vN1118, col=cNDVI, main="NDVI november 2018")




#the differences in cover vegetation
#used data:
#FCOVER-----FCOVER 1km Global V1
# FCOVER_201810030000_GLOBE_PROBAV_V1.5.1	15/09/2018	15/10/2018
#	FCOVER_201811230000_GLOBE_PROBAV_V1.5.1	05/11/2018	05/12/2018

fc1018<- raster("c_gls_FCOVER_201810030000_GLOBE_PROBAV_V1.5.1.nc")
fc1118<- raster("c_gls_FCOVER_201811230000_GLOBE_PROBAV_V1.5.1.nc")

vfc1018<- crop(fc1018, ext)
vfc1118<- crop(fc1118, ext)

#a Ramppalette for the FCOVER
cFCOVER<-colorRampPalette(c('red', 'yellow', 'forestgreen'))(100)
par(mfrow=c(1,2))
plot(vfc1018, col=cFCOVER, main="FCover october 2018")
plot(vfc1118, col=cFCOVER, main="FCover november 2018")



#how the NDVI is changed from october to november 2018
# minus function subtract the value of each correspondent pixels in the 2 layers
difN<- vN1018-vN1118 
par(mfrow=c(1,2))
cdif<- colorRampPalette(c('black','darkmagenta', 'pink', 'yellow', 'lightsalmon'))(100)
plot(difN, col=cdif) 
#to do an istrogramm which plot the frequency of the values,how much pixel have that value?
# xlab= to title the x axes
hist(difN, col='springgreen', xlab= 'NDVI variation') 
                                                      

dev.off() # to cancel the graphs and them settings, let use create nez graphs with new settings

levelplot(difN) # to do graphs around the map showing the mean frequences of the values along considered latitude and longitude

diffc <- vfc1018-vfc1118
par(mfrow=c(1,2))
plot(diffc, col=cdif)
hist(diffc, col='blue', xlab= 'FCOVER variation') 
dev.off()
levelplot(diffc)

par(mfrow=c(3,2)) 
plot(vN1018, col=cNDVI, main="NDVI october 2018")
plot(vN1118, col=cNDVI, main="NDVI november 2018")
plot(vfc1018, col=cFCOVER, main="FCover october 2018")
plot(vfc1118, col=cFCOVER, main="FCover november 2018")
plot(difN, col=cdif, main="variazione NDVI 2018")
plot(diffc, col=cdif, main="variazione FCover 2018")


#####################  2017 ###################################
#Vegetation Indicators - NDVI 1km V2.2 Global
#NDVI_201710010000_GLOBE_PROBAV_V2.2.1	01/10/2017	10/10/2017	
#NDVI_201711110000_GLOBE_PROBAV_V2.2.1	11/11/2017	20/11/2017	
#Vegetation Properties - FCOVER 1km Global V1
#FCOVER_201711230000_GLOBE_PROBAV_V1.5.1	05/11/2017	05/12/201
#FCOVER_201710030000_GLOBE_PROBAV_V1.5.1	15/09/2017	15/10/201

#I want to compare NDVI and FCOVER from october to november 2017


# we use raster function to upload the satellite images
N1017<-raster("c_gls_NDVI_201710010000_GLOBE_PROBAV_V2.2.1.nc")
N1117<-raster("c_gls_NDVI_201711110000_GLOBE_PROBAV_V2.2.1.nc")
fc1017<- raster("c_gls_FCOVER_201710030000_GLOBE_PROBAV_V1.5.1.nc")
fc1117<- raster("c_gls_FCOVER_201711230000_GLOBE_PROBAV_V1.5.1.nc")

#to crop the images 
vN1017<-crop(N1017, ext)
vN1117<-crop(N1117, ext)
vfc1017<- crop(fc1017, ext)
vfc1117<- crop(fc1117, ext)

par(mfrow=c(2,2)) #2 rows and 2 columns
plot(vN1017,col=cNDVI, main="NDVI october 2017")
plot(vN1117,col=cNDVI, main="NDVI november 2017")
plot(vfc1017,col=cFCOVER, main="FCover october 2017")
plot(vfc1117,col=cFCOVER, main="FCover november 2017")

#how the NDVIis is changed from october to november 2017
difN17<- vN1017-vN1117
par(mfrow=c(1,2))
plot(difN17, col=cdif)
hist(difN17, col='springgreen', xlab= 'NDVI variation') 
dev.off()
levelplot(difN17) 

#how the FCOVER is changed from october to november 2017
diffc17 <- vfc1017-vfc1117
par(mfrow=c(1,2))
plot(diffc17, col=cdif)
hist(diffc17, col='blue', xlab='FCOVER variation') #to do an istrogramm which plot the frquency of the values,how much pixel have one value?
dev.off()
levelplot(diffc17) 

#I want to do a match between the different NDVI changes

par(mfrow=c(2,2)) #3 rows and 2 columns
plot(vN1017, col=cNDVI, main="NDVI october 2017")
plot(vN1117, col=cNDVI, main="NDVI november 2017")
plot(vN1018, col=cNDVI, main="NDVI october 2018")
plot(vN1118, col=cNDVI, main="NDVI november 2018")


###### june ###############
# how is the vegetation changed from june 2018 to june 2019?
n0618<-raster("c_gls_NDVI_201806010000_GLOBE_PROBAV_V2.2.1.nc")
n0619<-raster("c_gls_NDVI_201906010000_GLOBE_PROBAV_V2.2.1.nc")
f0618<-raster("c_gls_FCOVER_201806230000_GLOBE_PROBAV_V1.5.1.nc")
f0619<-raster("c_gls_FCOVER_201906230000_GLOBE_PROBAV_V1.5.1.nc")
vn0618<-crop(n0618,ext)
vn0619<-crop(n0619,ext)
vf0618<-crop(f0618,ext)
vf0619<-crop(f0619,ext)


par(mfrow=c(2,2))
plot(vn0618,col=cNDVI,main="NDVI june 2018")
plot(vn0619,col=cNDVI,main="NDVI june 2019")
plot(vf0618, col=cFCOVER,main="FCOVER june 2018")
plot(vf0619, col=cFCOVER,main="FCOVER june2019")

difN1819 <- vn0618-vn0619
par(mfrow=c(1,2))
plot(difN1819, col=cdif)
hist(difN1819, col='springgreen', xlab= 'NDVI variation') 
dev.off()
levelplot(difN1819) 


diffc1819 <- vf0618-vf0619
par(mfrow=c(1,2))
plot(diffc1819, col=cdif)
hist(diffc1819, col='blue', xlab= 'FCOVER variation') 
dev.off()
levelplot(diffc1819)  

par(mfrow=c(1,2))
plot(vn0618,col=cNDVI,main="NDVI june 2018")
plot(vn0619,col=cNDVI,main="NDVI june 2019")

####################################JUNE 3000 ###################################

NDVI300_201906010000_GLOBE_PROBAV_V1.0.1	01/06/2019	10/06/2019	
NDVI300_201806010000_GLOBE_PROBAV_V1.0.1	01/06/2018	10/06/2018

n0618_300<-raster("c_gls_NDVI300_201806010000_GLOBE_PROBAV_V1.0.1.nc")
n0619_300<-raster("c_gls_NDVI300_201906010000_GLOBE_PROBAV_V1.0.1.nc")

vn0618_300<-crop(n0618_300,ext)
vn0619_300<-crop(n0619_300,ext)

par(mfrow=c(1,2))
plot(vn0618_300,col=cNDVI,main="NDVI june 2018")
plot(vn0619_300,col=cNDVI,main="NDVI june 2019")

difN1819_300 <- vn0618_300-vn0619_300
par(mfrow=c(1,2))
plot(difN1819_300, col=cdif)
hist(difN1819_300, col='springgreen', xlab = "NDVI Index Value') #to do an istrogramm which plot the frquency of the values,how much pixel have one value?
dev.off()
levelplot(difN1819) 

######################## zoom more ############
ext<-c(9.5,14,45,47.5)

vn0618<-crop(n0618,ext)
vn0619<-crop(n0619,ext)
vf0618<-crop(f0618,ext)
vf0619<-crop(f0619,ext)

difN1819 <- vn0618-vn0619
diffc1819 <- vf0618-vf0619

par(mfrow=c(2,2))
plot(difN1819, col=cdif)
hist(difN1819, col='springgreen', xlab= 'NDVI variation') 
plot(diffc1819, col=cdif)
hist(diffc1819, col='blue', xlab= 'FCOVER variation') 

levelplot(difN1819, main='NDVI variation') 
levelplot(diffc1819,main='FCOVER variation')  

##############################################################################################   end  ###############################################





