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

