#' @export cacheR

## ---- cacheR function ----

cacheR <- function(.,
            fname,
            dir = file.path(getwd(), "cache"),
            import = T,
            verbose = F) {

  dir.create(dir, recursive = T, showWarnings = F)

  f <- file.path(dir, paste0(fname, ".rds"))

  messages <- list(a = paste0("Importing '", fname, "'."),
                   b = paste0("'", fname, "' exists. Skipping."),
                   c = paste0("Computing and caching '", fname, "'..."))

  if (file.exists(f)) {
    if (import) {
      if (verbose) {message(messages$a)}
      return(readRDS(f))}
    if (!import) {
      if (verbose) {message(messages$b)}
      return(NULL)
    }
  }

  if (!file.exists(f)) {
    if (verbose) {message(messages$c)}
    x <- eval(substitute(.), envir = parent.frame())
    saveRDS(x, file = file.path(dir, paste0(fname, ".rds")))
    return(x)
  }
}

