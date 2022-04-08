# time series analysis of LST data
library(raster)
setwd("C:/lab/Greenland")
# abbiamo quattro dati diversi, ovvero quattro LST in quattro date diverse
#importo un singolo dato, 1 LST
lst2000 <- raster("lst_2000.tif")
# valori da 1 a 65535 - 16 bit
plot(lst2000)
# parte centrale è quella più fredda
# import all the data
lst2005 <- raster("lst_2005.tif")
lst2010 <- raster("lst_2010.tif")
lst2015 <- raster("lst_2015.tif")
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
par(mfrow=c(2,2))
plot(lst2000, col=cl)
plot(lst2005, col=cl)
plot(lst2010, col=cl)
plot(lst2015, col=cl)
# parte centrale diventa meno intensa nel colore 
# applico la funzione raster ad una serie di elementi con lapply
rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist, raster)
# mettiamo lst nella stessa immagine, per evitare di usare il multiframe, con s
tgr <- stack(import)
tgr
plot(tgr, col=cl)
plot(tgr[[1]], col=cl)
# elementi montati su bande diverse con RGB, sovrapposizione temporale, bande sovrapposte nella stessa immagine
plotRGB(tgr, r=1, g=2, b=3, stretch="lin")

library(raster)
# ex 2: NO2 decrease during lockdown
setwd("C:/lab/en")
# importiamo il primo dato
en01 <- raster("EN_0001.png")
cl <- colorRampPalette(c('red','orange','yellow'))(100)
plot(en01, col=cl)
# importiamo il 13esimo dato
en13 <- raster("EN_0013.png")
# import the whole set of images with list.files, lapply and stack
enlist <- list.files(pattern="EN")
enlist
# applico funzione raster a tutti e tredici gli elementi, ovvero li importo tutti
import <- lapply(enlist, raster)
# stack mette tutti i file in un multiframe (stessa immagine)
tgen <- stack(import)
plot(tgen, col=cl)
# plot en1 besides en13
par(mfrow=c(1,2))
plot(en01, col=cl)
plot(en13, col=cl)
# oppure
en113 <- stack(tgen[[1]], tgen[[13]])
plot(en113, col=cl)

# let's make the difference
difen <- en[[1]] - en[[13]]
cldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difen, col=cldif)
# importo dato dal blocco note a R
source("R_inputcode.txt")
[16:48] Duccio Rocchini
rlist <- list.files(pattern="EN") # lapply(X,FUN)
rimp <- lapply(rlist, raster) # stack
en <- stack(rimp)
# plot everything
plot(en, col=cl)
plotRGB(en, r=1, g=7, b=13, stretch="lin")


