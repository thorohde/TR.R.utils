#' @export plotsaver

## ---- plotsaver function ----

plotsaver <- \(.path,
               .filename,
               .width = NA,
               .height = NA,
               .plot = ggplot2::last_plot(),
               .dpi = 300,
               .fileformats = c("png", "pdf")) {

  dir.create(.path, recursive = T, showWarnings = F)

  purrr::walk(.fileformats, ~ 
    ggplot2::ggsave(filename = paste0(.filename, ".", .x),
                    plot = .plot,
                    device = .ffmt,
                    path = .path,
                    width = .width,
                    height = .height))
}
