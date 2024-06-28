#' @export mkdir

mkdir <- \(directory) {
  if (!base::dir.exists(directory)) {
    dir.create(directory, recursive = T, showWarnings = F)
  }
}
