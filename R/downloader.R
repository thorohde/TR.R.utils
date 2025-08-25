#' @export downloader

## ---- downloader function ----

downloader <- function(.url, .file, .method = "curl", verbose = T) {

  message(
    ifelse(file.exists(.file),
           paste0("File ", .file, " exists. Skipping."),
           paste0("File ", .file, " does not exist. Downloading...")))
  if (!file.exists(.file)) {
    utils::download.file(.url, .file, method = .method, quiet = !verbose)
  }
}
