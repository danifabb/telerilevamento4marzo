# R code for multivariate analysis
libray(raster)
library(RStoolbox)
setwd("C:/lab/")
# carichiamo immagine landsat, con le 7 bande separate)
p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)
# partiamo con la PCA
# prima diminuiamo la risoluzione, aggregando pixel (cells), perché la PCA è analisi invasiva - risoluzione passa da 30x30 a 300x300, compattiamo 10 pixel
p224r63_2011res <- aggregate(p224r63_2011, fact=10)
library(ggplot2)
libray(patchwork)
# faccio ggplot di immagine normale e immagine aggregata
g1 <- ggRGB(p224r63_2011, 4, 3, 2)
g2 <- ggRGB(p224r63_2011res, 4, 3, 2)
