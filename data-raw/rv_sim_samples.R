mu <- 1:10 %>% as.list
sd1 <- rnorm(10, 2, .5) %>% as.list
simulated_samps <- purrr::pmap(list(n = 100, mean = mu, sd = sd1), rnorm) %>% unlist
simulated_sampes_array <- array(simulated_samps, c(100, 10))

data <- rv_data %>% 
  dplyr::select(country_code, region_code, y)