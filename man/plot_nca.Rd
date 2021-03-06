% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggnca.R
\name{plot_nca}
\alias{plot_nca}
\title{ggplot for pharmacokinetic concentration-time curve}
\usage{
plot_nca(concData, colSubj = "Subject", colTime = "Time",
  colConc = "conc")
}
\arguments{
\item{concData}{concentration data table}

\item{colSubj}{column name for subject ID}

\item{colTime}{column name for time}

\item{colConc}{column name for concentration}
}
\value{
ggplot2 figures
}
\description{
This draws pharmacokinetic concentration-time curve with ggplot2 packages.
}
\examples{
plot_nca(concData = Theoph, colSubj = "Subject", colTime = "Time", colConc = "conc")
plot_nca(concData = Indometh, colSubj = "Subject", colTime = "time", colConc = "conc")
}
