## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6, fig.height = 3
)

## ----setup, include = FALSE----------------------------------------------
library(leaflethex)
library(tibble)
library(dplyr)

## ------------------------------------------------------------------------
# Randomly generated data points
data_points <- tibble(
  lat =  42.9634 + rnorm(1000),
  lng = -85.6681 + rnorm(1000)
)
# Create map with data points
leaflet::leaflet(data_points) %>% addTiles() %>% addHexbin()

## ------------------------------------------------------------------------
data_points <- tibble(
  lat =  42.9634 + rnorm(1000),
  lng = -85.6681 + rnorm(1000)
)
data_points2 <- tibble(
  lat =  42.9634 + rnorm(1000),
  lng = -95.6681 + rnorm(1000)
)
leaflet::leaflet(rbind(data_points, data_points2)) %>% 
         addTiles() %>% 
         addHexbin(data = data_points) %>% 
         addHexbin(data = data_points2, 
                    lowEndColor  = "yellow", 
                    highEndColor = "red")

## ----eval=FALSE----------------------------------------------------------
#    new_plugin <-
#      pluginFactory(
#        "Name of Plugin",
#        "path/of/parent/folder/",
#        "leaflet-script.js",
#        "deps.js",
#        "stylesheet.css")
#    # Create a basic leaflet map
#    leaflet::leaflet() %>% addTiles() %>% new_plugin()

## ----eval=FALSE----------------------------------------------------------
#  addPluginName <-
#      pluginFactory(
#              "Name of Plugin",
#              system.file("folder_containing_js_file", ""),
#              "name_of_file.js",
#              "dependencies_required.js",
#              "stylesheet_for_js.css")

## ----eval=FALSE----------------------------------------------------------
#    map %>% addPluginName(data = mapData,
#                          radius = radius,
#                          opacity = opacity,
#                          duration = duration,
#                          lowEndColor = lowEndColor,
#                          highEndColor = highEndColor)

## ----eval=FALSE----------------------------------------------------------
#  addPluginName <-
#      pluginFactory(
#              "Name of Plugin",
#              system.file("folder_containing_js_file", "", package = "your_package_name"), # Add the package parameter
#              "name_of_file.js",
#              "dependencies_required.js",
#              "stylesheet_for_js.css")

