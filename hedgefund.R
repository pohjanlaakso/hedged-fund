
# Simple 60-40 Portfolio construction
rm(list=ls()) # removes all objects in workspace
setwd(getwd())
library(tidyquant) 
library(usethis)

# Git config: https://rfortherestofus.com/2021/02/how-to-use-git-github-with-r
use_git_config(user.name='W-oland', user.email='tatu.jarvenranta@gmail.com')
use_git()

# download data and visualise
getSymbols('QQQ'); plot(QQQ$QQQ.Close)
getSymbols('VCLT'); plot(VCLT$VCLT.Close)

# next up: https://www.r-bloggers.com/2020/05/basic-statistical-concepts-for-finance/

# standard returns and log returns
r_equity <- QQQ$QQQ.Close / lag(QQQ$QQQ.Close, k=1)-1; r_equity <- na.omit(r_equity); plot(r_equity)
rlog_equity <- log(QQQ$QQQ.Close) - log(lag(QQQ$QQQ.Close, k=1)); rlog_equity <- na.omit(rlog_equity); plot(rlog_equity)

r_bond <- VCLT$VCLT.Close / lag(VCLT$VCLT.Close, k=1)-1; r_bond <- na.omit(r_bond); plot(r_bond)
rlog_bond <- log(VCLT$VCLT.Close) - log(lag(VCLT$VCLT.Close, k=1)); rlog_bond <- na.omit(rlog_bond); plot(rlog_bond)

# ANNUALIZED geometric eturns
# according to: https://stackoverflow.com/questions/2602583/geometric-mean-is-there-a-built-in ...
# ... exp(mean(log(x1))) == prod(x1)^(1/length(x1))
geomean_equity <- exp(mean(log(1+r_equity)))^252-1 # annualisation
geomean_bond <- exp(mean(log(1+r_bond)))^252-1

source('tests.R'); gmean_test(r_equity, rlog_equity)

# portfolio correlation
cor_difdim <- function(vector_a, vector_b) {
  df <- merge(vector_a, vector_b)
  df <- na.omit(df)
  return(cor(df)[2,1])
}

# portfolio standard deviation
portfolio_variance <- function(vector_a, vector_b, weight_a, weight_b) {
  pvar <- weight_a^2*sd(vector_a)^2 + weight_b^2*sd(vector_b)^2 + 2*weight_a*weight_b*sd(vector_a)*sd(vector_b)*cor_difdim(vector_a, vector_b)
  return(sqrt(pvar)*sqrt(252)) # annualisation
}

pvar <- portfolio_variance(rlog_equity, rlog_bond, 0.6, 0.4)
expected_return <- 0.6*geomean_equity + 0.4*geomean_bond

# Information ratio
# risk-free rate from here: https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/data_library.html
portfolio_sharpe <- function(rf_rate, portfolio_sd, portfolio_return) {
  return( (portfolio_return-rf_rate)/portfolio_sd )
}

psharpe<- portfolio_sharpe(0.0495, pvar, expected_return)

# getup github








