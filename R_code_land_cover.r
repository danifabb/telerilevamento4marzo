# code for generating land cover maps from satellite images
library(raster)
library(RStoolbox)
setwd("C:/lab/")
l92 <- brick("defor1_.jpg")
# nir 1, r 2, b 3
plotRGB(l92, 1, 2, 3, stretch="lin")



