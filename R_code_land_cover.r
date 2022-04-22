# code for generating land cover maps from satellite images
library(raster)
library(RStoolbox)
install.packages("ggplot2")
library(ggplot2)
install.packages("patchwork")
library(patchwork)
setwd("C:/lab/")
l92 <- brick("defor1_.jpg")
# nir 1, r 2, b 3
plotRGB(l92, 1, 2, 3, stretch="lin")
l92b <- brick("defor2_.jpg")
par(mfrow = c(2, 1))
plotRGB(l92, 1, 2, 3, stretch="lin")
plotRGB(l92b, 1, 2, 3, stretch="lin")
ggRGB(l92, 1, 2, 3, stretch="lin")
p1 <- ggRGB(l92, 1, 2, 3, stretch="lin")
p2 <- ggRGB(l92b, 1, 2, 3, stretch="lin")
p1 + p2
p1/p2
l92c <- unsuperClass(l92, nClass=2)
plot(l92c$map)
# classe 1 = bianca (fiume e agricoltura) classe 2 = verde (foresta)
l92bc <- unsuperClass(l92b, nClass=2)
plot(l92bc$map)
# frequenza di pixel di foresta? numero di pixel per ogni classe
freq(l92c$map)
# class 1: 36139
# class 2: 305153
freq(l92bc$map)
# class 1: 164729 (agricoltura)
# class 2: 177997 (foresta)
