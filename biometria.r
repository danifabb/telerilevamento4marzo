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

apples_vector
apples_wednesday <- apples_vector["Wednesday"] # seleziono unica giornata
apples_wednesday
apples_vector[c("Monday", "Friday")]

# in R il primo elemento ha posizione 1
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

