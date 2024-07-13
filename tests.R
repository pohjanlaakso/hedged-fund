
gmean_test <- function(raw_return_vector, log_return_vector){
  a <- exp(mean(log(1+raw_return_vector)))
  b <- exp(mean(log_return_vector))
  return (a-b) # should always return zero
}

