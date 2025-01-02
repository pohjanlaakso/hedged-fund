# mise en place
rm(list = ls())
filepath <- '/Users/tatu/Desktop/startup/hedged-fund/'
setwd(filepath)

# download files
asukkaat_df <- read.csv('asukkaat.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
naiset_df <- read.csv('naiset.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
ika_df <- read.csv('ika.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

# transform data, _t as in transform
asukkaat_t <- asukkaat_df[-1:-2]
rownames(asukkaat_t) <- asukkaat_df[,2]

naiset_t <- naiset_df[-1:-2]
rownames(naiset_t) <- naiset_df[,2]

ika_t <- ika_df[-1:-2]
rownames(ika_t) <- ika_df[,2]

# divide data frame by another

test <- naiset_t/asukkaat_t

plot(test$X00530..Kallio..Helsinki., type ='l')

a <- t(tail(test, 1))
b <- sort(a[,1], decreasing = T)
barplot(b)

for (i in 1:length(t)) {
  plot(test[,i], type = 'l')
}




