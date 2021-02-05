# R spatial

#recall sp package
library(sp)

data(meuse)
head(meuse)


#see data in space
coordinates(meuse)= ⁓x+y
plot(meuse)

#see the spread of the elements plotting them
spplot(meuse, "zinc")
#put the title
spplot(meuse, "zinc", main="concentration of zinc")

#see copper and zinc in the same graf with two different panels
spplot(meuse, c(zinc, copper))#no
spplot(meuse, c("zinc", "copper"))

#use bubbles instead of colors to show the concentration
bubble(meuse, "zinc")

#do the same for lead and change color
bubbles(meuse, "lead", col="red")
#zinc and lead can't be overlapped
