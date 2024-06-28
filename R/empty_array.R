#' @export empty_array

empty_array <- \(dimnames, values = NA) {
  return(array(data = values,
               dim = base::sapply(dimnames, base::length),
               dimnames = dimnames))
  }
