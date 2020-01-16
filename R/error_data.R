#' error_data
#'
#' @param data 
#' @param parameter 
#' @param estimate 
#' @param totalerror_sd 
#'
#' @return
#' @export
#'
error_data <- function(data, parameter, estimate, totalerror_sd)
{
  resid <- data[[parameter]] - data[[estimate]]
  e <- matrix(c(resid,
                resid / sd(resid),
                resid / (sqrt(1 / data[[totalerror_sd]]))), ncol = 3)
  
  edata <- data.frame(
    "mean" = e %>% apply(2, mean),
    "absolute_mean" = e %>% apply(2, abs) %>% apply(2, mean),
    "median" = e %>% apply(2, median),
    "absolute_median" = e %>% apply(2, abs) %>% apply(2, median)
  )
  rownames(edata) <- c("error", "standard error", "adjusted error")
  edata
  return(edata)
}