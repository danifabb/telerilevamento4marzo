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

# DVI
