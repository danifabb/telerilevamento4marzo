# Author: Maia Guerra

# With this code I want to check the changes in land cover, with special regard to vegetation, in the area of Yellowstone  
# National Park (YNP) from wolf reintroduction on 12th January 1995 until now, 2022. To do this, I decided to use NASA Landsat
# satellite images, which had a good resolution for the area I was interested in: YNP has an area of 8.991 km² while Landsat 
# resolution is 30 meters, which is definitely a good value.
# I've obtained the images of Landsat 8-9 OLI/TIRS for images of 2015 and 2022, and Landsat 4-5 TM for images of 1995,
# both from landsat 2 - collection 2 on USGS EarthExplorer website. The area I'm going to survey is the National Park itself,
# centered in north-west Wyoming, including a smaller surface of Montana on the north and Idaho on the west.
# To better check the situation of vegetation, the images were selected for each year during the summer period, from the last
# half of July until the end of August. This selection was also due to the images quality, which sometimes had too high 
# percentage of cloud cover and could not be selected for the analysis of this work. The selected images are then cut to be
# centered on the study area, using the code. 
# With this code I will do 3 different analysis: a time series analysis, from 1995, to visualize the changes and the 
# situation after 20 years in 2015, and finally the situation nowadays; I will calculate some spectral indices like DVI and NDVI 
# to highlight places were there have been changes in vegetation and check the health of vegetation; finally, a land cover 
# analysis, to check eventually an increase or decrease in vegetation cover in the 3 years selected (1995, 2015 and 2022).
# This code is divided in 2 main parts: Part I is the import and preparation of data, Part II is about the 3 analysis I made on
# these data. Each one has 3 sections. 

# SECTIONS OF THIS CODE:
### PART I
## 1 - LIBRARIES AND WORKING DIRECTORY
## 2 - IMAGE IMPORT AND CREATION OF THE RASTERBRICKS
## 3 - CUTTING OF THE IMAGES FROM EACH YEAR IN THE SAME AREA
### PART II
## 4 - TIME SERIES ANALYSIS
## 5 - SPECTRAL INDICES
## 6 - LAND COVER



## PART I: data import and preparation ---------------------------------------------------------------------------------------------


##### 1 - LIBRARIES AND WORKING DIRECTORY #####


library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
library(viridis)

setwd("C:/EXAM/")





##### 2 - IMAGE IMPORT AND CREATION OF THE RASTERBRICKS #####


### 2.1 - 1995 images ###

# Raster brick for 1995: import of each image containing a band from 1 to 4 (B1=blue, B2=green, B3=red, B4=NIR) and creation of
# the raster brick. This images were taken on August 27th, 1995.

l1995_B1 <- raster("images_1995/LT05_L2SP_038029_19950827_20200912_02_T1_SR_B1.tif") # B1
l1995_B2 <- raster("images_1995/LT05_L2SP_038029_19950827_20200912_02_T1_SR_B2.tif") # B2
l1995_B3 <- raster("images_1995/LT05_L2SP_038029_19950827_20200912_02_T1_SR_B3.tif") # B3
l1995_B4 <- raster("images_1995/LT05_L2SP_038029_19950827_20200912_02_T1_SR_B4.tif") # B4

# Creation of the list to apply function stack.
list1995 <- list(l1995_B1, l1995_B2, l1995_B3, l1995_B4)

# Creation of the raster brick. All the images imported will be assembled and overlapped as layers of a unique image.
lan1995 <- stack(list1995)
lan1995 # check of the correct creation of the image.
plot(lan1995)

# Plot of natural color image with plotRGB function.
plotRGB(lan1995, 3, 2, 1, stretch="hist")
# Numbers 3, 2, 1 in this order define r=3, g=2, b=1, so each color is represented by the right band, giving the natural aspect
# of the image. Argument stretch="hist" stretches the values to increase the contrast of the image and better notice the
# differences between vegetation, water, snow and bare soil.

# Plot of NIR (Near InfraRed) in the red band (B3).
plotRGB(lan1995, 4, 3, 2, stretch="hist")


### 2.2 - 2015 images ###

# Creation of the raster brick from 2015 images. These ones were selected on August 2nd among all 2015 images because of the 
# tidiness from fog, clouds or any other atmospheric obstacle. Landsat 8-9 captures images with red, green, blue and NIR bands
# shifted of +1 number compared to Landsat 4-5, so here the bands are: B1=ultrablue, B2=blue, B3=green, B4=red, B5=NIR.
# I didn't need B1 band for my analysis so I did not consider it in the building of the raster brick.
# To have the same bands in raster bricks from 2015 and 2022 as in the one from 1995, I used bands 2, 3, 4 and 5, instead of 
# 1, 2, 3, and 4 as before.
l2015_B2 <- raster("images_2015/LC08_L2SP_038029_20150802_20200908_02_T1_SR_B2.tif") # B2
l2015_B3 <- raster("images_2015/LC08_L2SP_038029_20150802_20200908_02_T1_SR_B3.tif") # B3
l2015_B4 <- raster("images_2015/LC08_L2SP_038029_20150802_20200908_02_T1_SR_B4.tif") # B4
l2015_B5 <- raster("images_2015/LC08_L2SP_038029_20150802_20200908_02_T1_SR_B5.tif") # B5
list2015 <- list(l2015_B2, l2015_B3, l2015_B4, l2015_B5) # List of bands from 2015 to apply stack.

# Creation of the raster brick for 2015 image.
lan2015 <- stack(list2015)
lan2015 # Check of correct creation of the image.

# Plot of NIR in the red band.
plotRGB(lan2015, 4, 3, 2, stretch="hist")


### 2.3 - 2022 images ###

# Creation of the raster brick from 2022 images. These were selected on 20th July for the same reason mentioned for 2015 images.
# Here again the bands used are B2, B3, B4 and B5.
l2022_B2 <- raster("images_2022/LC08_L2SP_038029_20220720_20220725_02_T1_SR_B2.tif") # B2
l2022_B3 <- raster("images_2022/LC08_L2SP_038029_20220720_20220725_02_T1_SR_B3.tif") # B3
l2022_B4 <- raster("images_2022/LC08_L2SP_038029_20220720_20220725_02_T1_SR_B4.tif") # B4
l2022_B5 <- raster("images_2022/LC08_L2SP_038029_20220720_20220725_02_T1_SR_B5.tif") # B5
list2022 <- list(l2022_B2, l2022_B3, l2022_B4, l2022_B5) # List of bands from 2022.

# Creation of the raster brick for 2022 image.
lan2022 <- stack(list2022)
lan2022

#Plot of NIR in the red band.
plotRGB(lan2022, 4, 3, 2, stretch="hist")





##### 3 - CUTTING OF THE IMAGES FROM EACH YEAR IN THE SAME AREA #####


### 3.1 Cutting of the 3 images ###

# The area I am interested to analyse is much smaller than the full satellite image. To cut out only this area, I used
# drawExtent function (from raster package) to select a square around it, using the cursor on the plot of the 1995 image.
# The square has georeferenced coordinates at its vertexes, so it could be applied also to the other 2 images from 2015
# and 2022. After this operation I've applied the cut on the 3 images using function crop and I've obtained 3 images 
# centered on exactly the same area.

# !! ATTENTION !!: Do not run the following part in curly brackets while reproducing the code, because it requires the square
# to be re-drawn. I've saved the new created images later in the code to use them for the analyses.
# {
# Creation of the cutting square with drawExtent function.
redsquare <- drawExtent(show=T, col="red")
# Cut of the first image (1995) with crop function.
lan1995sq <- crop(lan1995, redsquare) # In the object name "sq" is for "square".
# Plot of the image to check the right cutting.
plotRGB(lan1995sq, 4, 3, 2, stretch="hist")

# Applying of the same cut to the remaining 2 images.
lan2015sq <- crop(lan2015, redsquare)
plotRGB(lan2015sq, 4, 3, 2, stretch="hist")
lan2022sq <- crop(lan2022, redsquare)
plotRGB(lan2022sq, 4, 3, 2, stretch="hist")

# Saving all the new images as .jpg for the next analyses. Exporting in this format (.jpg) saves only the first 3 bands of each
# image, so I saved plots with NIR in the red band and red in the green band to be able to use them in the next analyses.

## 2015
jpeg("lan2015area.jpg")
plotRGB(lan2015sq, 4, 3, 2, stretch="hist")
dev.off()

## 2022
jpeg("lan2022area.jpg")
plotRGB(lan2022sq, 4, 3, 2, stretch="hist")
dev.off()
# }


### 3.2 Solving a little problem of cloud cover for 1995 image ### 

# After cutting all the images centered on the study area, I realized that the cover of clouds in 1995 image caused the loss
# of too much data on the type of land cover at the bottom half of the image. To fix this problem, I've searched USGS website 
# for other images from 1995, caught in the same period of the year, and having less cloud cover in the bottom area of the image.
# The only other good image of the same area without cloud cover I could find was from 26th July, quite a month before the 1995
# image I used at first, from 27th August. Unfortunately, this image had some clouds covering too, but at the top half part of it.
# So, to have an image as clear as possible from 1995, I decided to cut the portions without cloud cover from the 2 images, and
# then put them together using the code.

# Import of the second image from 26th July 1995.
l1995_2_B1 <- raster("images_1995/LT05_L2SP_038029_19950726_20200912_02_T1_SR_B1.tif")
l1995_2_B2 <- raster("images_1995/LT05_L2SP_038029_19950726_20200912_02_T1_SR_B2.tif")
l1995_2_B3 <- raster("images_1995/LT05_L2SP_038029_19950726_20200912_02_T1_SR_B3.tif")
l1995_2_B4 <- raster("images_1995/LT05_L2SP_038029_19950726_20200912_02_T1_SR_B4.tif")
list1995_2 <- list(l1995_2_B1, l1995_2_B2, l1995_2_B3, l1995_2_B4)
lan1995_2 <- stack(list1995_2)
lan1995_2

# !! ATTENTION !!: Do not run this part of the code (in curly brackets) because  of the same reason mentioned before for the 
# cutting of the images.
# {
lan1995_2sq <- crop(lan1995_2, redsquare)
plotRGB(lan1995_2sq, 4, 3, 2, stretch="hist")

# Creation of two rectangles to select the portion of the image that I needed in each satellite image from 1995.
bluesquare <- drawExtent(show = T, col="blue")
greensquare <- drawExtent(show = T, col="green")
lan1995_2bluesq <- crop(lan1995_2, bluesquare)
lan1995greensq <- crop(lan1995, greensquare)

# Plot of the 2 rectangles to check the right creation of the 2 pieces of the image.
plotRGB(lan1995_2bluesq, 4, 3, 2, stretch="hist")
plotRGB(lan1995greensq, 4, 3, 2, stretch="hist")

# Joining of the two pieces using merge function from raster package, which uses georeferentiation to unify correctly the
# pieces in the right place and create a new raster. 
lan1995fin <- merge(lan1995greensq, lan1995_2bluesq, tolerance=0.05, filename="", ext=NULL)
plotRGB(lan1995fin, 4, 3, 2, stretch="hist")

# Saving the new 1995 image.
jpeg("lan1995area.jpg")
plotRGB(lan1995fin, 4, 3, 2, stretch="hist")
dev.off()
# }

# Import of the new images created after the cutting. Here I can plot the images using numbers 1, 2, and 3 because the first band
# is the NIR (the image was previously saved as this): NIR=1, red=2, green=3.
## 1995
lan1995area <- brick("lan1995area.jpg")
plotRGB(lan1995area, 1, 2, 3, stretch="hist")

## 2015
lan2015area <- brick("lan2015area.jpg")
plotRGB(lan2015area, 1, 2, 3, stretch="hist")

## 2022
lan2022area <- brick("lan2022area.jpg")
plotRGB(lan2022area, 1, 2, 3, stretch="hist")


## PART II: data analysis ----------------------------------------------------------------------------------------------------------


##### 4 - TIME SERIES ANALYSIS #####


### 4.1 Time series analysis highlighting NIR reflectance of vegetation. ###

# Here I begin with the first analysis of this code. I've plotted some graphics to compare the images using ggplot2 package and 
# patchwork package functions. Here the plot bands are 1, 2 and 3 because the jpg were saved with the NIR plotted in the red band.

p1995 <- ggRGB(lan1995area, 1, 2, 3, stretch="hist") + ggtitle("1995") + theme(plot.title = element_text(hjust = 0.5))
p2015 <- ggRGB(lan2015area, 1, 2, 3, stretch="hist") + ggtitle("2015") + theme(plot.title = element_text(hjust = 0.5))
p2022 <- ggRGB(lan2022area, 1, 2, 3, stretch="hist") + ggtitle("2022") + theme(plot.title = element_text(hjust = 0.5))

# Saving of the image of the time series created with patchwork using ggsave function.
ggsave(file="Time series analysis with highlighted NIR.jpg")
p1995+p2015+p2022 # Time series created using patchwork package.
dev.off()

# Here I do a PCA on the raster images (using rasterPCA function from raster package), in order to apply viridis package
# color scales to my plots, to make them readable also for colorblind people. In each plot I used the Principal Component 
# (PC1) of the model, because is the one that best represent the data.
l1995PCA <- rasterPCA(lan1995area)

# To see which component best represent the data I did a summary on the model for the image of 1995. The Importance of Components 
# shows in the Proportion of Variance that the most significant component is PC1, with a value of 0.9375375, meaning that it 
# explains the 93,75% of the model, which is a really good value. 
summary(l1995PCA$model)

# Here I create the plot of this image using ggplot function to set some aesthetics and viridis function to set the color.
p1 <- ggplot() + 
  geom_raster(l1995PCA$map$PC1, mapping=aes(x=x, y=y, fill=PC1)) + scale_fill_viridis(option = "inferno") +
  ggtitle("1995") + 
  theme(plot.title = element_text(hjust = 0.5))

# Below I do the same for the other two images.

## 2015
l2015PCA <- rasterPCA(lan2015area)
summary(l2015PCA$model) # PC1 explains 0.9240064 = 92,4% of the model
p2 <- ggplot() + 
  geom_raster(l2015PCA$map$PC1, mapping=aes(x=x, y=y, fill=PC1)) + scale_fill_viridis(option = "inferno") +
  ggtitle("2015") + 
  theme(plot.title = element_text(hjust = 0.5))

## 2022
l2022PCA <- rasterPCA(lan2022area)
summary(l2022PCA$model) # PC1 explains 0.9208456 = 92,08% of the model
p3 <- ggplot() + 
  geom_raster(l2022PCA$map$PC1, mapping=aes(x=x, y=y, fill=PC1)) + scale_fill_viridis(option = "inferno") +
  ggtitle("2022") + 
  theme(plot.title = element_text(hjust = 0.5))


# At this point I export the three images plotted together with patchwork package with ggsave.
ggsave(file="Time series analysis with viridis.jpg", width=16, height=5)
p1+p2+p3
dev.off()





##### 5 - SPECTRAL INDICES #####


### 5.1 DVI (Difference Vegetation Index) ###

# DVI is an absolute index that represents the "greenness" of the environment. It is calculated by subtracting the red band from the NIR band.
# When plants have good health, they reflect highly the infrared light (the NIR band). When they are stressed or dead, they reflect a lot less.
# In portions of the image clear from vegetation, DVI is of course low. So, knowing this, if we have a satellite image we can check the changes
# in vegetation cover in a particular area.

## DVI 1995 
dvi1995 = lan1995area[[1]] - lan1995area[[2]]
dvi1995

# Plot of the image to check the values of DVI using a personalized color palette.
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
plot(dvi1995, main = "DVI in 1995", legend.args = list(text = "DVI", line = 1), col=cl)

## DVI 2015 
dvi2015 = lan2015area[[1]] - lan2015area[[2]]
plot(dvi2015, main = "DVI in 2015", legend.args = list(text = "DVI", line = 1), col=cl)

## Comparison between DVI values in 1995 and in 2015. Export of the final image as a jpeg.
jpeg(filename="DVI between 1995 and 2015.jpg", width = 1000, height = 1000)
par(mfrow=c(2,1))
plot(dvi1995, main = "DVI in 1995", legend.args = list(text = "DVI", line = 1), col=cl)
plot(dvi2015, main = "DVI in 2015", legend.args = list(text = "DVI", line = 1), col=cl)
dev.off()

## Difference in DVI from 1995 to 2015. Export of the final image as a jpeg.
dvi_dif_1995_2015 = dvi1995 - dvi2015 ## Blue = areas where vegetation has increased, Red = areas where vegetation has decreased
cld <- colorRampPalette(c('blue','white','red'))(100)

jpeg(filename="DVI difference from 1995 to 2015.jpg", width = 800, height = 800)
plot(dvi_dif_1995_2015, main = "Difference in DVI from 1995 to 2015", cex.main=1.5,
     legend.args = list(text = "      Vegetation \n      loss", line = 1, cex=1.1), col=cld)
dev.off()

# Plotting of the images of 1995 and 2015 with the red colour representing the NIR reflectance, together with the plot of the 
# difference in DVI from 1995 to 2015. We can clearly see from the last plot each portion of the area where the values of DVI have
# increased or decreased in the 20 years between 1995 and 2015. In the red areas, the subtraction of DVI in 1995 from DVI in 2015 
# is above 0, so DVI values have decreased in those areas during the years. Instead, the blue areas are those where subtraction
# is below 0, indicating an increase in DVI values throughout the years. White areas are =0, representing 
# portions of the image with no vegetation cover (e.g. the lake) or portions where DVI didn't change a lot, being the difference 
# in the values equal to 0. 

par(mfrow=c(1,3))
plotRGB(lan1995area, 1, 2, 3, stretch="hist", axes=T, main="1995", cex.main=1.5)
plotRGB(lan2015area, 1, 2, 3, stretch="hist", axes=T, main="2015", cex.main=1.5)
plot(dvi_dif_1995_2015, main = "Difference in DVI from 1995 to 2015", cex.main=1.5,
    legend.args = list(text = "     Veget.\n     loss", line = 1, cex=1), col=cld)

# Now I'll check also the DVI between 2015 until today, 7 years later. The process and calculations are the same.
dvi2022 = lan2022area[[1]] - lan2022area[[2]]
plot(dvi2022, col=cl)
dvi_dif_2015_2022 = dvi2015 - dvi2022

# Export of the final plot of the image.
jpeg(filename="DVI difference from 2015 to 2022.jpg", width = 800, height = 800)
plot(dvi_dif_2015_2022, main = "Difference in DVI from 2015 to 2022", cex.main=1.5,
     legend.args = list(text = "      Vegetation \n      loss", line = 1, cex=1.1),col=cld)
dev.off()

# Here I compare the two intervals calculated with DVI, the first from 1995 to 2015 and the second from 2015 to 2022. 
# DVI is an absolute index so it's not comparable between different images, as we can see here having different values for the
# same color between the two legends of the images. Nevertheless, for this part of my analysis, this characteristic of the index 
# does not matter, because I want to check only the spatial decrease or increase in DVI values visually from the plots. 
# In the following plots of this code we can see that in the 20 years from 1995 to 2015 the DVI values has both increased and
# decreased widely in quite all the area of Yellowstone. On the contrary, in the last 7 years from 2015 to 2022, the DVI has
# increased in spots inside the area, and mostly in the northeastern part of it, in blue color; also, it has decreased in some other  
# spots, but mostly in the one at the left part of the image, in red color, while the rest of the image remains white, indicating a 
# low change in DVI in those areas.

# Comparison between intervals from 1995 to 2015 and from 2015 to 2022. Export of the image included.
par(mfrow=c(1,2))
plot(dvi_dif_1995_2015, main = "Difference in DVI from 1995 to 2015", cex.main=1.5,
     legend.args = list(text = "      Vegetation \n      loss", line = 1, cex=1.1), col=cld)
plot(dvi_dif_2015_2022, main = "Difference in DVI from 2015 to 2022", cex.main=1.5,
     legend.args = list(text = "      Vegetation \n      loss", line = 1, cex=1.1), col=cld)

# Difference in DVI from 1995 to 2022 with final image export.
dvi_dif_1995_2022 <- dvi1995 - dvi2022
jpeg(filename="DVI difference from 1995 to 2022.jpg", width = 800, height = 800)
plot(dvi_dif_1995_2022, main = "Difference in DVI from 1995 to 2022", cex.main=1.5,
     legend.args = list(text = "      Vegetation \n      loss", line = 1, cex=1.1),col=cld)
dev.off()

# Comparison between intervals from 1995 to 2015 and from 1995 to 2022.
par(mfrow=c(2,1))
plot(dvi_dif_1995_2015, col=cld)
plot(dvi_dif_1995_2022, col=cld) # This is the total decrease or increase in vegetation from 1995 until today.


### 5.2 NDVI (Normalized Difference Vegetation Index) ###

# NDVI is the index that comes from normalization of DVI, to make it comparable. It is calculated dividing DVI for NIR + red bands of an image,
# with the following formula: NDVI = NIR - red / NIR + red or NDVI = DVI / NIR + red. It varies always between -1 and 1, so this makes it
# already comparable between different images.

## NDVI for 1995
ndvi1995 = dvi1995 / (lan1995area[[1]] + lan1995area[[2]])
plot(ndvi1995, col=cl)

## NDVI for 2015
ndvi2015 = dvi2015 / (lan2015area[[1]] + lan2015area[[2]])
plot(ndvi2015, col=cl)

## NDVI for 2022
ndvi2022 = dvi2022 / (lan2022area[[1]] + lan2022area[[2]])
plot(ndvi2022, col=cl)

# Comparison of NDVI through the years and export of the final image.
jpeg(filename="NDVI from 1995 to 2022.jpeg", width=2000, height=800)
par(mfrow=c(1,3))
plot(ndvi1995, main = "1995", cex.main=2, legend.args = list(text = "NDVI", line = 1, cex=1), col=cl)
plot(ndvi2015, main = "2015", cex.main=2, legend.args = list(text = "NDVI", line = 1, cex=1), col=cl)
plot(ndvi2022, main = "2022", cex.main=2, legend.args = list(text = "NDVI", line = 1, cex=1), col=cl)
dev.off()





###### 6 - LAND COVER #####


# To calculate the land cover I need to work just on one layer. Since my images are made of more than one, I need to "build" this 
# layer using the code and starting from the layers of each image. To do so, I decided to apply unsuperClass function on the raster
# images created from DVI analysis, that distinguished better the levels of reflectance in the images. This allowed me to identify
# the vegetation: in a satellite raster image that shows DVI, vegetation correspond to the pixels with the highest values. So, using
# 3 classes for the clustering of this image with unsuperClass, I am able to group all of them out of the total pixels of the image,
# considering only the class with the highest value. This is possible by using freq function on the map of the model created by
# unsupeClass. Finally, to calculate the land cover change, I made a ratio between the pixels corresponding to vegetation and the total
# number of pixels for each image.


### 6.1 Creation of the model with unsuperClass ###

##1995
l1995uc <- unsuperClass(dvi1995, nClasses = 3)
plot(l1995uc$map, main="1995")

## 2015
l2015uc <- unsuperClass(dvi2015, nClasses = 3)
plot(l2015uc$map, main="2015")

## 2022
l2022uc <- unsuperClass(dvi2022, nClasses = 3)
plot(l2022uc$map, main="2022")


### 6.2 Calculation of the total amount of pixels for each class in the 3 images ###

freq(l1995uc$map) # class 2 (vegetation) = 64339
freq(l2015uc$map) # class 1 (vegetation) = 61238
freq(l2022uc$map) # class 3 (vegetation) = 56345

# Total pixel of each image
totpix <- 230400

# Total forest pixels of the 3 images.
forestpix1995 <- 64339 # 1995
forestpix2015 <- 61238 # 2015
forestpix2022 <- 56345 # 2022


### 6.3 Calculation of the percentage of forest cover in the 3 years ###

## 1995
perc_forest_1995 <- (forestpix1995/totpix)*100
perc_forest_1995 # The percentage of forest cover in 1995 is 27.92491 ~ 27,92 ~ 28%

## 2015
perc_forest_2015 <- (forestpix2015/totpix)*100
perc_forest_2015 # The percentage of forest cover in 2015 is 26.57899 ~ 26,6%

## 2022
perc_forest_2022 <- (forestpix2022/totpix)*100
perc_forest_2022 # The percentage of forest cover in 2022 is 24.4553 ~ 24,5%

# Calculation of the decrease in forest cover.
decrease1995_2015 <- 28-26.6
decrease1995_2015
decrease2015_2022 <- 26.6-24.5
decrease2015_2022


### 6.4 Final plot of the changing of forest cover ###

# From this last analysis we can see how the forest cover has changed during the years. In the first 20 years from 1995 to 2015 it has decreased
# of 1,4%, while from 2015 to 2022 it has decreased of 2,1%. Let's do a plot to better see this decrease through the years.

# Building of the dataframe. 
year <- c("1995", "2015", "2022")
forest_cover <- c(28, 26.6, 24.5)
forest_cover_df <- data.frame(year, forest_cover)

# Creation of the plot and final export.
jpeg(filename="Forest cover decrease from 1995 to 2022.jpg", width=1000, height=600)
plot(forest_cover_df, main="Forest cover decrease from 1995 to 2022", xlab="Year", ylab="Forest cover %", pch=16, 
     cex=1.5, cex.main=1.5, cex.lab=1.5)
grid(nx = NA, ny = NULL, lty = 2, col = "gray", lwd = 2)
axis(1, at = year, labels = year)
lines(year, forest_cover, col = "red", lty = 1, lwd = 2)
dev.off()

# From this last plot we can see that the trend of forest cover change is negative: it has decreased quite fast in the first 20 years of the
# analysis, and even faster in the last 7 years.
