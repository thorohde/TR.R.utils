#' @export collect_predictions

## ---- collect_predictions ----

collect_predictions <- \(matrix,
                         row.name = "expression_gene", col.name = "chronos_gene",
                         value.name = "score",
                         reference_matrix = NULL,
                         ref.name = "reference",
                         posneg = "positive",
                         .n_pairs,
                         verbose = F) {

  if (verbose) {
    message(str_c("Predicting", .n_pairs, "pairs based on", posneg, "scores...", sep = " "))
    if (is.null(reference_matrix)) {message("No reference matrix provided.")}
    }

  if (posneg == "positive") {
    th <- sort(matrix[matrix > 0], decreasing = T)[.n_pairs]
    i <- which(matrix >= th); i_arr_ind <- which(matrix >= th, arr.ind = T)
  }

  if (posneg == "negative") {
    th <- sort(matrix[matrix < 0], decreasing = T)[.n_pairs]
    i <- which(matrix <= th); i_arr_ind <- which(matrix <= th, arr.ind = T)
  }

  x <- data.table(i_arr_ind, score = matrix[i])
  if (!is.null(reference_matrix)) {x[, reference := reference_matrix[i]]}

  x[, `:=`(rowname = rownames(matrix)[row], colname = colnames(matrix)[col])]

  x[, `:=`(sorted_pair = mapply(sort_gene_pairs, rowname, colname))]

  if (is.null(reference_matrix)) {x <- x[order(score, decreasing = c("positive" = T, "negative" = F)[[posneg]])]}
  if (!is.null(reference_matrix)) {x <- x[order(score, reference, decreasing = c("positive" = T, "negative" = F)[[posneg]])]}

  data.table::setnames(x, old = c("rowname", "colname", "score"), new = c(row.name, col.name, value.name))
  if (!is.null(reference_matrix)) {data.table::setnames(x, old = "reference", new = ref.name)}

  return(x)
}
