#' @importFrom data.table  data.table setnames
#' @export flatten_array

flatten_array <- \(x, value.name = "value", dnames) {
  
  if (is.null(dim(x))) {
    stop("Please provide an array!")
  }
  
  output <- base::list()
  output[["V1"]] <- base::rep(base::dimnames(x)[[1]], base::prod(base::dim(x)[-1]))
  
  for (i in 2:base::length(base::dim(x))) {
    output[[str_c("V", i)]] <- base::rep(base::dimnames(x)[[i]], 
                                         each = base::prod(dim(x)[-i]))
  }
  
  output[[value.name]] <- base::as.vector(x)
  output <- data.table::data.table(base::data.frame(output))
  
  if (!base::missing(dnames)) {
    given_dnames <- base::length(dnames)
    required_dnames <- base::length(dim(x))
    
    if (given_dnames != required_dnames) {
      warning(base::paste(given_dnames, "dimnames given, but", required_dnames, "dimensions found!"))
    } else {
      
      data.table::setnames(output, 
                           old = base::paste0("V", 1:length(base::dim(x)))[1:given_dnames], 
                           new = dnames)}
  }
  return(output)
}