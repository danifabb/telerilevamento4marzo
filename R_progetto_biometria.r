#il dataset BCI_env.txt ha alcuni elementi mancanti NA 
#error: line 9 did not have 9 elements; nella riga 9 manca il valore della variabile "Precipitation"
#la stessa cosa si verifica nella riga 21
#dobbiamo quindi specificare alcuni argomenti perché R sappia come comportarsi con i valori mancanti
?read.table
#l'argomento sep = " " serve per indicare che il separatore è uno spazio vuoto. In questo modo, non c'è slittamento a sinistra delle righe con i dati mancanti
#l'argomento fill = T serve per importare il dato anche se le righe hanno lunghezze diverse
#l'argomento header = T serve per indicare che prima riga = nomi delle colonne (intestazione)
BCI_env <- read.table("data/BCI_env.txt", sep = " ", fill = T, header = T) 
BCI <- read.csv("data/BCI.csv")
View(BCI)

#conto il numero di osservazioni, specie e variabili ambientali
nrow(BCI) #50 osservazioni = 50 righe
ncol(BCI) #225 specie = colonne di BCI
ncol(BCI_env) #9 variabili ambientali = colonne di BCI_env

str(BCI_env)
str(BCI)
install.packages("vegan")

library(vegan)
?BCI

summary(BCI_env)
