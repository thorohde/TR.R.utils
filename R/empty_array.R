#' @export empty_array

## ---- empty_array function ----

empty_array <- function(dnames, values = NA) {
  return(array(data = values,
                     dim = sapply(dnames, length),
                     dimnames = dnames))
}
