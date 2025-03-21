#' @importFrom utils object.size
#' @export ram_usage

ram_usage <- \() {base::sort(
  base::sapply(base::ls(envir = .GlobalEnv), 
               \(.) {utils::object.size(get(.))}), decreasing = T)}