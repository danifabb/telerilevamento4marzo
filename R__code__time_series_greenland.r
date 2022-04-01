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
