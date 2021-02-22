### Vegetation and temperature variation from 2011 to 2021

###TEMPERATURE DATA
##https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Browse;Root=1000101;Collection=29870072;DoSearch=true;Time=NORMAL,NORMAL,1,JANUARY,2006,31,DECEMBER,2022
#11-20/01/20
#to let R work with raster files
library(raster)
# to read the copernicus data in .nc format 
library(ncdf4)
##################################10-daily LST Daily Cycle Global V1 (142 products)	!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# set the working directory
setwd("C:/lab/")
t_0120 <- raster("LST012020.nc")
t_0820 <- raster("LST082020.nc")
#to change the map colors
clt <- colorRampPalette(c('blue','yellow','red'))(100)
#crop Italy
ext <- c(0,20,35,48)
t_0120_it<- crop (t_0120, ext)
plot(t_0120_it, col=clt, main="LST january 2020")
t_0820_it<- crop (t_0820, ext)
plot(t_0820_it, col=clt, main="LST august 2020")

#to compare the images
par(mfrow=c(1,2))
plot(t_0120_it)
plot(t_0820_it)

f <- raster("c_gls_LST_202001221400_GLOBE_GEO_V1.2.1.nc")



###VEGETATION DATA
https://neo.sci.gsfc.nasa.gov/archive/gs/MOD_NDVI_M/



####TEMPERATURE
#Land Surface Temperature/Emissivity Monthly L3 Global 0.05Deg CMG 	MOD11C3 	MYD11C3
#https://e4ftl01.cr.usgs.gov/MOLT/MOD11C3.006/
#01/2001
#04/2001
#08/2001


#to let R work with raster files
library(raster)
#to add file to the project
setwd("C:/lab/") 
T_2001_01<- raster("TEMP_200101.jpg")
T_2001_04<- raster("TEMP_200104.jpg")
T_2001_08<- raster("TEMP_200108.jpg")
clt <- colorRampPalette(c('darkslateblue','firebrick1','gold1'))(100)



#crop Italy
ext <- c(12,50, 42, 50)#####################CONTROLLO FUNZIONE!
T_2001_01_it<- crop (T_2001_01, ext)


##########################################################################################################################
> install.packages("ncdf4")
Warning in install.packages("ncdf4") :
  'lib = "C:/Program Files/R/R-4.0.4/library"' is not writable
--- Please select a CRAN mirror for use in this session ---
provo con l'URL 'https://cran.stat.unipd.it/bin/windows/contrib/4.0/ncdf4_1.17.zip'
Content type 'application/zip' length 3267795 bytes (3.1 MB)
downloaded 3.1 MB

package ‘ncdf4’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Acer\AppData\Local\Temp\Rtmpoh2XtN\downloaded_packages
> install.packages("raster")
Installing package into ‘C:/Users/Acer/Documents/R/win-library/4.0’
(as ‘lib’ is unspecified)
also installing the dependencies ‘sp’, ‘Rcpp’

provo con l'URL 'https://cran.stat.unipd.it/bin/windows/contrib/4.0/sp_1.4-5.zip'
Content type 'application/zip' length 1821285 bytes (1.7 MB)
downloaded 1.7 MB

provo con l'URL 'https://cran.stat.unipd.it/bin/windows/contrib/4.0/Rcpp_1.0.6.zip'
Content type 'application/zip' length 3253235 bytes (3.1 MB)
downloaded 3.1 MB

provo con l'URL 'https://cran.stat.unipd.it/bin/windows/contrib/4.0/raster_3.4-5.zip'
Content type 'application/zip' length 3563321 bytes (3.4 MB)
downloaded 3.4 MB

package ‘sp’ successfully unpacked and MD5 sums checked
package ‘Rcpp’ successfully unpacked and MD5 sums checked
package ‘raster’ successfully unpacked and MD5 sums checked

The downloaded binary packages are in
        C:\Users\Acer\AppData\Local\Temp\Rtmpoh2XtN\downloaded_packages
> 
> library(ncdf4)
> library(raster)
Carico il pacchetto richiesto: sp
> setwd("C:/lab/") 
> rlist <- list.files(pattern="SWESK")




