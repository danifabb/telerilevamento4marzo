# questo è il primo script che useremo a lezione

#install.packages("raster")
library(raster)
setwd("C:/lab/")

#import di un oggetto
l2011 <- brick("p224r63_2011.grd") # RasterBrick object = multi-layer raster object typically created from a multi-layer (band) file
# p sta per path
l2011 #landsat2011
 
# plot
plot(l2011)
# vettore o array = insieme di elementi es. c(2, 4, 7)
cl <- colorRampPalette(c("black", "grey", "light grey")) (100) # a vector of colors; i colori vanno tra virgolette; 100 è il numero di tonalità tra nero e light grey
# plot per mettere in relazione due funzioni
plot(l2011, col=cl) # plot delle singole bande con la legenda da noi definita
# le bande rappresentano la riflettanza dei vari colori (luce riflessa su quella incidente)

# Landsat ETM+ = Enhanced Thematic Mapper+, sensore montato a bordo del satellite Landsat
# immagine di riserva Parakana, in Brasile, che ha subito deforestazione
# sensore percepisce 7 bande spettrali, consideriamo le prime 4
# b1 = blu
# b2 = verde
# b3 = rosso
# b4 = infrarosso vicino (NIR)
# plot della banda del blu (B1_sre)
plot(l2011$B1_sre) # segno del dollaro lega 2 pezzi di R, in questo caso l'immagine satellitare con la banda
# oppure
plot(l2011[[1]]) # parentesi quadra doppia = elemento interno a R - individuo il layer, il singolo elemento 

# plot b1 from dark blue to light blue
clb <- colorRampPalette(c("dark blue", "blue", "light blue")) (100)
plot(l2011$B1_sre, col = clb)

# export image to lab folder
pdf("banda1.pdf")
plot(l2011$B1_sre, col = cl1)
dev.off()
# stessa cosa ma creo file png
png("banda1.png")
plot(l2011$B1_sre, col=clb)
dev.off()

# plot b2 from dark green to green to light green
clg <- colorRampPalette(c("dark green", "green", "light green")) (100)
plot(l2011$B2_sre, col=clg)

# multiframe 
par(mfrow = c(1, 2)) # una roga e due colonne
plot(l2011$B1_sre, col = clb)
plot(l2011$B2_sre, col=clg)
# export multiframe
# export multiframe plot
pdf("multiframe.pdf")
par(mfrow=c(1,2))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
dev.off()
#revert the multiframe; due righe e una colonna
par(mfrow=c(2,1))
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
# let's plot the first four 
par(mfrow=c(2,2)) # 2 righe e 2 colonne
plot(l2011$B1_sre, col=clb)
plot(l2011$B2_sre, col=clg)
# red
clr <- colorRampPalette(c("dark red", "red", "pink")) (100)
plot(l2011$B3_sre, col=clr)
# NIR
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
