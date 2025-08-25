#' @export ram_usage

ram_usage <- \() {
  .d <- data.frame(object = ls(envir = .GlobalEnv))
  .d$size <- map_dbl(.d$object, ~ utils::object.size(get(.x)))
  .d[order(.d$size, decreasing = T),]}
