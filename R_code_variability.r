library(raster)
library(RStoolbox) # for image viewing and variability calculation
library(ggplot2) # for ggplot plotting
library(patchwork)
x <- c(21, 22, 23, 24, 25)
m <- (21+22+23+24+25) / 5
setwd("~/lab/") # Linux
# setwd("C:/lab/") # Windows
# setwd("/Users/name/Desktop/lab/") # Mac
# band1= NIR
# band2= red
# band3= green
ggRGB(sen, 1, 2, 3)
ggRGB(sen, 2, 1, 3)
ggRGB(sen, 1, 2, 3)
# NIR on g component
ggRGB(sen, 2, 1, 3)
g1 <- ggRGB(sen, 1, 2, 3)
g2 <- ggRGB(sen, 2, 1, 3)
g1+g2
g1/g2
(g1+g2)/(g1+g2)
# calculation of variability over NIR
nir <- sen[[1]]
#attenzione: non dare mai lo stesso  nome a oggetto e funzione. es chiamali sd3 e sd per differenziare. se non R lo vedrà come oggetto e non come funzione
sd3 <- focal(nir, w=matrix(1/9, 3, 3), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100)
plot(sd3, col=clsd)
# plotting with ggplot
ggplot() + geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer))
ggplot() +
+ geom_raster(sd3, mapping =aes(x=x, y=y, fill=layer)) + scale_fill_viridis() + ggtitle("Standard deviation by viridis package")
