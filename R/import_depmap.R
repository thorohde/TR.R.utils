#' @export import_depmap

## ---- import_depmap function ----

import_depmap <- \(file, impute = F, verbose = T) {

  object <- as.matrix(fread(file), rownames = 1)
  colnames(object) <- str_split_i(colnames(object), " \\(", 1)
  if (impute) {
    if (verbose) {
      base::message(base::paste0(na_perc(object)*100,
                                 " percent of values are imputed."))
      }
    for (i in 1:ncol(object)) {
      object[,i][is.na(object[,i])] <- mean(object[,i], na.rm = T)}}
  return(object)
}
