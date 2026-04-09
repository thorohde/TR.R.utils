#' @export

impute_NAs <- function(x, axis = "both", fun = "mean") {
  stopifnot(fun %in% c("mean", "median"))
  fun <- switch(fun, "mean" = mean, "median" = median)

  if (axis == "rows") {
    for (i in 1:nrow(x)) {
      if (any(is.na(x[i,]))) {
        x[i,][is.na(x[i,])] <- fun(x[i,], na.rm = T)
      }
    }
  }

  if (axis == "cols") {
    for (j in 1:ncol(x)) {
      if (any(is.na(x[,j]))) {
        x[,j][is.na(x[,j])] <- fun(x[,j], na.rm = T)
      }
    }
  }

  if (axis == "both") {
    for (i in 1:nrow(x)) {
      for (j in 1:ncol(x)) {
        if (is.na(x[i,j])) {
          x[i,j] <- fun(c(x[i,], x[,j]), na.rm = T)}
      }
    }
  }

  return(x)}


