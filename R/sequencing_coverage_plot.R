#' @import data.table
#' @import ggplot2
#'
#' @export sequencing_coverage_plot

## ---- sequencing_coverage_plot function ----

sequencing_coverage_plot <- \(read_count_dt,
                              columns,
                              info_file,
                              coverage_lines = NA) {

  x <- list(data = data.table::data.table(screen = columns),
            n_constructs = nrow(read_file))

  if (!base::missing(info_file)) {
    x$data <- merge(x$data, info_file, by = "screen", all.x = T)
  }

  x$data <- copy(x$data[
    , abs_read_count := sapply(columns, \(.s) {read_file[, sum(get(.s))]})])

  x$plot <- x$data %>%
    ggplot2::ggplot(aes(abs_read_count, screen)) +
    ggplot2::labs(x = "Reads per sample",
                  y = "Screen",
                  title = "Absolute read counts") +
    ggplot2::theme(legend.position = "bottom")

  if (!is.na(coverage_lines)) {
    x$plot <- x$plot +
      ggplot2::geom_vline(xintercept = x$n_constructs * coverage_lines,
                          color = "red", linetype = "dashed") +
      labs(caption = base::paste0("The red line represents a ",
                            coverage_lines, "x coverage."))
  }
  x
}

