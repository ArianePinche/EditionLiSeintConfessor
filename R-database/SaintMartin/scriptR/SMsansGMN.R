# Load libraries
setwd("/Users/arianepinche/Documents/Github/EditionLiSeintConfessor/R-database/SaintMartin/scriptR")
library("utf8", lib.loc="/Library/Frameworks/R.framework/Versions/3.6/Resources/library")
library(stemmatology)
# Load data then convert them as matrix
saintMartin = read.csv("MartinSansG1M1N.csv", sep=";", row.names=1)
saintMartinMatrix <- as.matrix(saintMartin)
View(saintMartinMatrix)

# Draw a stemma
#View(saintMartinMatrix)
#saintMartinDbs = PCC(saintMartinMatrix, ask = FALSE, threshold = 0.04)
#, omissionsAsReadings = TRUE,
#alternateReadings = TRUE, verbose = TRUE)
saintMartinDbs = PCC(saintMartinMatrix[100:400, ], ask = FALSE, threshold = 0.06)
#saintMartinDbs = PCC(saintMartinMatrix[400:800, ], ask = FALSE, threshold = 0.05)
saintMartinDbs = PCC(saintMartinMatrix[800:1200, ], ask = FALSE, threshold = 0.06)
saintMartinDbs = PCC(saintMartinMatrix[1200:1645, ], ask = FALSE, threshold = 0.06)

#View(saintMartinDbs)
stemma = PCC.Stemma(saintMartinDbs, ask = FALSE)
View(stemma)


