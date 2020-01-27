library(rvalidate)
library(dplyr)
n <- 100
rv_data <- tibble::tibble(country_code = sample(c(400, 460, 452, 410, 489, 200, 152, 120), n, replace = TRUE), 
               year = sample(1960:2020, n, replace = TRUE), 
               source = sample(c("DHS","MCS"), n, replace = TRUE),
               observed_value = NA,
               total_sd = runif(n,.005,.015),
               "2.5%" = NA,
               "10%" = NA,
               "50%" = NA,
               "90%" = NA,
               "97.5%" = NA)
# for checking duplicates
# rv_data <- bin_markup(rv_data, group = c("country_code", "year"))
for (i in 1:n) {
  trd <- rnorm(1000, 10, 1)
  # estd <- trd + rnorm(1000, 0, 10) # take percetlies for etwimate
  source_effect <- rnorm(1,0,1)*as.numeric(as.factor(rv_data[["source"]][i]))*.05
  tr <- quantile(trd, probs = .5) + source_effect
  est <- quantile(trd, probs = c(.025, 0.1, .5, .9, .975)) + 
    rnorm(1,0,2) + 
    source_effect
  rv_data[["2.5%"]][i] <- est[1]
  rv_data[["10%"]][i] <- est[2]
  rv_data[["50%"]][i] <- est[3]
  rv_data[["90%"]][i] <- est[4]
  rv_data[["97.5%"]][i] <- est[5]
  rv_data[["observed_value"]][i] <- tr
}



# temp <- rv_data %>%
#   rvalidate:::bin_markup(group = c("country_code", "year"))
# duplicates_vec <- temp %>%
#   filter(complete.cases(.)) %>%
#   select("duplicates") %>%
#   unique() %>%
#   unlist() %>%
#   as.vector()
# rvalidate:::permutation_number(temp, duplicates_vec)



usethis::use_data(rv_data, overwrite = TRUE)

