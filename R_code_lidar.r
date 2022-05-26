# R code for analysing liDAR data
# calcolare CHM di un'area; prendiamo il DSM già calcolato e il DTM ovvero il suolo e facciamo differenza
library(raster)
library(RStoolbox)
library(viridis)
library(ggplot2)
dsm_2004 <- raster("2004Elevation_DigitalElevationModel-2.5m.tif")
# risol 2,5 m x 2,5 m
dtm_2004 <- raster("2004Elevation_DigitalTerrainModel-2.5m.tif")
plot(dsm_2004)
# vedo montagna e valle
plot(dtm_2004)
chm_2004 <- dsm_2004 - dtm_2004
# ogni colore rappresenta un'altezza, bianco è 0, quindi sarà il terreno
dsm_2013 <- raster("2013Elevation_DigitalElevationModel-0.5m.tif")
# mezzo metro di risoluzione nel 2013
dtm_2013 <- raster("2013Elevation_DigitalTerrainModel-0.5m.tif")
chm_2013 <- dsm_2013-dtm_2013
# differenza tra i due valori per vedere cosa è cambiato
difference <- chm_2013 - chm_2004
# error because of different resolution
# we have to lose better resolution to make it the same as in 2004
chm_2013_resampled <- resample(chm_2013, chm_2004)
# fa la media tra i due di default, se non gli dai un metodo
difference <- chm_2013_resampled - chm_2004
# calcola differenza in ggplot - si vede che il bosco è cresciuto in altezza, invece le parti in blu sono scomparse
# a volte ci possono essere errori di valutazione perché si è persa risoluzione: il bosco risulta essere cresciuto di 20 m, improbabile
ggplot() + 
  geom_raster(difference, mapping =aes(x=x, y=y, fill=layer)) + 
  scale_fill_viridis() +
  ggtitle("CHM difference San Genesio/Jenesien")
  install.packages("lidR")
  library(lidR)
  point_cloud <- readLAS("point_cloud.laz")
  plot(point_cloud)
