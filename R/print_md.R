#' @export print_md

print_md <- function(file) {cat(readr::read_lines(file), sep = "\n")}
