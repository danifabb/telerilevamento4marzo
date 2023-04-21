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
# alternativamente: # dvi1992 = l1992$defor2_.1 - l1992$ defor2_.2dvi1992
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) 
# giallo messo nella parte intermedia dello spettro per mostrare deforestazione
# tutto ciò che è rosso scuro è sano, tutto ciò che è giallo sta soffrendo (a parte il fiume)
# 2006: foresta molto frammentata, corridoi forestati ma tanta area gialla
plot(dvi1992, col=cl)

dvi2006 = l2006[[1]] - l2006[[2]]
plot(dvi2006, col=cl)

# dvi difference in time - confronto zone in cui dvi era alto nel 1992 mentre nel 2006 invece è basso causa deforestazione
# si può essere abbassato ad esempio da 220 a 50
dvi_dif = dvi1992 - dvi2006
cld <- colorRampPalette(c('blue','white','red'))(100)
plot(dvi_dif, col= cld)
# rosso: punti in cui la differenza tra 1992 e 2006 è molto alta

# day2
#range DVI (8 bit): -255 a 255
#range NDVI (8 bit): -1 a 1
# range DVI (16 bit) = - 65535 a 65535
# range NDVI (16 bit) = - 1 a 1
# NDVI può essere usato per risoluzione radiometrica differente
library(raster)
setwd("C:/lab/")
l1992 <- brick("defor1_.jpg") #immagine a 8 bit
l1992
l2006 <- brick("defor2_.jpg") # immagine a 8 bit
dvi1992 = l1992[[1]] - l1992[[2]]
ndvi1992 = dvi1992/(l1992[[1]] + l1992[[2]]) # standardizzazione di DVI per confronto con l'immagine del 2006
ndvi1992 # da -1 a 1
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(ndvi1992, col=cl) # parti rosso chiaro in cui c'è stata deforestazione
# il -1 di NDVI è dell'acqua, però qui invece l'acqua è giallo (un po' più alto) a causa dei sedimenti; è giallo anche irl
# l'NDVI dell'acqua è uguale a quello del suolo aperto 
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

# automatic spectral indices (si) - calcolo automaticamente NDVI
install.packages("RStoolBox")
library(RStoolBox)
si1992 <- spectralIndices(l1992, green=3, red=2, nir=1) # calcola automaticamente tutti gli indici possibili per quelle 3 bande (NDVI, SAVI, NDWI, ecc)
# NDWI è ACQUA per ogni singolo pixel! Per siccità. Normalized Difference Water Index. 
# Nel 2006 vediamo stress idrico dovuto a distruzione foresta, si abbassa l'indice, va verso -1 (più rosso e meno giallo)
plot(si1992, col=cl)
si2006 <- spectralIndices(l2006, green=3, red=2, nir=1)
plot(si2006,col=cl)

install.packages("rasterdiv") # diversità misurata su dati raster, partendo dall'ecologia di comunità (Shannon, Pielou, Simpson, ecc)
library(rasterdiv)
# cop sta per copernicus: 8-bit raster, media globale dell'NDVI in un certo lasso di tempo 
plot(copNDVI) # NDVI di Copernicus - media globale dell'NDVI dal 1999 al 2007. Più l'indice è alto, più c'è vegetazione e biomassa
# zone verdi sono quelle con più biomassa (foreste di conifere e fascia equatoriale)

# day 3
# Time series analysis
# Greenland increase of temperature


