#' @export active_jobs

active_jobs <- function() lapply(rstudioapi::jobList(), \(.) {.$name})