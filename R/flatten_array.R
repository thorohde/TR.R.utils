#' @export flatten_array

flatten_array <- function(x, dnames, value.name = "value") {

  stopifnot("Please provide an array!" = !is.null(dim(x)))

  if (is.null(dimnames(x))) {
    dimnames(x) <- lapply(dim(x), seq_len)
  }

  required_dnames <- length(dim(x))

  if (required_dnames == 2) {
    # Force 2D matrix to melt cleanly into a long data.table
    output <- data.table::as.data.table(as.data.frame.table(x, responseName = value.name))
  } else {
    # 3D+ arrays use the native data.table array melting
    output <- data.table::as.data.table(x, value.name = value.name)
  }

  if (!missing(dnames)) {
    given_dnames <- length(dnames)


    if (given_dnames != required_dnames) {
      warning(paste(given_dnames, "dimnames given, but",
                    required_dnames, "dimensions found!"))
    }

    old_prefix <- if (required_dnames == 2) "Var" else "V"
    old_names <- paste0(old_prefix, 1:required_dnames)[1:given_dnames]

    #old_names <- paste0("V", 1:required_dnames)[1:given_dnames]

    data.table::setnames(output, old = old_names, new = dnames[1:given_dnames])}

  return(output)
}
