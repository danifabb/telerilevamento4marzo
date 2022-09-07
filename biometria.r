print("Hello, World!")

1 + 1 #addizione
2 - 1
2 * 3
4 / 2
3^2
3**2
# %% serve per calcolare il resto (o modulo) di una operazione es. 5/2 = 2, col resto di 1
5 %% 2
# %/% serve per calcolare il quoziente intero di una divisione
5 %/% 2

x <- 42 #assegnazione di variabile
x
x <- 21
x
my_apples <- 5 #sto contando la frutta che ho in dispensa
my_apples
my_oranges <- 6
my_apples + my_oranges

rm(x) #remove
x
# ho eliminato x quindi non me lo trova più
ls() # lista di tutto ciò che esiste nell'environment, function call/ chiamata di funzione base

my_numeric <- 42 # scrivo i numeri così come sono
my_integer <- 42L #numero intero/ integer
my_double <- 42.24 # numeri decimali
# di default, ogni numero è considerato decimale, se scrivo 42 R lo considera decimale quindi devo specificare 42L perché sia intero
my_character <- "universe" #character
my_logical <- T #valori bouleani, o logici, possono essere veri o falsi, corrispondono a 1 o 0
# T = TRUE; F = FALSE

class(my_numeric) #di che classe fa parte l'oggetto 42?
class(my_double)
class(my_integer)
class(my_integer)
class(my_logical)

my_numeric_vector <- c(1,10, 49) #vettore numerico composto da 3 elementi
my_numeric_vector
my_character_vector <- c("a", "b", "c")
my_character_vector
my_character_vector <- c("a", "b", "c", x) #numero viene trasformato in carattere "42" (coercion)
my_character_vector
my_numeric_vector <- c(1, 10, 49, T) #T convertito in 1 numerico
my_numeric_vector
my_character_vector <- c(my_character_vector, x)
my_character_vector                    
my_logical_vector <- c(T, T, FALSE)
my_logical_vector

my_apples_vector <- c(50, 70, 80, 30, 150) #numero di mele raccolte al giorno, da lun a ven
my_apples_vector
my_oranges_vector <- c(40, 60, 80, 100, 80) #numero di arance lun/ven
my_oranges_vector
#voglio sapere quante mele e arance ho raccolto per ogni giornata es. numero di mele + arance raccolte il primo giorno
my_fruit_vector <- my_oranges_vector + my_apples_vector
my_fruit_vector
my_oranges_vector <- c(40, 60, 80, 100) #rimuovo ultimo valore
my_fruit_vector <- my_oranges_vector + my_apples_vector
my_fruit_vector #siccome il secondo oggetto è più corto, vengono sommati l'ultimo valore del primo oggetto e il primo valore del secondo oggetto (si ricomincia daccapo): 150 + 40 = 190
# Warning message: In my_oranges_vector + my_apples_vector : longer object length is not a multiple of shorter object length
#attenzione: se i vettori sono di lunghezze l'uno multiplo dell'altro, non c'è neppure il warning, avviene automaticamente il "riciclo"
my_numeric_vector <- 1:10 #sequenza numeri da 1 a 10
10:1
rep(c("a", "b", "c"), times = 2) #due chiamate di funzione una dentro l'altra
rep(c("a", "b", "c"), each = 2)

#lezione 3
1:10
seq(1, 10) #stessa cosa di riga precedente
seq(1, 10, by = 2) #step by 2, tutti i numeri dispari compresi tra 1 e 10
seq(10, 1, by = -2) # 10 8 6 4 2

rep(1:2, times = 10)
rep(1:2, each = 10)

?seq # si apre pagina nel pannello di aiuto

a <- seq(1, 10, 3)
a
seq(0, 1, .01) #non usare seq con i double, eccetto per certi casi dove è utile, come qui
seq(1, 10, 2)
help("rep")

apples_vector <- c(20,50, 30, 40, 100)
oranges_vector <- c(70, 70, 50, 20, 80)
class(oranges_vector) #numeric, perché non ho messo L dopo i numeri, quindi no integer
names(apples_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
apples_vector # assegno nome a ciascun elemento del vettore
# Monday   Tuesday Wednesday  Thursday    Friday 
       20        50        30        40       100 
names(oranges_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
oranges_vector # assegno nome a ciascun elemento del vettore
apples_vector + oranges_vector

typeof(1.1:3)
typeof(oranges_vector)
is.numeric(oranges_vector) #domanda vero o falso
is.character(oranges_vector)
as.character(oranges_vector) #coercizione da numeric a character ovvero numeri tra virgolette
as.logical(oranges_vector) #ogni valore doverso da 0 viene convertito in true

character_vector <- c("a", "b")
typeof(character_vector)
is.character(character_vector)
as.numeric(character_vector) # esce NA NA, ovvero nessuno valore, coercizione utilizzata male perché un character non può diventare un numero

logical_vector <- c(T, F)
as.integer(logical_vector)
as.character(logical_vector)

length(logical_vector)
length(oranges_vector)
length(1)
length(logical()) # fa 0
length(vector())
length(c())

#come estrarre uno o più elementi
apples_vector
apples_wednesday <- apples_vector["Wednesday"] # seleziono unica giornata
apples_wednesday
apples_vector[c("Monday", "Friday")]

# in R il primo elemento ha posizione 1 (indicizzazione o subsetting)
apples_vector[1]
apples_vector[5]
apples_vector[length(apples_vector)] #estraiamo l'ultimo elemento, che ha posizione pari alla lunghezza
apples_vector[1:3]
apples_vector[3:1]
apples_vector[c("Friday", "Monday")]
apples_vector[-c(1, 3)] # sottraggo gli elementi 1 e 3, ottengo solo elementi 2, 4 e 5
apples_vector[-(2:4)] # solo Mon e Fri
apples_vector[-2:4] #errore: solo 0 può essere mischiato con valori negativi
apples_vector[-5:-2] # solo lunedì
selection_vector <- apples_vector > 80 # quali maggiore di 80?
apples_vector[selection_vector]  
apples_vector[apples_vector <= 40] # uguale deve andare sempre dopo > e <
apples_vector[apples_vector == 40] #attenzione ai due uguali
apples_vector[apples_vector != 40]

# LE MATRICI: due dimensioni, x e y, ogni elemento è definito da una coppia di coordinate
matrix(1:9, nrow = 3) #

# cosa sono i numerini a margine tra []? Sono gli indici
1:30
-20:20 # il 25esiamo valore è 4
# nella matrice ogni elemento è identificato da due coordinate, sempre tra []
#      [,1] [,2] [,3]
#[1,]    1    4    7
#[2,]    2    5    8
#[3,]    3    6    9

#matrice di comunità es. tabella specie per sito
garden <- c(10, 2) #due specie, della prima trovo 8 esemplari e 2 della seconda
forest <- c(8, 3)
hedgerow <- c(1, 12)
community_matrix <- matrix(c(garden, forest, hedgerow), nrow = 3, byrow = TRUE)
community_matrix

species <- c("Parus major", "Erithacus rubecula")
sites <- c("Garden", "Forest", "Hedgerow")
colnames(community_matrix) <- species
rownames(community_matrix) <- sites

passer <- c(15, 2, 5)
cbind(community_matrix, passer)
community_matrix <- cbind(community_matrix, passer)

park <- c(10, 1, 8)
rbind(community_matrix, park)
community_matrix <- rbind(community_matrix, park)

colnames(community_matrix)[3] <- "Passer domesticus" 
rownames(community_matrix)[4] <- "Park"

#lezione 4
colnames(community_matrix) #vettore di tipo character
colnames(community_matrix)[3]

dim(community_matrix) # vettore integer di lunghezza 2, rappresentanti il numero di righe (primo numero sempre) e di colonne
nrow(community_matrix)
ncol(community_matrix)
colSums(community_matrix) #vettore di tipo integer con ciacun elemento che ha il proprio nome
rowSums(community_matrix) #quanti passeriformi abbiamo visto per sito in totale?

rbind(community_matrix, Total = colSums(community_matrix))
cbind(community_matrix, Total = rowSums(community_matrix)) #aggiungo totale alla tabella
community_matrix + 2 # valore scalare applicato a ogni valore
community_matrix*2
community_matrix[1, 2] #seleziono/ estraggo elemento da tabella: sempre prima riga e poi colonna
community_matrix[1, ] #intera prima riga
community_matrix[1:2, ] #prima e seconda riga
community_matrix[c(1, 3), ] # prima e terza riga

community_matrix[-1, ] #manca la prima riga
community_matrix[, "Parus major"] #vettore che corrisponde alla colonna Parus major
community_matrix[2, "Parus major"]
community_matrix[, 2:ncol(community_matrix)]

#fattore = tipo speciale di vettore integer
#classificazione di piante in forme di crescita: fattore non ordinato
plants_vector <- c("Tree", "Grass", "Forb", "Grass", "Tree")
plants_vector # vettore di tipo character
plants_factor <- factor(plants_vector)
plants_factor # vettore di tipo factor: 3 livelli Forb Grass Tree, elencati in ordine alfabetico
as.integer(plants_factor) # ottengo struttura nascosta 

# factor ordinati: devo specificare l'ordine nella chiamata a factor
temperature_vector <- c("Low", "High", "Medium", "High", "Low")
# è comodo leggere il codice in verticale, puoi andare a capo
temperature_factor <- factor(temperature_vector,
                             ordered = T, 
                             levels = c("Low", "Medium", "High"))
#Levels: Low < Medium < High
# oppure: levels = temperature_order <- c("Low", "Medium", "High")
summary(temperature_factor) #ottengo le frequenze assolute con cui sono presenti i 3 elementi
summary(temperature_factor) / length(temperature_factor) 
#Low    Medium     High 
   0.4    0.2    0.4
summary(temperature_factor) / length(temperature_factor)*100
# Low    Medium   High 
    40     20     40 
substrate_vector <- c("L", "S", "S", "L", "S")
substrate_factor <- factor(substrate_vector) # 2 livelli
levels(substrate_factor) # "L", "S" tra virgolette perché non si tratta del fattore stesso, bensì delle labels
# voglio dare il nome esteso alle categorie, per maggiore chiarezza
levels(substrate_factor) <- c("Limestone", "Siliceous")
# così lo scrivo solo 1 volta per ciascun livello invece che tante volte rischiando di sbagliare

levels(substrate_factor) <- c("Limestone", "Siliceous")
# così lo scrivo solo 1 volta per ciascun livello invece che tante volte rischiando di sbagliare

#dataframes = strutture di dati rettangolari/ tabelle eterogenee
dat <- data.frame(
  id = 1:6,
  name = c("Eokochia saxicola", "Cytisus aeolicus", "Anthemis aeolica", "Centaurea aeolica", "Silene hicesia", "Genista tyrrhena"),
  has_legumes = c(F, T, F, F, T, F),
  population_size = c(50, 2000, 5000, 10000, 200, 3000),
  growth_form = factor(c("Herb", "Tree", "Herb", "Shrub", "Herb", "Tree" )))
# growth_form è factor perché ha categorie definite/ livelli

#lezione 5

dim(dat)
nrow(dat)
ncol(dat)
summary(dat)

(3+4)/2
(2000 + 3000)/2 # mediana per la popolation_size
# non sei riuscita a calcolare i quartili però (???) 

class(dat)
str(dat)

dat["1", ] #estraggo la prima riga
dat[1, ]
dat[1:2, ]
dat[c("1", "2"), ] #ottengo dataframe con le prime due righe
dat[ , 2] # ottengo un vettore unidimensionale, non più un dataframe
is.vector(dat[ , 2])
dat[ , 2, drop = F] # gli ordiniamo di non droppare la struttura e quindi il risultato assomiglia a dataframe
is.vector(dat[ , 2, drop = F])
is.data.frame(dat[ , 2, drop = F])
dat["name"] # ottengo dataframe
dat[, "name"] # ottengo vettore
dat["1"] # non funziona, ci vuole la virgola
dat[["name"]] # ottengo un vettore
dat[c("name", "id")] #dataframe delle prime due colonne
dat[1:2, c("id", "name")] # prime due righe e prima due colonne
dat[c("5", "6"), c("id", "name")] 
dat$id # vettore contenente valori della colonna
dat$has_legumes
dat$has_legumes == T #posso testare se questa colonna è true o false
dat[dat$has_legumes == T, ] # estraggo righe che soddisfano questa condizione: solo le leguminose vengono selzionate, ovvero Cytisus e Genista
dat[dat$has_legumes != T, ]
dat[dat$population_size < 3000, ]
dat <- dat[, -4] # tolgo quarta colonna
dat$growth_form <- NULL # tolgo ultima colonna
dat

#aggiungere colonne
cbind(dat, fid = 1:6) 
# non si può fare con le righe, perché non si può avere un vettore con tipi diversi di dati
# altro modo per aggiungere colonna, 
dat$id.2
dat$id.2 <- 1:6 # assegnazione
dat

#aggiungere righe: creo un nuovo dataframe da aggiungere in fondo
new_data <- data.frame(
  id = 7,
  name = "Limonium minutiflorium",
  has_legumes = F,
  id.2 =7)
rbind(dat, new_data) # riga aggiunta in modo estemporaneo
dat <- rbind(dat, new_data) # riga assegnata a dataframe
dat

# le liste: monodimensionali ma eterogenee, possono contenere tanti tipi di dati, matrici, dataframe, ecc
vec <- 1:10
mat <- matrix(1:9, ncol = 3)
dat <- mtcars #dataaframe già caricato in R
my_list <- list(vec, mat, dat) 
my_list <- list(my_vector = vec, my_matrix = mat, my_dataframe = dat) 

list(my_list, 1:10) # lista che sta all'interno della lista; l'intera lista è la prima componente del vettore, mentre la seconda componente è solo il vettore 1:10
# due modi per aggiungere elementi alla lista
my_list[["my_other_vector"]] <- c("blah", "blah", "blah") # ho aggiunto un quarto vettore
my_list$my_last_vector <- c(T, F, T)

str(my_list)
my_list[[3]] <- NULL #doppie parentesi indicizzano elementi all'interno della lista
my_list
str(my_list)
my_list[["my_vector"]]
my_list[[1]]
my_list[[1]][3] #seleziono terzo elemento della prima componente
my_list[[1]][3:6]

names(my_list) <- c("A", "B", "C", "D") # cambio i nomi o posso anche crearli da 0
str(my_list)

my_list2 <- list(1:2, T, c("hello", "world"))
names(my_list2) <- c("Prima", "Seconda", "Terza")
str(my_list2)

c(my_list, my_list2) # unisco le due liste, lista nuova formata da 7 componenti
list(my_list, my_list2) # creo 2 compoenti della lista, che sono a loro volta liste --> due liste annidate in una ulteriore lista
str(c(my_list, my_list2))
str(list(my_list, my_list2))

str(dat)

# lezione 6
class(NULL)
typeof(NULL) 
as.null(1:3) #lista vuota
is.null(NULL)
is.null(1:3)

list() #lista vuota
is.null(pairlist()) #tipo speciale di lista
is.null(vector())
pairlist()
?pairlist
str(list())
str(pairlist())
  
length(NULL) #0

#NA = not applicable/ not available = missing data in una cella vuota (oppure che non viene letta)
# se sommo una serie di dati e uno di essi è NA, il risultato sarà NA

class(NA) #logical è il tipo di default, poi può essere trasformato negli altri tipi
typeof(NA)
NA_character_ #coercion
class(NA_character_)
NA_integer_
vec <- c(1, NA, 4, 6, 10)
is.na(vec)
10 + vec # se sommo valore singolo a vettore di n elementi, numero viene sommato a ogni elemento
10 + NA

sum(1:3) # 1 + 2 + 3
sum(c(1, 2, 3 , NA)) #NA, R ci avvisa del valore mancante
sum(c(1, 2, 3 , NA), na.rm = T) #rimuovo NA prima di fare operazione
na.omit(c(1, 2, 3, NA)) # pulire dataset da NA
# [1] 1 2 3
# attr(,"na.action") #l'elemento su cui è compiuta azione omit è il quarto
# [1] 4
# attr(,"class")
# [1] "omit"

na.omit(c(4, 6, NA, 11, 16))
FALSE & NA #& è intersezione di due insiemi in logica --> il risultato è sempre falso
TRUE | NA
length(NA)

NaN #not a number
0/0 #indefinito = NaN
length(NaN)
class(NaN) #numeric
typeof(NaN) #double: inconsistenza del linguaggio
is.nan(NA)
is.nan(0/0)
0/0 == NaN

Inf
-Inf
1/0 #Inf
-1/0 #-Inf
class(Inf) #numeric

#installare e caricare pacchetti
install.packages("swirl")
library(swirl)
swirl()
version
rm(list = ls())

install.packages("vegan")
library(vegan)
vignette(package = "vegan")
vignette("intro-vegan")

sqrt(log(42)) #annido due funzioni, oppure:
log_42 <- log(42) #valore intermedio
sqrt(log_42)

#tante funzioni annidate sono difficili da leggere, oppure diventa lunga
#pipes
42 |> log() #42 viene lanciato nella funzione log
42 |> log() |> sqrt()

# se no si può usare %>% con il pacchetto magrittr

#lezione 7
add_two <- function(x) {
  x_plus_two <- x + 2
  return(x_plus_two)
}

add_two(5)
n <- add_two(5) #lo chiamo n così viene salvato nell'environment
n
n
rm(list=ls())

cheer_me <- function(nome) {
  cheer_string <- paste("Hello", nome, sep = " ")
  print(cheer_string)
}
 # cheer_me è il nome della funzione e cheer_string è la stringa che creiamo all'interno della funzione, poi diamo in pasto cheer_string alla funzione print
cheer_me("Daniela")
m <- cheer_me("Daniela")

#lista di argomenti per paste(..., sep = " ", collapse = NULL, recycle0 = F)

#analisi dati

dune <- read.table("data/dune.txt") # cover class values of 30 species at 20 sites
# le stringhe vengono importate automaticamente come characters, ma noi li vogliamo come fattori ordinabili --> specifichiamo che vogliamo fattori
# moisture e manure vengono considerati integer, ma non era quello che volevamo; 
dune.env <- read.csv("data/dune_env.csv", 
                     stringsAsFactors = T)
rm(dune.env)
dune.env <- read.csv("data/dune_env.csv")

str(dune) #matrice di comunità, livelli di copertura (abbondanza di specie) per 30 specie su 20 siti
str(dune.env) #dataframe con 5 variabili, relative agli stessi 20 siti di cui sopra
# moisture e manure vengono considerati integer, ma non era quello che volevamo
library(vegan)
?dune

dune.env$Moisture <- factor(dune.env$Moisture, ordered = T)
dune.env$Manure <- factor(dune.env$Manure, ordered = T)
dune.env$Use <- factor(dune.env$Use, ordered = T, levels = c("Hayfield", "Haypastu", "Pasture"))
#ATTENTA, qui ti viene NA nello Use e non sai perché
#lezione 8
#cicli = tecnica per iterare un processo
#cicli for: si sa già numero di iterazioni che si faranno

for (i in 1:10) {
     print(i)
}

library(vegan)
data(dune) #per caricare dati da pacchetto
sr <- vector() # creiamo oggetto che verrà modificato durante le iterazioni del ciclo; calcoliamo species richness

#vogliamo "ciclare" attraverso dune e attraversare ciascuna riga/plot/sito, calcolandone il numero di specie 
#uso sum, in modo che si faccia la somma del numero di specie per riga: selezioniamo ogni riga e facciamo la somma dei valori contenuti in essa
#nella prima celletta ci sarà la ricchezza del primo plot (riga), la seconda celletta sarà la ricchetta di specie del secondo plot, ecc
#vogliamo calcolare sr, ma abbiamo abbondanza di specie in questa tabella
#quindi valori più grandi dei soli 1 e 0 che ci servono --> vanno ridotti a 1 i valori maggiori di 1 (binarizzare)

#uso logica bouleana: quali valori sono maggiori di 0? Poi sommo i T per avere ricchezza di specie (in questo modo tutti i valori maggiori di 1 diventano 1 e poi vengono sommati)


sum(dune[1, ] > 0)  #sono selezionati come veri i valori maggiori di 0 --> valori di presenza della specie

for (i in 1:nrow(dune)) {
  sr[i] <- sum(dune[i, ] > 0) 
} # la ricchezza di specie di i (riga) è la somma di tutti i valori presenti in i

sr # ricchezza di specie per riga/ per sito
#creo funzione personalizzata con all'interno un ciclo per avere pronta funzione che calcola sr senza scrivere tutto ogni volta
calculate_sr <- function(df) {
  sr <- vector()
  for (i in 1:nrow(df)) {
  sr[i] <- sum(df[i, ] > 0) 
  }
  return(sr)
  
} #df è segnaposto, è dataframe generale a cui corrisponderà il dataframe di cui ci serve sr

calculate_sr(df = dune) #sostituisco a df un oggetto reale

sr_dune <- calculate_sr(df = dune) 

summary(dune) #non ci dice nulla di interessante
summary(dune.env) #più interessante
#A1: media, mediana e quartile più vicini al minimo che al massimo
#per i fattori, il summary ci dà le frequenze assolute es. per il valore 1 abbiamo 7 osservazioni
#grafico che mostra distribuzione carattere A1 = istogramma

hist(dune.env$A1)
#frequenza dei valori da 2 a 4, ecc
#e se vogliamo più o meno colonne? Aumento breaks 
hist(dune.env$A1, 
     xlab = "Thickness of soil A1 horizon (cm)",
     main = "",
     breaks = 10)
#maggior parte delle osservazioni tra 2 e 6

man_counts <- table(dune.env$Management) #tabella di contingenza: distribuzione univariata
man_counts
barplot(man_counts,
        xlab = "Management type",
        ylab = "N° of plots") 

counts <- table(dune.env$Manure,
      dune.env$Management) #tabella di contingenza/ matrice: distribuzione bivariata
# 0 Manure c'è solo nei Natural Meadows perché non ha senso azotare dei terreni che non sono produttivi; in NM le altre frequenze per livelli di Manure > 0 sono tutte a 0
# 1 Manure: Biological Farming, non azoto tanto
# 3 Manure: solo in standard Farming
barplot(counts,
        xlab = "Management type",
        ylab = "Manure quantity",
        main = "Plot distribution by Manure and Management",
        legend = rownames(counts),
        xlim = c(0, 6))
# sull'asse delle x abbiamo Management, all'interno delle colonne vediamo la distribuzione della seconda variabile

#calcoliamo le frequenze congiunte relative
prop.table(counts)

#calcoliamo le frequenze condizionate di Management, rispetto a Manure (variabile condizionante) 
prop.table(counts, margin = 1) # 1 sono le righe e 2 sono le colonne
#il 100% delle osservazioni con valore di Manure = 0 corrispondono al tipo di Management NM
# per Manure = 1, 2/3 delle osservazioni corrispondono a BF e 1/3 a HF
# ora facciamo il contrario: frequenza condizionate di Management rispetto a Manure
prop.table(counts, margin = 2)
# il 100% delle osservazioni NM corrispondono al livello 0 di Manure (come cambiamo frequenze di Manag a seconda dei livelli di Manure)

#una variabile quantitativa sull'asse x e una qualitativa sull'asse y (distribuzione variab quantitativa rispetto a delle categorie)

sr_dune
boxplot(sr_dune ~ dune.env$Use,
        xlab ="Type of Use",
        ylab = "Species richness")
#distribuzione della ricchezza di specie attraverso i tipi diversi di uso
#~ è 126 e Alt 
library(vegan)
specnumber(dune) #formula per calcolare species richness in vegan
#vedo la species richness per sito/ per riga
dune.env$sr <- specnumber(dune) #creo nuova riga per species richness
str(dune.env)


boxplot(sr ~ Use,
        data = dune.env,
        xlab ="Type of Use",
        ylab = "Species richness")

#lezione 9 
#conditionals: strumenti che permettono un controllo del flusso di dati 
#serie di domande/ bivi a cui il programma prende una strada o l'altra

#un numero è maggiore di un altro? 
x <- 100

if(x > 10) {
  print(paste(x, "is greater than 10"))
} #le istruzioni all'interno della condizione vengono eseguire

x <- 5 #non viene scritto nulla

#dicotomia
if(x > 10) {
  print(paste(x, "is greater than 10"))
} else {
print(paste(x, "is less than 10"))
} #se non viene soddisfatta la prima opzione, verrà eseguita la seconda

#se ci sono tre o più condizioni?
x <- 10

if(x > 10) {
  print(paste(x, "is greater than 10"))
} else if (x == 10) {
  print(paste(x, "is equal to 10"))
} else {
  print(paste(x, "is less than 10"))
} 

x<0
x<10
x <- 9

#per controllare se un numero intero è pari o dispari, vediamo se è divisibile per 2, o se c'è il resto di 1
#se il risultato di x diviso 2 dà il resto di 1, print T
is_odd <- function(x) {
  if(x %% 2 == 1) {
    print(T)
  } else {
    print(F)
  }
}
  
is_odd(4) 
is_odd(5)

#back to analysis
str(dune)
str(dune.env)
sr
sr_dune
sr <- specnumber(dune) #calcolare la ricchezza di specie per ogni sito (converte già le abbondanza in assenza/ presenza)
sr
dune.env$sr <- sr


boxplot(sr ~ Management,
        data = dune.env,
        xlab ="Management Type",
        ylab = "Species richness") #species richness in funzione del Management
#NM ha la ricchezza di specie minore
#SF è quello che ha variabilità maggiore, va da 5 a 13

#scatterplot con due variabili continue
# sr è dipendente da A1 (variabile indipendente)
plot(sr ~ A1,
     data = dune.env,
     xlab = "Thickness of A1 soil horizon (cm)",
     ylab ="Species richness"
    )
#maggior parte dei valori sono attorno a A1 = 4 e hanno sr = 10-13

png("outputs/sr_vs_a1.png", width = 1000, height = 1000, res = 300) #sono pixel
plot(sr ~ A1,
     data = dune.env,
     xlab = "Thickness of A1 soil horizon (cm)",
     ylab = "Species richness")
dev.off() #trial and error per i parametri

dune_env_head <- head(dune.env, 8) #di default restituisce le prime 6 righe, poi lo modifico

write.table(dune_env_head, 
            "outputs/dune_env_head.txt")

write.csv(dune_env_head,
          "outputs/dune_env_head.csv", row.names = F)#così non c'è la colonna inutile

vec <- 1:100
head(vec)
head(vec, 10)

library(vegan)
dune_pa <- decostand(dune, method = "pa") #trasformo matrice di abbondanza in matrice di assenza/presenza
str(dune)

#specie più frequenti?
specnumber(dune_pa, MARGIN = 2) #somma lungo le colonne = frequenza assoluta di ciascuna specie nel nostro dataset (sommo la presenza di una specie in tutti i siti)
#tabella che mostra la frequenza di specie a seconda dell'uso: come faccio a sapere se i differenti usi del terreno influenzano la distribuzione di specie?
#aggreghiamo le due variabili: somma delle presenze delle due specie nelle tre categorie di uso
#es. somma Scorautu per le righe Hayfield
species_by_use <- aggregate(dune_pa[c("Scorautu", "Trifrepe")],
                            by = list(dune.env$Use),
                            FUN = "sum")
#test del chi-quadrato

# dplyr per fare tabella in maniera più semplice (tidyverse)

chisq.test(species_by_use[ , -1]) #p-value 0.89 alto e non significativo; non possiamo rifiutare l'ipotesi nulla che le frequenze delle due specie siano analoghe/ uguali
#infatti sono analoghe: le frequenze sono molto simili
#p-value ci dà significatività statistica, soglia è 0.05-0.01
#se avessimo avuto un p-value significativo avremmo potuto dire che le frequenze delle due specie nei diversi tipi di uso sono tra loro indipendenti (No in realtà? quella è l'ipotesi nulla?)
#quando è al di sotto di 0.05 è statisticam significativo e si può rigettare l'ipotesi nulla --> in quel caso ci sarebbe differenza evidente nelle frequenze
#qui le frequenze sono quasi uguali, le differenze sono dovute al caso
#la loro presenza nei tre gruppi è analoga, probabilmente vivono in habitat simili
# distribuzione delle due specie nei tre gruppi è simile
# se le frequenze sono uguali, le due variabili sono indipendenti e una non influenza l'altra, maybe?

#lezione 10
















