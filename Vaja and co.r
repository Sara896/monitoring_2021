#I want to investigate the effects of the Vaia in the Veneto region and the other extreame weather events in Italy
#NDVI before and after Vaia
#LAI before and after VAIA
#I use satellite imagine from copernicus program provided by ESA, sensor SPOT-VGT, PROBA-V with a resolution of 300 m
# 
# NDVI for october 10, 31 2018, november 10 2018 (first analysis)
# FCOVER for october 10, 31 2018, november 10 2018

# NDVI for october 2017 and november 2017 (third analysis)
# FCOVER for october 10, 31 2018, november 10 2018

# NDVI for october 2017 and november 2017
# Fcover for september 2019 and november 2019 (fourth analysis)
# The analysis is made for Veneto region

#differences among 2017 and 2019


#recall raster packages to work with pixels
library(raster)
library(RStoolbox)
#to read .nc files provided by copernicus program
library(ncdf4)
#to plot graphics of the NDVI
library(rasterVis) #to use the function : levelplot

#to set the working directory to upload data into R
setwd("C:/lab/")


###############################     2018    ##################
# data from: https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home
#Vegetation Indicators - NDVI 1km V2.2 Global
#NDVI_201810010000_GLOBE_PROBAV_V2.2.1	01/10/2018	10/10/201
#NDVI_201811110000_GLOBE_PROBAV_V2.2.1	11/11/2018	20/11/2018


# we use raster function to charge the satellite images
N1018<-raster("c_gls_NDVI_201810010000_GLOBE_PROBAV_V2.2.1.nc")
N1118<-raster("c_gls_NDVI_201811110000_GLOBE_PROBAV_V2.2.1.nc")

#we zoom on our interested area, Veneto Region
#to set the coordinates
ext<-c(11, 14, 45, 47)

#to crop the images
vN1018<-crop(N1018, ext)
vN1118<-crop(N1118, ext)

######if I want to plot the coastline map
library(rgdal)
coastlines <-readOGR("ne_10m_coastline.shp")
plot(coastlines, add = TRUE)

#how the NDVIis is changed from october to november 2018
difN<- vN1018-vN1118


#to see the differences in cover vegetation
#FCOVER-----FCOVER 1km Global V1
# FCOVER_201810030000_GLOBE_PROBAV_V1.5.1	15/09/2018	15/10/2018
#	FCOVER_201811230000_GLOBE_PROBAV_V1.5.1	05/11/2018	05/12/2018

fc1018<- raster("c_gls_FCOVER_201810030000_GLOBE_PROBAV_V1.5.1.nc")
fc1118<- raster("c_gls_FCOVER_201811230000_GLOBE_PROBAV_V1.5.1.nc")

vfc1018<- crop(fc1018, ext)
vfc1118<- crop(fc1118, ext)

diffc <- vfc1018-vfc1118

par(mfrow=c(3,2)) #3 rows and 2 columns
plot(vN1018, main="NDVI october 2018")
plot(vN1118, main="NDVI november 2018")
plot(vfc1018, main="FCover october 2018")
plot(vfc1118, main="FCover november 2018")
plot(difN, main= "variazione NDVI 2018")
plot(diffc, main= "variazione FCover 2018")





#####################  2017 ###################################
#Vegetation Indicators - NDVI 1km V2.2 Global
#NDVI_201710010000_GLOBE_PROBAV_V2.2.1	01/10/2017	10/10/2017	
#NDVI_201711110000_GLOBE_PROBAV_V2.2.1	11/11/2017	20/11/2017	
#Vegetation Properties - FCOVER 1km Global V1
#FCOVER_201711230000_GLOBE_PROBAV_V1.5.1	05/11/2017	05/12/201
#FCOVER_201710030000_GLOBE_PROBAV_V1.5.1	15/09/2017	15/10/201



# we use raster function to charge the satellite images
N1017<-raster("c_gls_NDVI_201710010000_GLOBE_PROBAV_V2.2.1.nc")
N1117<-raster("c_gls_NDVI_201711110000_GLOBE_PROBAV_V2.2.1.nc")

#to crop the images zooming on the Veneto region
vN1017<-crop(N1017, ext)
vN1117<-crop(N1117, ext)

######if I want to plot the coastline map
library(rgdal)
coastlines <-readOGR("ne_10m_coastline.shp")
plot(coastlines, add = TRUE)

#how the NDVIis is changed from october to november 2018
difN17<- vN1017-vN1117


#to see the differences in cover vegetation
fc1017<- raster("c_gls_FCOVER_201710030000_GLOBE_PROBAV_V1.5.1.nc")
fc1117<- raster("c_gls_FCOVER_201711230000_GLOBE_PROBAV_V1.5.1.nc")

vfc1017<- crop(fc1017, ext)
vfc1117<- crop(fc1117, ext)

diffc17 <- vfc1017-vfc1117


par(mfrow=c(3,2)) #3 rows and 2 columns
plot(vN1017, main="NDVI october 2017")
plot(vN1117, main="NDVI november 2017")
plot(vfc1017, main="FCover october 2017")
plot(vfc1117, main="FCover november 2017")
plot(difN17, main= "variazione NDVI 2017")
plot(diffc17, main= "variazione FCover 2017")





######################## 2019   ##########################

#NDVI_201910010000_GLOBE_PROBAV_V2.2.1	01/10/2019	10/10/2019	213.7 MB
#NDVI_201911110000_GLOBE_PROBAV_V2.2.1	11/11/2019	20/11/2019	181 MB
#Vegetation Properties - FCOVER 1km Global V1
#FCOVER_201910030000_GLOBE_PROBAV_V1.5.1	15/09/2019	15/10/2019
#FCOVER_201911230000_GLOBE_PROBAV_V1.5.1	05/11/2019	05/12/2019

# we use raster function to charge the satellite images
N1019<-raster("c_gls_NDVI_201910010000_GLOBE_PROBAV_V2.2.1.nc")
N1119<-raster("c_gls_NDVI_201911110000_GLOBE_PROBAV_V2.2.1.nc")

#to crop the images zooming on the Veneto region
vN1019<-crop(N1019, ext)
vN1119<-crop(N1119, ext)



#how the NDVIis is changed from october to november 2018
difN19<- vN1019-vN1119


#to see the differences in cover vegetation
fc1019<- raster("c_gls_FCOVER_201910030000_GLOBE_PROBAV_V1.5.1.nc")
fc1119<- raster("c_gls_FCOVER_201911230000_GLOBE_PROBAV_V1.5.1.nc")

vfc1019<- crop(fc1019, ext)
vfc1119<- crop(fc1119, ext)

diffc19 <- vfc1019-vfc1119


par(mfrow=c(3,2)) #3 rows and 2 columns
plot(vN1019, main="NDVI october 2019")
plot(vN1119, main="NDVI november 2019")
plot(vfc1019, main="FCover october 2019")
plot(vfc1119, main="FCover november 2019")
plot(difN19, main= "variazione NDVI 2019")
plot(diffc19, main= "variazione FCover 2019")








#we want to change the colours of the map so use the function colorRampalette, puttingig the value of no cover vegetation in yellow to evidence where the vegetation has been damaged


