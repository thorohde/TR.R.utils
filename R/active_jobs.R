#' @export active_jobs

active_jobs <- \() base::lapply(rstudioapi::jobList(), \(.) {.$name})