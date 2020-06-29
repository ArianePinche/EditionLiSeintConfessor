# Load libraries
setwd("/Users/arianepinche/Documents/Github/EditionLiSeintConfessor/R-database/SaintMartin/scriptR")
library("utf8", lib.loc="/Library/Frameworks/R.framework/Versions/3.6/Resources/library")
library(stemmatology)
# Load data then convert them as matrix
saintMartin = read.csv("SMsansC2C3.csv", sep=";", row.names=1)
saintMartinMatrix <- as.matrix(saintMartin)
View(saintMartinMatrix)

# Draw a stemma
#View(saintMartinMatrix)
#saintMartinDbs = PCC(saintMartinMatrix, ask = FALSE, threshold = 0.05)
#, omissionsAsReadings = TRUE,
#alternateReadings = TRUE, verbose = TRUE)

#Les tranches de 400*400 sont celles qui fonctionnent le mieux
#Indices plus bas que sans D et E

saintMartinDbs = PCC(saintMartinMatrix[100:400, ], ask = FALSE, threshold = 0.05)
#bon stemma, rapporchement F2 et E2, C1 en haut de l'arbre
saintMartinDbs = PCC(saintMartinMatrix[600:1000, ], ask = FALSE, threshold = 0.06)
# Conflit C1 ou F2; Arbre n°2 bon,  F2  du coté de GMN.
#saintMartinDbs = PCC(saintMartinMatrix[1000:1400, ], ask = FALSE, threshold = 0.02)
# D et E trouvé comme conflictuel => stemma ne passe pas => 3 branche F2{D,E2} C1 G{M1N}
saintMartinDbs = PCC(saintMartinMatrix[1400:1800, ], ask = FALSE, threshold = 0.06)
# Bon arbre 2, F2 ac GMN, pas de contamination détectée
#saintMartinDbs = PCC(saintMartinMatrix[1800:2200, ], ask = FALSE, threshold = 0.03)
#Conflit C1 et F2,  arbre inétressant G{MN} {{C1F2}{DE2}}
#saintMartinDbs = PCC(saintMartinMatrix[2200:2600, ], ask = FALSE, threshold = 0.02)
#Conflit E2, Arbre ne fonctionne pas.
#saintMartinDbs = PCC(saintMartinMatrix[2600:3000, ], ask = FALSE, threshold = 0.03)
#Conflit = F2, Arbre étrange ac C1 du côté de GMN, mais montre une proximité DEF.
#saintMartinDbs = PCC(saintMartinMatrix[3000:3400, ], ask = FALSE, threshold = 0.03)
#Arbre étrange ac C1 du côté de GMN, mais montre une proximité DEF.
#saintMartinDbs = PCC(saintMartinMatrix[3400:3697, ], ask = FALSE, threshold = 0.06)
#Problème à cause de la lacune de MN et pas assez de données. 


#View(saintMartinDbs)
stemma = PCC.Stemma(saintMartinDbs, ask = FALSE)
View(stemma)


