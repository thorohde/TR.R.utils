#' @export draw_lines

draw_lines <- \(col = "black", type = "dashed", diag = T) {
  x <- list(
    ggplot2::geom_vline(xintercept = 0, linetype = type, color = col),
    ggplot2::geom_hline(yintercept = 0, linetype = type, color = col)
  )
  if (diag) {x[[3]] <- ggplot2::geom_abline(slope = 1, linetype = type, color = col)}
  x}
