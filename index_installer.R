
# index installer
rm(list=ls())
setwd(getwd())
library(tidyquant)

# https://worldpopulationreview.com/country-rankings/cape-ratio-by-country
# Countries were chosen based on their low CAPE-ratio to some historical average! 

# Colombia
getSymbols('ICOL'); plot(ICOL$ICOL.Close)
r_colombia <- na.omit(diff(log(ICOL$ICOL.Close))) # https://people.duke.edu/~rnau/Decision411_2007/411log.htm
sharpe_colombia <- mean(r_colombia)/sd(r_colombia) * sqrt(252) # annualized information criterion 

# Indonesia
getSymbols('EIDO'); plot(EIDO$EIDO.Close)
r_indonesia <- na.omit(diff(log(EIDO$EIDO.Close)))
sharpe_indonesia <- mean(r_indonesia)/sd(r_indonesia) * sqrt(252)

# Malaysia 
getSymbols('EWM'); plot(EWM$EWM.Close)
r_malaysia <- na.omit(diff(log(EWM$EWM.Close)))
sharpe_malaysia <- mean(r_malaysia)/sd(r_malaysia) * sqrt(252)

# Chile 
getSymbols('ECH'); plot(ECH$ECH.Close)
r_chile <- na.omit(diff(log(ECH$ECH.Close)))
sharpe_chile <- mean(r_chile)/sd(r_chile) * sqrt(252)

# South Korea
getSymbols('EWY'); plot(EWY$EWY.Close)
r_korea <- na.omit(diff(log(EWY$EWY.Close)))
sharpe_korea <- mean(r_korea)/sd(r_korea) * sqrt(252)

# South Africa
getSymbols('EZA'); plot(EZA$EZA.Close)
r_africa <- na.omit(diff(log(EZA$EZA.Close)))
sharpe_africa <- mean(r_africa)/sd(r_africa) * sqrt(252)

# Peru
getSymbols('EPU'); plot(EPU$EPU.Close)
r_peru <- na.omit(diff(log(EPU$EPU.Close)))
sharpe_peru <- mean(r_peru)/sd(r_peru) * sqrt(252)

# Philippines
getSymbols('EPHE'); plot(EPHE$EPHE.Close)
r_philippines <- na.omit(diff(log(EPHE$EPHE.Close)))
sharpe_philippines <- mean(r_philippines)/sd(r_philippines) * sqrt(252)

# Benchmark (Nasdaq)
getSymbols('QQQ'); plot(QQQ$QQQ.Close)
r_benchmark <- na.omit(diff(log(QQQ$QQQ.Close)))
sharpe_benchmark <- mean(r_benchmark)/sd(r_benchmark) * sqrt(252)
