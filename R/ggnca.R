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
#' plot_nca(concData = Theoph, colSubj = "Subject", colTime = "Time", colConc = "conc")
#' plot_nca(concData = Indometh, colSubj = "Subject", colTime = "time", colConc = "conc")

plot_nca <- function(concData, colSubj = "Subject", colTime = "Time", colConc = "conc"){
#concData = Theoph; colSubj = "Subject"; colTime = "Time"; colConc = "conc"
#concData = GGnca; colSubj = "ID"; colTime = "TIME"; colConc = "DV"
    concData <- data.frame(concData)
    ggncaDataset <- data.frame(Subject = concData[ , colSubj],
                               Time = concData[ , colTime],
                               conc = concData[ , colConc], stringsAsFactors = FALSE)
    group_log <- ggplot(ggncaDataset,
                       aes(Time, conc, group = Subject)) +
        geom_line() +
        geom_point() +
        scale_y_log10()

    individual <- group_log + facet_wrap(~ Subject)
    group_linear <- group_log + scale_y_continuous()

    cowReturn <- cowplot::ggdraw() +
        cowplot::draw_plot(individual, 0, .5, 1, .5) +
        cowplot::draw_plot(group_linear, 0, 0, .5, .5) +
        cowplot::draw_plot(group_log, .5, 0, .5, .5) +
        cowplot::draw_plot_label(c("A", "B", "C"), c(0, 0, 0.5), c(1, 0.5, 0.5), size = 15)
    return(cowReturn)
}


#' concentration-time curves
#'
#' This draws pharmacokinetic concentration-time curve with ggplot2 packages.
#' 
#' @param df concentration data table
#' @param colSubj column name for subject ID
#' @param colTime column name for time
#' @param colConc column name for concentration
#'


plot_conc <- function(df) {
  df %>% 
    ggplot(aes(x = time, y = conc, color = subjid, group = interaction(subjid, day))) +
    geom_line() +
    geom_point() +
    scale_x_continuous(breaks = seq(0, 24, by = 4)) +
    labs(x = 'Time (hr)', y = 'Concentration (ng/mL)', color = 'Subject') +
    theme_bw()
}

