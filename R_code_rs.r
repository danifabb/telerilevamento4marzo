# questo è il primo script che useremo a lezione

#install.packages("raster")
library(raster)
setwd("C:/lab/")
l2011 <- brick("p224r63_2011.grd")
l2011
 
# plot
plot(l2011)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(l2011, col=cl)
