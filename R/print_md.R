#' @export print_md

print_md <- \(fpath, file) {
  #fpath <- file.path(markdown_dir, fpath)
  f <- ifelse(grepl(".md$", file), file, stringr::str_c(file, ".md"))
  base::cat(readr::read_lines(file.path(fpath, f)), sep = "\n")}
