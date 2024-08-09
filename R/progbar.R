progbar <- \(total = 100) {
  progress::progress_bar$new(total = total, width = 50, force = T)
}