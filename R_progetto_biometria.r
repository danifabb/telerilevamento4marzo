#il dataset BCI_env.txt ha alcuni elementi mancanti NA 
#error: line 9 did not have 9 elements; nella riga 9 manca il valore della variabile "Precipitation"
#la stessa cosa si verifica nella riga 21
#dobbiamo quindi specificare alcuni argomenti perché R sappia come comportarsi con i valori mancanti
?read.table
#l'argomento sep = " " serve per indicare che il separatore è uno spazio vuoto. In questo modo, non c'è slittamento a sinistra delle righe con i dati mancanti
#l'argomento fill = T serve per importare il dato anche se le righe hanno lunghezze diverse
#l'argomento header = T serve per indicare che prima riga = nomi delle colonne (intestazione)
# converte i vettori di tipo character in fattori
BCI_env <- read.table("data/BCI_env.txt", sep = " ", fill = T, header = T, na.strings = c("", NA)) 
BCI <- read.csv("data/BCI.csv")

View(BCI)

#conto il numero di osservazioni, specie e variabili ambientali
nrow(BCI) #50 osservazioni = 50 righe
ncol(BCI) #225 specie = colonne di BCI
ncol(BCI_env) #9 variabili ambientali = colonne di BCI_env

#si carica il pacchetto vegan per avere le informazioni riguardo al dataset
install.packages("vegan")
library(vegan)
?BCI

#dopo avere esaminato la struttura di BCI_env, converto i vettori di tipo character in fattori 
str(BCI_env)
BCI_env$Age.cat <- factor(BCI_env$Age.cat, ordered = T, levels = c("c2", "c3")) #fattore ordinato
factor(BCI_env$Geology) #non so lasciarlo character o fare factor
BCI_env$Habitat <- factor(BCI_env$Habitat, levels = c("Young", "OldSlope", "OldLow", "OldHigh", "Swamp")) #fattore non ordinato
BCI_env$Stream <- factor(BCI_env$Stream, levels = c("Yes", "No"))

class(BCI_env$Geology)
str(BCI_env$Habitat)

#controllo che tra i valori unici non ci siano anche spazi vuoti
unique(BCI_env$Precipitation)
unique(BCI_env$Elevation)

str(BCI) #vettori integer per abbondanza di specie

summary(BCI_env) #ci sono 3 NA, che voglio eliminare assieme alle righe (osservazioni) in cui sono presenti
summary(BCI)

matrix_na <- which(is.na(BCI_env), arr.ind = T) #ottengo una matrice delle coordinate dei valori NA 
matrix_na[ , 1] #seleziono solo la prima colonna, ovvero quella che elenca le righe che hanno NA
BCI_env <- na.omit(BCI_env) #elimino le osservazioni con NA nel dataframe
View(BCI_env)
BCI <- BCI[-(matrix_na[ , 1]), ] #elimino le stesse righe nella matrice di comunità

nrow(BCI_env) #47

nrow(BCI)

#distribuzione univariata

#caratteri quantitativi
hist(BCI_env$UTM.EW,
     xlab = "UTM coordinates (zone 17N) East-West",
     main = "",
     breaks = 10) #10 

hist(BCI_env$UTM.NS,
     xlab = "UTM coordinates (zone 17N) North-South",
     main = "",
     breaks = 5) #cosa è un density plot?

hist(BCI_env$Precipitation,
     xlab = "Precipitation (mm/year)",
     xlim = c(2200, 2800),
     main = "")

hist(BCI_env$Elevation,
     xlab = "Elevation (m)",
     xlim = c(80, 160),
     main = "")

hist(BCI_env$EnvHet,
     xlab = "Environmental Heterogeneity (Simpson)",
     main = "",
     breaks = 8) #indice che va da 0 a 10

png("outputs/environmental_heterogeneity.png", width = 1200, height = 1000, res = 300)
hist(BCI_env$EnvHet,
     xlab = "Environmental Heterogeneity (Simpson)",
     main = "",
     breaks = 8)
dev.off()

?hist

#caratteri qualitativi

agecat <- table(BCI_env$Age.cat)
barplot(agecat,
        xlab = "Forest age category",
        ylab = "N° of plots")

habitat <- table(BCI_env$Habitat)
habitat
barplot(habitat,
        xlab = "Habitat",
        ylab = "N° of plots")

stream <- table(BCI_env$Stream)
stream
barplot(stream,
        xlab = "River",
        ylab = "N° of plots")

jpeg("outputs/habitat.jpeg", width = 2000, height = 1200, res = 300)
habitat <- table(BCI_env$Habitat)
barplot(habitat,
        xlab = "Habitat",
        ylab = "N° of plots")
dev.off()

BCI_pa <- decostand(BCI, method = "pa") #trasformo matrice di abbondanza in matrice di assenza/presenza
View(BCI_pa)
head(BCI_pa)[, 1:5] 

sr <- specnumber(BCI_pa) #ricchezza di specie per sito
View(sr) #es. nella prima osservazione abbiamo incontrato 93 specie

BCI_env$sr <- sr #add it to the environmental variables dataframe as a new column
str(BCI_env)

#sr_1 <- specnumber(BCI)
#sort(specnumber(BCI, MARGIN = 2))

plot(BCI_env$UTM.EW,
     BCI_env$sr) 
cor.test(BCI_env$UTM.EW,
         BCI_env$sr,
         alternative = "greater") #p-value = 0.88 e intervallo di confidenza -0.4009874  1.0000000 (passa da neg a pos - altra fonte di incertezza)

#tuttavia, correlazione -18 è leggermente negativa -> provo alternativa "less"

plot(BCI_env$UTM.EW,
     BCI_env$sr) 
cor.test(BCI_env$UTM.EW,
         BCI_env$sr,
         alternative = "less") #p-value = 0.12, sempre non significativo

plot(BCI_env$UTM.NS,
     BCI_env$sr) 
cor.test(BCI_env$UTM.NS,
         BCI_env$sr,
         alternative = "greater") #p-value = 0.26

plot(BCI_env$Precipitation,
     BCI_env$sr) 
cor.test(BCI_env$Precipitation,
         BCI_env$sr,
         alternative = "greater") #la deviazione standard (ovvero la variabilità) è 0, perché abbiamo un unico valore

plot(BCI_env$EnvHet,
     BCI_env$sr) 
cor.test(BCI_env$EnvHet, 
         BCI_env$sr,
         alternative = "greater") #p-value = 0.45 e cor = 0.021











