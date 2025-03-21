
expand_grid_dt <- \(rnames, cnames, row.name = "row", col.name = "col", value.name = "value") {
  output <- list()
  output[[row.name]] <- rep(rnames, length(cnames))
  output[[col.name]] <- rep(cnames, each = length(rnames))
  output$id <- 1:prod(length(rnames), length(cnames))

  #output[[value.name]] <- as.vector(data)
  data.table(data.frame(output))
}
