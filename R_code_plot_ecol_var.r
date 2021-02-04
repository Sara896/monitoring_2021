#this is a comment

# R code for plotting the relathionship between or among ecological variables
install.packages("sp")
library(sp) 

#to see the data available in the package
#meuse is a dataset used for multivariate analysis
data(meuse)
#see data in meuse
meuse

#to view the data
View(meuse)

head(meuse)
#mean of the all values
# 1
summary(meuse)

#plot zinc (y) against cadmium (x)
#error
plot(cadimum, zinc)
#Error in h(simpleError(msg, call)) : 
  error in evaluating the argument 'x' in selecting a method for function 'plot': oggetto "cadimum" non trovato
> 

#R non capisce che il cadmio è tra i dati, per dirglielo
#$

plot(meuse$cadmium, meuse$zinc)

#per collegare tutti i dati
attach(meuse)
plot(cadmium, zinc)

plot(cadmium,lead)

#scatterplot matrices (plot all the variables)
pairs(meuse)

#pairing only the element part of the variables
pairs(cadmium, copper, lead, zinc)
cpairs(~cadmium + copper + lead + zinc, data=meuse) 
pairs(~cadmium + copper + lead + zinc, data=meuse, col="green") 

#change symbol to filled triangle
pairs(~cadmium + copper + lead + zinc, data=meuse, col="green", pch=17) 


#increas the size of the charactrs
pairs(~cadmium + copper + lead + zinc, data=meuse, col="green", pch=17, cex=5
     )
pairs(~cadmium + copper + lead + zinc, data=meuse, col="green", pch=17, cex=3
     )
