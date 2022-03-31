library(raster)
library(RStoolbox)
sewtwd("C:/lab/")
# import the first file -> defor1_.jpg -> give it the name l1992
l1992 <- brick("defor1_.jpg")
l1992
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
# layer 1 = NIR
# layer 2 = red
# layer 3 = green
l2006 <- brick("defor2_.jpg")
l2006
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")
# multiframe with the two images, one on top of the other
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plotRGB(l2006, r=1, g=2, b=3, stretch="lin")
# DVI = NIR - red 
dvi1992 = l1992[[1]] - l1992[[2]]
dvi1992
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
# giallo messo nella parte intermedia dello spettro per mostrare deforestazione
plot(dvi1992, col=cl)
dvi2006 = l2006[[1]] - l2006[[2]]
# alternativamente: # dvi1992 = l1992$defor2_.1 - l1992$ defor2_.2
# dvi difference in time
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dvi_dif, col= cld)
# rosso: punti in cui la differenza tra 1992 e 2006 è molto alta
# day2
range DVI (8 bit): -255 a 255
range NDVI (8 bit): -1 a 1
# range DVI (16 bit) = - 65535 a 65535
# range NDVI (16 bit) = - 1 a 1
library(raster)
setwd("C:/lab/")
l1992 <- brick("defor1_.jpg")
l1992
l2006 <- brick("defor2_.jpg")
dvi1992 = l1992[[1]] - l1992[[2]]
ndvi1992 = dvi1992/(l1992[[1]] + l1992[[2]])
ndvi1992
plot(ndvi1992, col=cl)
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)
# 2006 
dvi2006 = l2006[[1]] - l2006[[2]]
ndvi2006 = dvi2006/(l2006[[1]] + l2006[[2]])
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)
# valore dell'ndvi era alto (verso valori dell'1) nel 1992, ma nel 2006 è diventato molto più basso, verso -1
# automatic spectral indices (si)
si1992 <- spectralIndices(l1992, green=3, red=2, nir=1)
plot(si1992, col=cl)
# codice del professore: si1992 <- spectralIndices(l1992, green=3, red=2, nir=1)
# si1992 <- spectralIndices(l1992, green=3, red=2, nir=1)
# plot(si1992,col=cl)

install.packages("rasterdiv")
library(rasterdiv)
# cop sta per copernicus: 8-bit raster, media globale dell'NDVI in un certo lasso di tempo 
plot(copNDVI)
# zone verdi sono quelle con più biomassa (foreste di conifere e fascia equatoriale)


