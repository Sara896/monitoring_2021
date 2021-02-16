# Species Distribution Modelling
install.packages("sdm")
install.packages("rgdal", dependencies=T)

library(sdm)
library(raster) # predictors
library(rgdal) # species

file <- system.file("external/species.shp", package="sdm") 
species <- shapefile(file)

# looking at the set
species

# plot
plot(species, pch=17)

# looking at the occurrences, the presence or the absence
species$Occurrence

# copy and then write:
plot(species[species$Occurrence == 1,],col='blue',pch=16) #you see in blue the points where the species are present
points(species[species$Occurrence == 0,],col='red',pch=16)


# predictors: look at the path
path <- system.file("external", package="sdm") 

# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) #
lst
