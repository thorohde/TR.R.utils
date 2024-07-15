#' @export na_perc

## ---- na_perc function ----

na_perc <- \(object) {
  return(
    base::round(base::sum(base::is.na(object)) / base::length(object), 5))
  }
