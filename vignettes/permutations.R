temp <- c("1a", "1b", "2a", "2b", "2c")
combinat::permn(temp)
# gtools::permutations(temp)


#we have multiple bins of different size so total perm is
# number of total perm = bin1 * bin2 * bin3 .... * binN 
# one way to get this is randomly sample from each repeatendly and get the unique solutions
# check the length = total perm
# function repeats till that statement returns true

binl <- list(c(1,2), c(1,2), c(1,2,3))
binl2 <- list(c(TRUE,TRUE), c(TRUE,TRUE), c(TRUE,TRUE,TRUE))


# 1,1,1
# 1,1,2
# 1,1,3
# 
# 1,2,1
# 1,2,2
# 1,2,3
# 
# 2,1,1
# 2,1,2
# 2,1,3
# 
# 2,2,1
# 2,2,2
# 2,2,3


# we have 2*3 permutations here in lexicographical order
# is there a way to compute this list in R?
# After spending some time on my attempt I found that this has been worked out 
# using the factoradic of a number .... we will skip to the brute force method for now
# 
#   # attempt
# 
# lengthbin <- length(binl)
# flexbin <- lengthbin - 1
# lastgroupsize <-binl[[lengthbin]] %>% length()
# cont <- rep(NA, length(binl))
# 
# prebins X lastgroupsize
# 
# reslist <- list()
# i <- 0
# while(length(reslist) < totalnumber) {
#   
# for 
# 
# for (j in 1:lastgroupsize) {
#   for (k in 1:(lengthbin - 1)) {
#     cont[k] <- binl[[j]][binl2[[j]]] %>% min()
#     # themin <- binl[[k]][binl2[[k]]] %>% min() %>% which()
#   }
#   cont[lengthbin] <- j
#   i <- i + 1
#   reslist[[i]] <- cont
# }
# 
# 
# }



# or we can do random sampling probabolistic approach
# -sample from each bin X times
# -take unique permutations
# - if unique = total number computed earlier stop
# - else repeat whole process

library(dplyr)

  # we have some colum in our data with unique codes and 0s for non dupes
  cexam <- c(4002001, 0, 4002001, 4502000, 4502000, 4502000, 0)
  # convert to a number system where 0 is non dupe and anything greater is a dupe
  cef <- cexam %>% as.factor() %>% as.numeric() - 1
  # 1 will be the first index in the list and so on ...
  binl <- list()
  cef2 <- cef[cef > 0]
  for (i in unique(cef2)) {
    binl[[i]] <- 1:((cef == i) %>% sum())
  }


binl <- list(c(1,2), c(1,2), c(1,2,3))

permutation_number <- function(list) {
  binsizes <- c()
  for (i in 1:length(list)) {
    binsizes[i] <- length(list[[i]])
  }
  return(prod(binsizes))
}

totalnumber <- permutation_number(binl)
permutations <- list()
i <- 1
while (length(permutations) < totalnumber) {
  perm1 <- c()
  for (j in 1:length(binl)) {
    perm1 <- c(perm1, sample(binl[[j]],1))
  }
  permutations[[i]] <- perm1
  permutations <- permutations %>% unique()
  i <- i + 1
}

# now that we have permuations how to sample from data?
# the index in a single permutation corresponds to which bin
# the number at the index corresponds to which dupe
# all 0s are sampled

# sinx is our abbreviation for sample index
# sinxl is the list of these samples
for(i in 1:length(bins)) { # each i here is going to be a set of samples
  sinx
  for(j in 1:length(bin[[i]])) {
    dinx <- which(cef == i) # the positions of all dupes for this bin in the data
    dinx2 <- bin[[i]][[j]] # which observation of this dupe we want to sample
    dinx3 <- dinx[dinx2] # the index in the data of obs

  }

}


