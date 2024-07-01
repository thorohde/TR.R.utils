#' @export prind_md

print_md <- \(fpath, file) {
  fpath <- file.path(markdown_dir, fpath)
  f <- ifelse(grepl(".md$", file), file, stringr::str_c(file, ".md"))
  cat(read_lines(file.path(fpath, f)), sep = "\n")}
