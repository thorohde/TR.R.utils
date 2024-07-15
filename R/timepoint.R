#' @export timepoint

## ---- timepoint function ----

timepoint <- \() {
  return(base::format(base::Sys.time(), "%X"))
  }
