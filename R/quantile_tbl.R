rv_quantile_tbl <- function(samples_si) {
  samples_df_si <- samples_si %>% as.data.frame
  probs <- c(.025, 0.1, .5, .9, .975) %>% list
  estimates_df_i5 <- list(samples_df_si, probs) %>% purrr::pmap_dfr(quantile)
  estimates_tbl_i5 <- estimates_df_i5 %>% tibble::as_tibble
  return(estimates_tbl_i5)
} 