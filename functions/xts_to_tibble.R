xts_to_tibble <- function(x) {
  out <- tibble::as_tibble(x) %>%
    dplyr::mutate(date = zoo::index(x)) %>%
    dplyr::select(date, everything())
  
  return(out)
}
