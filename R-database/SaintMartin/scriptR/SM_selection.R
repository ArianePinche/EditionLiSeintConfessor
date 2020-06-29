# Load libraries
setwd("/Users/arianepinche/Documents/Github/EditionLiSeintConfessor/R-database/SaintMartin/scriptR")
library("utf8", lib.loc="/Library/Frameworks/R.framework/Versions/3.6/Resources/library")
library(stemmatology)
# Load data then convert them as matrix
saintMartin = read.csv("SM_selection.csv", sep=";", row.names=1)
saintMartinMatrix <- as.matrix(saintMartin)
View(saintMartinMatrix)

# Draw a stemma
saintMartinDbs = PCC(saintMartinMatrix, ask = FALSE, threshold = 0.05)

#View(saintMartinDbs)
stemma = PCC.Stemma(saintMartinDbs, ask = FALSE)
View(stemma)


