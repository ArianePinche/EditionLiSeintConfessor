# Load libraries
setwd("/Users/arianepinche/Documents/Github/EditionLiSeintConfessor/R-database/SaintMartin/scriptR")
library("utf8", lib.loc="/Library/Frameworks/R.framework/Versions/3.6/Resources/library")
library(stemmatology)
# Load data then convert them as matrix
saintMartin = read.csv("MartinSansDE.csv", sep=";", row.names=1)
saintMartinMatrix <- as.matrix(saintMartin)
View(saintMartinMatrix)

# Draw a stemma
#View(saintMartinMatrix)
saintMartinDbs = PCC(saintMartinMatrix, ask = FALSE, threshold = 0.05)

#, omissionsAsReadings = TRUE,
#alternateReadings = TRUE, verbose = TRUE)
saintMartinDbs = PCC(saintMartinMatrix[100:400, ], ask = TRUE, threshold = 0.06)
#Très bon stemma à partir de cette ligne => contamination ac F2 à l'origine ou C3 supposée.
saintMartinDbs = PCC(saintMartinMatrix[100:600, ], ask = FALSE, threshold = 0.06)
# Pas d'arbre mais suppose une contaminsation ac F2
# saintMartinDbs = PCC(saintMartinMatrix[100:600, ], ask = FALSE, threshold = 0.05)
# Bon arbre et suppose une contaminsation ac F2
#saintMartinDbs = PCC(saintMartinMatrix[100:800, ], ask = FALSE, threshold = 0.03)
#Bon arbre, mais plus de détection de la contamination

#La tranche de 400*400 sont celles qui fonctionnent le mieux

#saintMartinDbs = PCC(saintMartinMatrix[600:1000, ], ask = FALSE, threshold = 0.04)
# Deux bons arbres a tantôt F2 ac C, tantôt du coté de G. Pas de détection de la contamination.
#saintMartinDbs = PCC(saintMartinMatrix[1000:1400, ], ask = FALSE, threshold = 0.05)
# Bon arbre, propose C2 comme arbre conflituel
#saintMartinDbs = PCC(saintMartinMatrix[1400:1800, ], ask = FALSE, threshold = 0.05)
#propose C3 ou F2 comme lieu de contamination => bon arbre
saintMartinDbs = PCC(saintMartinMatrix[1800:2200, ], ask = FALSE, threshold = 0.06)
#propose C1 (pas d'arbre) ou F2 comme problématique => arbre inétressant
#saintMartinDbs = PCC(saintMartinMatrix[2200:2600, ], ask = FALSE, threshold = 0.04)
#Ne fonctionne pas ac indice plu haut_ Un stemma interressant (F1 ou C2 = contamination)
saintMartinDbs = PCC(saintMartinMatrix[2600:3000, ], ask = FALSE, threshold = 0.06)
#Deuxième arbre interessant, F2 ac G1
#saintMartinDbs = PCC(saintMartinMatrix[3000:3365, ], ask = FALSE, threshold = 0.04)
# Problème de conflit C2 ou F2 ou G1 => 2e arbre intéressant F2 ac G1


#View(saintMartinDbs)
stemma = PCC.Stemma(saintMartinDbs, ask = FALSE)
View(stemma)


