#' ggplot for pharmacokinetic concentration-time curve
#'
#' This draws pharmacokinetic concentration-time curve with ggplot2 packages.
#'
#' @param concData concentration data table
#' @param colSubj column name for subject ID
#' @param colTime column name for time
#' @param colConc column name for concentration
#'
#' @export
#' @import ggplot2
#' @import dplyr
#' @importFrom cowplot ggdraw
#' @importFrom cowplot draw_plot
#' @importFrom cowplot draw_plot_label
#'
#' @return ggplot2 figures
#' @examples
#' ggnca(concData = Theoph, colSubj = "Subject", colTime = "Time", colConc = "conc")
#'

ggnca <- function(concData, colSubj = "Subject", colTime = "Time", colConc = "conc"){
#concData = Theoph; colSubj = "Subject"; colTime = "Time"; colConc = "conc"
#concData = GGnca; colSubj = "ID"; colTime = "TIME"; colConc = "DV"
    concData <- data.frame(concData)
    ggncaDataset <- data.frame(Subject = concData[ , colSubj],
                               Time = concData[ , colTime],
                               conc = concData[ , colConc])
    Backbone <- ggplot(ggncaDataset,
                       aes(Time, conc, group = Subject)) +
        geom_line() +
        geom_point() +
        scale_y_log10()

    Individual <- Backbone + facet_wrap(~ Subject)
    groupLinear <- Backbone + scale_y_continuous()
    groupLog <- groupLinear + scale_y_log10()

    cowReturn <- cowplot::ggdraw() +
        cowplot::draw_plot(Individual, 0, .5, 1, .5) +
        cowplot::draw_plot(groupLinear, 0, 0, .5, .5) +
        cowplot::draw_plot(groupLog, .5, 0, .5, .5) +
        cowplot::draw_plot_label(c("A", "B", "C"), c(0, 0, 0.5), c(1, 0.5, 0.5), size = 15)
    return(cowReturn)
}
