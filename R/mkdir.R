#' @export mkdir

## ---- mkdir function ----

mkdir <- \(directory) {
  if (!base::dir.exists(directory)) {
    dir.create(directory, recursive = T, showWarnings = F)
  }
}
