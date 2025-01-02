# plotting

source('hedgefund.R')

plot(cumprod(1+rlog_equity), col ='blue', lty=2)
lines(cumprod(1+rlog_bond), col = 'purple', lty = 5)
lines(cumprod(1+(0.6*rlog_equity+0.4*rlog_bond)), col = 'red', lty = 6)
lines(cumprod(1+1.6*(0.6*rlog_equity+0.4*rlog_bond)), col = 'black', lty = 6)
