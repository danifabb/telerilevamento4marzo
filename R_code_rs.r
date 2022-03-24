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
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino
# plot della banda del blu (B1_sre)
plot(l2011$B1_sre)
# oppure
plot(l2011[[1]])
# plot b1 from dark blue to light blue
plot(l2011$B1_sre, col = cl1)
# export image to lab fold
pdf("banda1.pdf")
plot(l2011$B1_sre, col = cl1)
dev.off()
# stessa cosa ma creo file png
# plot b2 from dark green to 
# multiframe 
par(mfrow = c(1, 2))
plot(l2011$B1_sre, col = cl1)
plot(l2011$B2_sre, col=cl2)
# export multiframe
# export multiframe plot
pdf("multiframe.pdf")
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=cl1)
plot(l2011$B2_sre, col=cl2)
# let's plot the first four 
par(mfrow=c(2,2))
plot(l2011$B1_sre, col=cl1)
plot(l2011$B2_sre, col=cl2)
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col=clr)
clnir <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(l2011$B4_sre, col=clnir)

install.packages("RStoolbox")
library(raster)
setwd("C:/lab/")
l2011 <- brick("p224r63_2011.grd")
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col=clr)
# plot RGB layers) - vedo immagine come la vede all'occhio umano
# stretch serve per massimizzare contrato tra i colori
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="lin")
# uso stretch="hist" per vedere meglio la diversità della vegetazione, i frattali della veg
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")

# build a multiframe with visible RGB 
# linear stretch on top of false colours
# histogram stretch
par(mfrow=c(2,1))
plotRGB(l2011, r=3, g=2, b=1, stretch="lin")
plotRGB(l2011, r=3, g=4, b=2, stretch="hist")
l1988 <- brick("p224r63_1988.grd")
l1988
par(mfrow=c(2,1))
plotRGB(l1988, r=4, g=3, b=2, stretch="lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="lin")
