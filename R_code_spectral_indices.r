library(raster)
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
