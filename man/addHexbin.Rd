% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hexbin.R
\name{addHexbin}
\alias{addHexbin}
\title{Hexbin Layers for Leaflet Plots}
\usage{
addHexbin(map, data = NULL, radius = 12, opacity = 0.5,
  duration = 500, lowEndColor = "white", highEndColor = "blue",
  uniformSize = FALSE, uniformColor = NULL,
  sizeSummaryFunction = c("count", "sum", "max", "min", "mean",
  "median"), sizevar = NULL, colorSummaryFunction = c("count", "sum",
  "max", "min", "mean", "median"), colorvar = NULL)
}
\arguments{
\item{map}{The leaflet map object to apply the hexbin layer to.
Makes this function compatible with the \code{\%>\%} operator}

\item{data}{data frame or tibble - alternate data to use for this hexbin
instead of default map data}

\item{radius}{choose the base size for the hexagons}

\item{opacity}{decimal between 0.0 and 1.0 - choose the
percent of opacity for the hexagons}

\item{duration}{positive integer milliseconds that the animation
takes for drawing the hexagons}

\item{lowEndColor}{choose the color for the smaller hexagons}

\item{highEndColor}{choose the color for the larger hexagons}

\item{uniformSize}{a logical indicating whether all hexagons should be the same size.}

\item{uniformColor}{a color that overrides lowEndColor and highEndColor to
make the color uniform across the hexagon sizes.}

\item{sizeSummaryFunction}{a string that specifies which summary function
to use on sizevar to modulate the size of the hexagons.
The options are 'count', 'sum', 'max', 'min', 'mean', and 'median'.}

\item{sizevar}{a string that specifies which variable in the user specified
data frame will be used to calculate the size of the hexagons.}

\item{colorSummaryFunction}{a string that specifies which summary function
to use on colorvar to modulate the color of the hexagons.
The options are 'count', 'sum', 'max', 'min', 'mean', and 'median'.}

\item{colorvar}{a string that specifies which variable in the user specified
data frame will be used to calculate the color of the hexagons.}
}
\value{
map parameter, but with the hexbinLayer attached so that it can be
used with the \code{\%>\%} pipe operator
}
\description{
Create hexbin layers for leaflet plots.
}
\note{
Do not use uniformColor and uniformSize together as it will not give any
insights to the data

If colorSummaryFunction and colorvar are not specified,
the color will mirror the sizevar unless uniform color set to \code{TRUE}.
}
\examples{
leaflet::leaflet(data.frame(lat =  42.9634 + rnorm(1000),lng = -85.6681 + rnorm(1000))) \%>\%
addTiles() \%>\% addHexbin()

leaflet::leaflet(data.frame(lat =  42.9634 + rnorm(1000),lng = -85.6681 + rnorm(1000))) \%>\%
addTiles() \%>\% addHexbin(radius=25, lowEndColor='purple', highEndColor='orange')
}
\seealso{
A \href{https://jsfiddle.net/reblace/acjnbu8t/?utm_source=website&utm_medium=embed&utm_campaign=acjnbu8t}{JSFiddler Hexbin example} by Ryan
}
