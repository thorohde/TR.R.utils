#' @export cache_wrapper

cache_wrapper <- \(fcall = NULL, dir = "cache", fstring, import = T, evaluate = T, write_cache = T, force = F, verbose = T) {

  timepoint <- format(Sys.time(), "%X")
  fcall <- substitute(fcall)
  f <- file.path(dir, base::paste0(fstring, ".rds"))

  if (file.exists(f)) {
    if (import & !force) {
      if (verbose) {message(base::paste0("Importing '", fstring, "'."))}
      return(readRDS(f))}
    if (!import) {
      if (!force) {
        if (verbose) {message(base::paste0("File '", fstring, "' exists. Skipping."))}
        return(NULL)
      }
      if (force) {
        if (verbose) {message(base::paste0("File '", fstring, "' exists. Forced recalculation. (", timepoint, ")"))}
        x <- eval(fcall)
        if (verbose) {(message(base::paste0("Writing cache file '", fstring, "'.")))}
        saveRDS(x, file = file.path(dir, base::paste0(fstring, ".rds")))
        return(x)
      }
    }
  }
  if (!file.exists(f)) {
    if (evaluate) {
      if (verbose) {message(base::paste0("File '", fstring, "' does not exist. Recalculating...(", timepoint, ")"))}
      x <- eval(fcall)
      if (write_cache) {
        if (verbose) {(message(base::paste0("Writing cache file '", fstring, "'.")))}
        saveRDS(x, file = file.path(dir, base::paste0(fstring, ".rds")))}
      return(x)}
    if (!evaluate) {
      if (verbose) {message(base::paste0("File '", fstring, "' does not exist. Skipping."))}
      return(NULL)}}}
