##----------------------------------------------------------------------------
## Title: Geographic maps w/ ggplot from shapefiles
## Author: Armando Enriquez Z.
## Date: October 27th, 2014
## Purpose: Create a geographic map (administrative level-1 or level-2)
##----------------------------------------------------------------------------

## R libraries required
## Probably you haven't got the packages yet: type "install.packages("package")"
library(ggplot2) ## graphics 
library(sp) ## spatial objects
library(maps)
library(maptools)
library(foreign) ## reading foreign files into R
library(mapproj)

## You may download the shapefiles for a specific country from:
## www.gadm.org
## Important: please download the data by country in shapefile format!
## (not .RData, not ESRI geodatabase)

## Once you have downloaded the shapefiles, save the files in your wd

## Let us load the map structures
## First the description of the map administrative level 1 (state-level)
mapDesc <- read.csv("MEX_adm1.csv", header = TRUE)
str(mapDesc)

## Then we proceed loading the shapefile
mapMex <- readShapePoly("MEX_adm1.shp") ## (state-level map)
str(mapMex) ## We see that mapMex is a spatial S4 object 

## Converting the shapefile into a data frame (to handle it!)
mapMex <- fortify(mapMex)
str(mapMex)

## We are ready to plot the map with ggplot!
ggplot(mapMex, aes(x = long, y = lat, group = group)) + geom_path()