#' @export find_gene_set_coordinates

## ---- find_gene_set_coordinates function ----

find_gene_set_coordinates <- \(matrix, set1, set2) {
  output <- base::array(F, dim = dim(matrix), dimnames = dimnames(matrix))

  for (g1 in unique(intersect(rownames(output), set1))) {
    g2_oi <- intersect(colnames(output), set2[which(set1 == g1)])
    output[g1, g2_oi] <- T}

  for (g2 in unique(intersect(colnames(output), set1))) {
    g1_oi <- intersect(rownames(output), set2[which(set1 == g2)])
    output[g1_oi,g2] <- T
  }
  return(output)
}
