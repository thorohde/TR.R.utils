#' @export mkdir

## ---- mkdir function ----

mkdir <- \(directory) {dir.create(directory, recursive = T, showWarnings = F)}
