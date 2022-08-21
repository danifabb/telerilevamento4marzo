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
my_logical <- T
