#Load libraries
setwd("/Users/arianepinche/Documents/Github/EditionLiSeintConfessor/R-database/SaintMartin/scriptR")
library("utf8", lib.loc="/Library/Frameworks/R.framework/Versions/3.6/Resources/library")
library(stemmatology)
# Load data then convert them as matrix
saintMartin = read.csv("SMttms.csv", sep=";", row.names=1)
saintMartinMatrix <- as.matrix(saintMartin)
View(saintMartinMatrix)

# Draw a stemma
#View(saintMartinMatrix)
#saintMartinDbs = PCC(saintMartinMatrix, ask = TRUE)
#omissionsAsReadings = TRUE,
#alternateReadings = TRUE, verbose = TRUE)
saintMartinDbs = PCC(saintMartinMatrix[100:400, ], ask = FALSE, threshold = 0.05)
#saintMartinDbs = PCC(saintMartinMatrix[400:800, ], ask = TRUE, threshold = 0.035)
#saintMartinDbs = PCC(saintMartinMatrix[800:1200, ], ask = TRUE, threshold = 0.015)
#saintMartinDbs = PCC(saintMartinMatrix[1200:1600, ], ask = TRUE, threshold = 0.015)
saintMartinDbs = PCC(saintMartinMatrix[1600:2000, ], ask = FALSE,threshold = 0.04)
saintMartinDbs = PCC(saintMartinMatrix[2000:2400, ], ask = FALSE,threshold = 0.04)
#saintMartinDbs = PCC(saintMartinMatrix[2400:2800, ], ask = TRUE,threshold = 0.03)
#saintMartinDbs = PCC(saintMartinMatrix[2800:3200, ], ask = TRUE,threshold = 0.01)
#saintMartinDbs = PCC(saintMartinMatrix[3200:3700, ], ask = TRUE,threshold = 0.025)
#saintMartinDbs = PCC(saintMartinMatrix[100:800, ], ask = TRUE,threshold = 0.019)
#saintMartinDbs = PCC(saintMartinMatrix[1600:2400, ], ask = TRUE,threshold = 0.015)

#saintMartinDbs = PCC(saintMartinMatrix[1000:2000, ], ask = TRUE)
#saintMartinDbs = PCC(saintMartinMatrix, ask = TRUE)
#View(saintMartinDbs)
stemma = PCC.Stemma(saintMartinDbs, ask = FALSE)
View(stemma)


