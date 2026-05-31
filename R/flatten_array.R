#' @export flatten_array

flatten_array <- function(x, dnames, value.name = "value") {

  stopifnot("Please provide an array!" = !is.null(dim(x)))

  if (is.null(dimnames(x))) {
    dimnames(x) <- lapply(dim(x), seq_len)
  }

  output <- data.table::as.data.table(x, value.name = value.name)

  if (!missing(dnames)) {
    given_dnames <- length(dnames)
    required_dnames <- length(dim(x))

    if (given_dnames != required_dnames) {
      warning(paste(given_dnames, "dimnames given, but",
                    required_dnames, "dimensions found!"))
    }

    old_names <- paste0("V", 1:required_dnames)[1:given_dnames]

    data.table::setnames(output, old = old_names, new = dnames[1:given_dnames])}

  return(output)
}
