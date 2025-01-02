
# setup work space
filepath <- '/Users/tatu/Desktop/startup/hedged-fund/'
setwd(filepath)
data <- read.csv('apartments_final.csv', header = T)

# get data
vuokra_kaksiot <- read.csv('kaksiot_vuokra.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
hinta_kaksiot <- read.csv('kaksiot_hinta.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

# transform column data
colnames(vuokra_kaksiot) <- gsub('Neliövuokra..eur.m2..', '', colnames(vuokra_kaksiot))
colnames(vuokra_kaksiot) <-gsub('Helsinki', '', colnames(vuokra_kaksiot))
colnames(vuokra_kaksiot) <-gsub('[^[:alnum:] ]', '', colnames(vuokra_kaksiot))
colnames(vuokra_kaksiot) <-gsub('[[:digit:]]+', '', colnames(vuokra_kaksiot))
unique(data$area)

# Oulunkylä v. Laajasalo
par(mfrow=c(1,2))
plot(vuokra_kaksiot$Laajasalo, type = 'l', col = 'red', ylim=c(14,18))
lines(vuokra_kaksiot$OulunkyläPatola, col = 'blue')

plot(hinta_kaksiot$Neliöhinta..EUR.m2..00840..Yliskylä..Helsinki., type ='l', col ='red')
lines(hinta_kaksiot$Neliöhinta..EUR.m2..00640..Oulunkylä...Patola..Helsinki., col ='blue')

# Taka-töölö v. Kallio
plot(vuokra_kaksiot$Kallio, type = 'l', col = 'red')
lines(vuokra_kaksiot$TakaTöölö, col = 'blue')

plot(hinta_kaksiot$Neliöhinta..EUR.m2..00530..Kallio..Helsinki., type = 'l', col = 'red', ylim = c(3500,7500))
lines(hinta_kaksiot$Neliöhinta..EUR.m2..00250..Taka.Töölö..Helsinki., col = 'blue')

# https://stackoverflow.com/questions/42464767/how-to-run-lm-regression-for-every-column-in-r
storage <- list()
for(i in 4:length(names(vuokra_kaksiot)[-1])) {
  storage[[i]] <- lm(get(i) ~ x, vuokra_kaksiot)
}













