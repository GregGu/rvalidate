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
error_data <- function(data, parameter, estimate, totalerror_sd, subset)
{
  if (is.null(subset)) {
    resid <- data[[parameter]] - data[[estimate]]
    e <- matrix(c(resid,
                  resid / sd(resid),
                  resid / (1 / data[[totalerror_sd]])),
                ncol = 3)
    
    edata <- data.frame(
      "mean" = e %>% apply(2, mean),
      "absolute_mean" = e %>% apply(2, abs) %>% apply(2, mean),
      "median" = e %>% apply(2, median),
      "absolute_median" = e %>% apply(2, abs) %>% apply(2, median)
    )
    rownames(edata) <- c("error", "standard error", "adjusted error")
  } else {
    sets <- unique(data[[subset]])
    edata <- list() 
    symsubset <- rlang::sym(subset)
    for(i in 1:length(sets)) {
      set <- sets[i]
      tempdata <- data %>% dplyr::filter(!!symsubset == set)
      resid <- tempdata[[parameter]] - tempdata[[estimate]]
      e <- matrix(c(resid,
                    resid / sd(resid),
                    resid / (1 / tempdata[[totalerror_sd]])),
                  ncol = 3)
      
      edatatemp <- data.frame(
        "mean" = e %>% apply(2, mean),
        "absolute_mean" = e %>% apply(2, abs) %>% apply(2, mean),
        "median" = e %>% apply(2, median),
        "absolute_median" = e %>% apply(2, abs) %>% apply(2, median)
      )
      rownames(edatatemp) <- c("error", "standard error", "adjusted error")
      edata[[i]] <- edatatemp
    }
  }
  return(edata)
}