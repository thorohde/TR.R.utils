#' @export na_perc

## ---- na_perc function ----

na_perc <- function(object) {round(sum(is.na(object)) / length(object), 5)}
