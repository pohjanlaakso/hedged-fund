# Extract rents and prices from Tilastokeskus
# https://pxdata.stat.fi/PxWeb/pxweb/fi/StatFin/StatFin__asvu/statfin_asvu_pxt_13eb.px/

filepath <- '/Users/tatu/Desktop/startup/hedged-fund/'
setwd(filepath)
data <- read.csv('apartments_final.csv', header = T)

yksiot_vuokra <- 'https://pxdata.stat.fi:443/PxWeb/sq/6fd4788c-806e-4ea4-9f5e-4b08e06f4867'
kaksiot_vuokra <- 'https://pxdata.stat.fi:443/PxWeb/sq/353c380e-3bd0-4f0e-8eaa-716774d21250'
kolmiot_vuokra <- 'https://pxdata.stat.fi:443/PxWeb/sq/eb443055-7919-428f-8ef9-64eddbb8e3ec'

download.file(yksiot_vuokra, paste(filepath, 'yksiot_vuokra.csv', sep=''), mode = 'wb')
download.file(kaksiot_vuokra, paste(filepath, 'kaksiot_vuokra.csv', sep=''), mode = 'wb')
download.file(kolmiot_vuokra, paste(filepath, 'kolmiot_vuokra.csv', sep=''), mode = 'wb')

vuokra_yksiot <- read.csv('yksiot_vuokra.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
vuokra_kaksiot <- read.csv('kaksiot_vuokra.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
vuokra_kolmiot <- read.csv('kolmiot_vuokra.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

yksiot_hinta <- 'https://pxdata.stat.fi:443/PxWeb/sq/251b5a57-69df-4836-9ca3-39c150cfabeb'
kaksiot_hinta <- 'https://pxdata.stat.fi:443/PxWeb/sq/deece26f-c39b-4704-8acd-ccb7307973d2'
kolmiot_hinta <- 'https://pxdata.stat.fi:443/PxWeb/sq/1bd794e8-068a-46ba-ab90-3eeef0634642'

download.file(yksiot_hinta, paste(filepath, 'yksiot_hinta.csv', sep=''), mode = 'wb')
download.file(kaksiot_hinta, paste(filepath, 'kaksiot_hinta.csv', sep=''), mode = 'wb')
download.file(kolmiot_hinta, paste(filepath, 'kolmiot_hinta.csv', sep=''), mode = 'wb')

hinta_yksiot <- read.csv('yksiot_hinta.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
hinta_kaksiot <- read.csv('kaksiot_hinta.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
hinta_kolmiot <- read.csv('kolmiot_hinta.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
