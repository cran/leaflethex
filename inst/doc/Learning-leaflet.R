## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, include = FALSE----------------------------------------------
library(htmlwidgets)
library(htmltools)
library(dplyr)
library(leaflethex)
library(leaflet)

## ------------------------------------------------------------------------
df <- tibble(
  lat = rnorm(100),
  lng = rnorm(100)
)

df2 <- tibble(
  lat =  42.9634 + rnorm(1000),
  lng = -85.6681 + rnorm(1000)
)

df3 <- tibble(
  lat =  51.8126 + rnorm(1000),
  lng = 5.8372 + rnorm(1000)
)

df4 <- tibble(
  lat =  30.2460 + rnorm(1000),
  lng = -87.7008 + rnorm(1000)
)

## ------------------------------------------------------------------------
leaflet::leaflet(df, width = 600, height = 300) %>% 
  addTiles() %>% 
  addHexbin(
    radius = 19, 
    lowEndColor = "yellow", 
    highEndColor="red") %>%
  addHexbin(
    data = df2,
    radius = 16, 
    lowEndColor = "lightblue", 
    highEndColor="purple") %>%
  addHexbin(
    data = df3,
    uniformSize = TRUE,
    lowEndColor = 'yellow',
    highEndColor = 'red') %>%
  addHexbin(
    data = df4,
    uniformColor = 'green',
    radius = 18)

## ------------------------------------------------------------------------
kids_df <- tibble(
  lat =  33.2460 + rnorm(1000, sd = 0.5),
  lng = -89.7008 + rnorm(1000, sd = 0.5),
  sample_size = sample(x = 1:5, size = 1000, replace = TRUE)
)
temp_df <- tibble(
  lat =  42.2460 + rnorm(1000, sd = 0.5),
  lng = -87.7008 + rnorm(1000, sd = 0.5),
  temp = sample(x = 20:100, size = 1000, replace = TRUE)
)
both_df <- tibble(
   lat =  40.0150 + rnorm(1000, sd = 0.5),
  lng = -105.2705 + rnorm(1000, sd = 0.5),
  sample_size = sample(x = 1:5, size = 1000, replace = TRUE),
  temp = sample(x = 20:100, size = 1000, replace = TRUE)
)
leaflet::leaflet(kids_df, width = 600, height = 300) %>% 
  addTiles() %>% 
  addHexbin(
    radius = 19, 
    lowEndColor = "yellow", 
    highEndColor="red",
    sizeSummaryFunction = "sum",
    sizevar = "sample_size"
    ) %>% 
  addHexbin(
    data = temp_df,
    radius = 19, 
    lowEndColor = "blue", 
    highEndColor="red",
    sizeSummaryFunction = "mean",
    sizevar = "temp"
    ) %>% 
  addHexbin(
    data = both_df,
    radius = 18, 
    lowEndColor = "white", 
    highEndColor="darkgreen",
    sizeSummaryFunction = "sum",
    sizevar = "sample_size",
    colorSummaryFunction = "median",
    colorvar = "temp"
    )

