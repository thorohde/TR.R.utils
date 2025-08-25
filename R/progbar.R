#' @export progbar

progbar <- function(total = 100, show_eta = T) {
  progress::progress_bar$new(
    total = total,
    format = ifelse(show_eta, c("[:bar] :percent ETA: :eta",
                                      "[:bar] :percent")),
    width = 50,
    force = T)
}
