melt_array_to_dt <- \(data, row.name = "row", col.name = "col", value.name = "value") {
  output <- data.table(expand_grid(rownames(data), colnames(data)))
  names(output) <- c(row.name, col.name)
  output[[value.name]] <- as.vector(data)
  copy(output)
}
