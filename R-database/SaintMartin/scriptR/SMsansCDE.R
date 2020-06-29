# Load libraries
setwd("/Users/arianepinche/Documents/github/R-database/SaintMartin")
library("utf8", lib.loc="/Library/Frameworks/R.framework/Versions/3.6/Resources/library")
library(stemmatology)
# Load data then convert them as matrix
saintMartin = read.csv("MartinsansCDE.csv", sep=";", row.names=1)
saintMartinMatrix <- as.matrix(saintMartin)
View(saintMartinMatrix)

# Draw a stemma
#View(saintMartinMatrix)
saintMartinDbs = PCC(saintMartinMatrix, ask = FALSE, threshold = 0.05)

#, omissionsAsReadings = TRUE,
#alternateReadings = TRUE, verbose = TRUE)
#saintMartinDbs = PCC(saintMartinMatrix[100:400, ], ask = FALSE, threshold = 0.06)
#saintMartinDbs = PCC(saintMartinMatrix[400:800, ], ask = FALSE, threshold = 0.06)
#saintMartinDbs = PCC(saintMartinMatrix[800:1200, ], ask = FALSE, threshold = 0.06)
#saintMartinDbs = PCC(saintMartinMatrix[1200:1600, ], ask = TRUE, threshold = 0.015)

#saintMartinDbs = PCC(saintMartinMatrix[2800:3200, ], ask = TRUE,threshold = 0.01)
#saintMartinDbs = PCC(saintMartinMatrix[3200:3700, ], ask = TRUE,threshold = 0.025)
saintMartinDbs = PCC(saintMartinMatrix[100:800, ], ask = FALSE,threshold = 0.04)
#super Arbre généré avec la ligne précédente
saintMartinDbs = PCC(saintMartinMatrix[800:1600, ], ask = FALSE,threshold = 0.04)


#View(saintMartinDbs)
stemma = PCC.Stemma(saintMartinDbs, ask = FALSE)
View(stemma)


