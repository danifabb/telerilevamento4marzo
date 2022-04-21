# classificazione di natura automatica (pixel simili)
library(raster)
library(RStoolbox)
setwd("C:/lab/")
# data import
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
plotRGB(so, r=1, g=2, b=3, stretch="lin")
# ci sono tre livelli di pixel (3 colori, giallo, nero e intermedio - si disporranno su "nuvole" diverse)
# unsuperClass: non supervisionata, la AI capisce quali sono le classi, noi non glielo diciamo (solo il numero di classi)
soc <- unsuperClass(so, nClasses=3)
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soc$map, col=cl)
# creiamo classi per foto gran canyon: discriminare tra varie classi mineralogiche
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
# rosso =1
# verde =2
# blu = 3
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
# change the stretch to histogram stretching
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
# creiamo solo 2 classi, quindi i valori della legenda che stanno nel mezzo non hanno senso (classe 1= roccia; classe 2 = acqua, ombre)
gcclass2 <- unsuperClass(gc, nClasses=2)
plot(gcclass2$map)
# set.seed(17)
# creiamo più classi - classify the map with 4 classes: si differenziano 2 tipi diversi di roccia, si dovrebbe a quel punto andare sul campo per verificare
gcclass4 <- unsuperClass(gc, nClasses=4)
plot(gcclass4$map)
cl <- colorRampPalette(c('yellow', 'red','blue','black'))(100)
plot(gcclass4$map, col=cl)
# compare the classified map with the original set
par(mfrow=c(2,1))
plot(gcclass4$map, col=cl)
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
st <- stack(gc, gcclass4$map)
plot(st)
