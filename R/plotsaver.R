#' @importFrom ggplot last_plot
#' @importFrom ggplot ggsave
#' @export plotsaver

plotsaver <- \(.path,
               .filename,
               .width = NA,
               .height = NA,
               .plot = ggplot2::last_plot(),
               .dpi = 300,
               .fileformats = c("png", "pdf")) {
  for (.ffmt in .fileformats) {
    ggplot2::ggsave(filename = base::paste0(.filename, ".", .ffmt),
                    plot = .plot,
                    device = .ffmt,
                    path = .path,
                    width = .width,
                    height = .height)
  }
}
