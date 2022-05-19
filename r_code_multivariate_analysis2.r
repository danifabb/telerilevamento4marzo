# misura dell'eterogeneità
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
setwd("C:/lab/")
sen <- brick("sentinel.png")
# NIR = b1
# red = banda 2
# green = b3
# usiamo ggplot per fare RGB
ggRGB(sen, r=1, g=2, b=3)
# oppure ggplot(sen, 1, 2, 3)
ggRGB(sen, 1, 2, 3)
# visualise so that the vegetation becomes green fluo and il terreno nudo viola
# ben visibili neve e crepacci
# metto infrarosso su banda verde
ggRGB(sen, 2, 1, 3)
# diamo tutte le bande in pasto alla funzione RasterPCA (multivariate analysis)
sen_pca <- rasterPCA(sen)
# Facciamo summary della funzione sen_pca per vedere quanto spiega la prima componente (67% e quanto spiega la seconda comp (32%). La terza spiega pochissimo: ne bastano due.
# la terza e la quarta sono solo rumore, rumore!
summary(sen_pca$model)
plot(sen_pca$map)
pc1 <- sen_pca$map$PC1
pc2 <- sen_pca$map$PC2 
pc3 <- sen_pca$map$PC3
# prima apro finestra, poi apro la mappa e le estetiche
ggplot() +
geom_raster(pc1, mapping=aes(x=x, y=y, fill=PC1))
g1 <- ggplot() +
geom_raster(pc1, mapping=aes(x=x, y=y, fill=PC1))
g2 <- ggplot() +
geom_raster(pc2, mapping=aes(x=x, y=y, fill=PC2))
g1 + g2 + g3
