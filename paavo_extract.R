# paavo extractor
# https://pxdata.stat.fi/PxWeb/pxweb/fi/Postinumeroalueittainen_avoin_tieto/Postinumeroalueittainen_avoin_tieto__uusin/paavo_pxt_12ey.px/table/tableViewLayout1/

# women / all habitants regression to price
# average age regression to price

# mise en place
rm(list = ls())
filepath <- '/Users/tatu/Desktop/startup/hedged-fund/'
setwd(filepath)

# asukasrakenne
asukkaat <- 'https://pxdata.stat.fi:443/PxWeb/sq/613b2d81-db2d-4e71-991d-4c993250f3fe'
naiset <- 'https://pxdata.stat.fi:443/PxWeb/sq/ab563a58-5a97-44c8-9cc8-a40db8eab882'
ika <- 'https://pxdata.stat.fi:443/PxWeb/sq/d2f9a846-63ac-42d4-a2ff-ac3ebc322e98'

download.file(asukkaat, paste(filepath, 'asukkaat.csv', sep=''), mode = 'wb')
download.file(naiset, paste(filepath, 'naiset.csv', sep=''), mode = 'wb')
download.file(ika, paste(filepath, 'ika.csv', sep=''), mode = 'wb')

asukkaat_df <- read.csv('asukkaat.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
naiset_df <- read.csv('naiset.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
ika_df <- read.csv('ika.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

# asukkaiden koulutusaste
aikuiset <- 'https://pxdata.stat.fi:443/PxWeb/sq/b870c7b1-2441-464b-97a3-7c7fc9adb959'
koulutetut <- 'https://pxdata.stat.fi:443/PxWeb/sq/53d163d3-2e12-498b-b7fa-b439aac60421' #ylempi korkeakoulututkinto

download.file(aikuiset, paste(filepath, 'aikuiset.csv', sep=''), mode = 'wb')
download.file(koulutetut, paste(filepath, 'koulutetut.csv', sep=''), mode = 'wb')

aikuiset_df <- read.csv('aikuiset.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
koulutetut_df <- read.csv('koulutetut.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

# käytettävissä olevat rahatulot
mediaanitulo <- 'https://pxdata.stat.fi:443/PxWeb/sq/a151caf8-ae53-4b1f-bc85-81be0b54d410'
keskituloiset_lkm <- 'https://pxdata.stat.fi:443/PxWeb/sq/f96f4a67-65a8-476d-8f2b-ccc3f9d1ff01'
ostovoimakertyma <- 'https://pxdata.stat.fi:443/PxWeb/sq/025458df-79bd-4fe6-86dd-938549d0c96d'

download.file(mediaanitulo, paste(filepath, 'mediaanitulo.csv', sep=''), mode = 'wb')
download.file(keskituloiset_lkm, paste(filepath, 'keskituloiset.csv', sep=''), mode = 'wb')
download.file(ostovoimakertyma, paste(filepath, 'ostovoimakertyma.csv', sep=''), mode = 'wb')

mediaanitulo_df <- read.csv('mediaanitulo.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
keskituloiset_df <- read.csv('keskituloiset.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
ostovoimakertyma_df <- read.csv('ostovoimakertyma.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

# talouksien koko ja elamanvaihe
taloudet_lkm <- 'https://pxdata.stat.fi:443/PxWeb/sq/8e21ce98-bf33-4f5a-b2cd-1968c42eb211'
omistustaloudet <- 'https://pxdata.stat.fi:443/PxWeb/sq/4bf73b96-7f5d-4dc4-9d60-9df4854f19e3'
elakelaiset <- 'https://pxdata.stat.fi:443/PxWeb/sq/20ec3c61-8b56-4756-a9fd-37fb3d4635c1'
lapsitaloudet <- 'https://pxdata.stat.fi:443/PxWeb/sq/4969762c-ca8e-4048-bca6-5e8b11a3bb79'
nuoret_yksinasuvat <- 'https://pxdata.stat.fi:443/PxWeb/sq/41e7dc17-b05c-4059-8cbb-ab8fee2e1ca3' # hypoteesi 1: nuoret muuttavat useamming, joten hinnoissa enemmän volatiliteettia

download.file(taloudet_lkm, paste(filepath, 'taloudet.csv', sep=''), mode = 'wb')
download.file(omistustaloudet, paste(filepath, 'omistustaloudet.csv', sep=''), mode = 'wb')
download.file(elakelaiset, paste(filepath, 'elakelaiset.csv', sep=''), mode = 'wb')
download.file(lapsitaloudet, paste(filepath, 'lapsitaloudet.csv', sep=''), mode = 'wb')
download.file(nuoret_yksinasuvat, paste(filepath, 'nuoret_yksinasuvat.csv', sep=''), mode = 'wb')

taloudet_df <- read.csv('taloudet.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
omistustaloudet_df <- read.csv('omistustaloudet.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
lapsitaloudet_df <- read.csv('lapsitaloudet.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
elakelaiset_df <- read.csv('elakelaiset.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
nuoret_yksinasuvat_df <- read.csv('nuoret_yksinasuvat.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

# työpaikat toimialoittain
tyopaikat <- 'https://pxdata.stat.fi:443/PxWeb/sq/9d6ddf25-ef83-4c28-8947-1ef2ba48343a'

download.file(tyopaikat, paste(filepath, 'tyopaikat.csv', sep=''), mode = 'wb')

tyopaikat_df <- read.csv('tyopaikat.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

# asukkaiden pääasiallinen toiminta
asukkaat <- 'https://pxdata.stat.fi:443/PxWeb/sq/482766d8-7e0e-4020-beef-868737353471'
opiskelijat <- 'https://pxdata.stat.fi:443/PxWeb/sq/c6919826-cc68-4d89-8399-eeee4aa851bf'
tyottomat <- 'https://pxdata.stat.fi:443/PxWeb/sq/fc33e6b9-9132-42ff-ae9b-a87911525ee4'

download.file(asukkaat, paste(filepath, 'asukkaat.csv', sep=''), mode = 'wb')
download.file(opiskelijat, paste(filepath, 'opiskelijat.csv', sep=''), mode = 'wb')
download.file(tyottomat, paste(filepath, 'tyottomat.csv', sep=''), mode = 'wb')

asukkaat_df <- read.csv('asukkaat.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
opiskelijat_df <- read.csv('opiskelijat.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")
tyottomat_df <- read.csv('tyottomat.csv', header = T, skip = 2, stringsAsFactors=FALSE, fileEncoding="latin1")

plot(asukkaat_df$Vuosi, asukkaat_df$X00530..Kallio..Helsinki., type='l')


# TODO: setup github https://sites.northwestern.edu/researchcomputing/resources/using-git-and-github-with-r-rstudio/





