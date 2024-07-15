#' @export plotsaver

## ---- downloader function ----

downloader <- \(.url, .file, .method = "curl", verbose = T) {

  message(
    ifelse(file.exists(.file),
           base::paste0("File ", .file, " exists. Skipping."),
           base::paste0("File ", .file, " does not exist. Downloading...")))
  if (!file.exists(.file)) {
    utils::download.file(.url, .file, method = .method, quiet = !verbose)
  }
}
