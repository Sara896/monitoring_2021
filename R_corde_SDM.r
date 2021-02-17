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
 #stack all the preictors togheter
preds <- stack(lst)
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)

#yo see only one predictor and the occurrence on it
plot(preds$elevation, col=cl, main=elevation)
points(species[species$Occurrence == 1,], pch=16) #we can see that species don't love elevation

plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

#make the model to drr thr prediction on the probability of the distribution
#explain to R and sdm packagewhat are the data we are going to use
# set the data for the sdm
datasdm <- sdmData(train=species, predictors=preds)
#the trains is the training set to build thr model
# set the data for the sdm
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=datasdm, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds) 

# plot the output
plot(p1, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# add to the stack
s1 <- stack(preds,p1)
plot(s1, col=cl)

# Do you want to change names in the plot of the stack?
# Here your are!:
# choose a vector of names for the stack, looking at the previous graph, qhich are:
names(s1) <- c('elevation', 'precipitation', 'temperature', 'vegetation', 'model')
# and then replot!:
plot(s1, col=cl)
# you are done, with one line of code (as usual!)


