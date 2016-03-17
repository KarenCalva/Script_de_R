###-----------------------------------------------###
###----------------- Curso R ---------------------###
###----------------- Clase 2----------------------###
###-----------------------------------------------###

## Estructuras de Datos
# R no tiene estructuras 0d (tipo escalar), el objeto b醩ico son los vectores 
# El texto luego de # es un comentario (no es interpretado por R)
# Para crear un objeto se utiliza el operador de asignaci髇  <- 

x <- 5
x

y <- "SSL"
y

## Vectores
## 1. Vectores at髆icos, nombro como vec a mi vector, el nombre de un vector puede ser cualquiera
## R distingue nombres de vectores con may鷖culas o min鷖culas como diferentes

vec <- c(1, 2)
vec

## Elementos de un vector at髆ico
# La i-閟ima componente de un vector se obtiene mediante vec[i]

vec <- c(6, 1, 3, 6, 10, 5)
vec
vec[5]

# Elementos de la posici髇 2, 4, 6 de un vector
vec[c(2, 4, 6)]

# Eliminamos elementos del vector antecediendo el signo -

vec[-c(2)]
vec[-c(1, 6)]

# TRUE, FALSE tambi閚 permiten obtener ciertos elementos:
vec <- c(6, 1, 3, 6, 10, 5)
vec
# elementos de la posici髇 2, 4, 6
vec[c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)]

#################  Tipos de vectores at髆icos ################# 

# Vector double (n鷐eros reales: ....,-3,-2,-1,0,1,2,3,4,...; decimales tambi閚)
dbl_vec <- c(1, 2, -1, 8, 15)
dbl_vec

## Vector entero
# sufijo L para vector entero; es decir, datos que no contienen n鷐eros decimales
int_vec <- c(3L, 7L, 1L, 14L, 21L) 
int_vec

## Vector l骻ico: son usados para tomar desiciones 
# TRUE y FALSE (T, F) para vector l骻ico
log_vec <- c(FALSE, TRUE, F, T, TRUE, F) 
log_vec
## Vector caracter
chr_vec <- c("Source", "Stat", "Lab", "Ec")
chr_vec

######################### Tipos y Tests #########################

# Para hacer una prueba al vector de datos sobre el tipo de elementos del que consta, si son del tipo
# entero, double, l骻ico o caracter

# Ejemplo de un vector double

dbl_vec <- c(1, 2, -1)
dbl_vec

typeof(dbl_vec)
is.double(dbl_vec)
is.atomic(dbl_vec)

# Ejemplo de un vector integer
int_vec <- c(3L, 7L, 1L)
int_vec
typeof(int_vec)
is.integer(int_vec)
is.atomic(int_vec)


############## Funci髇 is.numeric(). #################

# Retorna TRUE para vectores double e integer; es decir, retorna TRUE O FALSE para decirnos si el vector
# de datos esta compuesto o no por datso num閞icos
        
dbl_vec <- c(1, 2, -1.2)
dbl_vec
is.numeric(dbl_vec)

int_vec <- c(3L, 7L, 1L)
int_vec
is.numeric(int_vec)

#################  Coerci髇  ###################
# Cuando los elementos de un vector de datos son de diferente tipo, algunos num閞icos, algunos caracteres 
# o algnos l骻icos, entonces la COERCI覰  homogeniza al vector de datos, coerciona los datos al tipo 
# de dato m醩 flexible dado por la siguiente jerarqu韆

# character <= double <= integer <= logical

# al tener una base de datos con el mismo tipo de datos, podemos manipularla de mejor forma

vec <- c("ssl", 12,13.6,-90, TRUE, FALSE)
vec
typeof(vec)

vec1 <- c(0.5, 2, TRUE, FALSE)
vec1
typeof(vec1)

# Las funciones aritm閠icas, operaciones matem醫icas en general  +, abs, log, etc coercionan a double o integer.

# Coerci髇 de funciones

vec <- c(3, 0.5, -6)
vec1 <- (vec)^2
vec1
typeof(vec1)


vec1 <- c(1L, 3L, -6L) #n鷐eros enteros
vec2 <- c(2L, -5L, 9L)
vec3 <- vec1 + vec2
vec3
typeof(vec3)

# Las funciones &, |, any, all, etc coercionan a logical.


vec <- c(TRUE, FALSE, FALSE, TRUE)
(vec1 <- all(vec)) # TRUE si todos sus elementos son TRUE
typeof(vec1)


vec1 <- c(FALSE, TRUE, TRUE, FALSE)
vec2 <- c(TRUE, TRUE, FALSE, FALSE)
(vec3 <- vec1 | vec2)
typeof(vec3)

## Coerci髇 - Funciones "as"
# Para coercionar un vector a un determinado tipo, se utilizan las funciones "as"

# coerci髇 directa: double a character
vec <- c(1.7, 5, 8.2, 15.1)
vec1 <- as.character(vec)
vec1
typeof(vec1)

# coerci髇 directa: logical a character
vec <- c(FALSE, TRUE, FALSE, TRUE, TRUE) 
vec1 <- as.character(vec)
vec1

# coerci髇 directa: logical a double
vec <- c(FALSE, TRUE, FALSE, TRUE, TRUE) 
vec1 <- as.double(vec)
vec1
# TRUE -> 1
# FALSE -> 0

sum(vec) # n鷐ero total de TRUEs 
mean(vec) # proporci髇 de TRUEs


# coerci髇 indirecta: character a double
vec <- c("15", "Sin Informaci髇", "25", "-")
vec1 <- as.double(vec)
vec1
#NAs introducidos por coercion

# coerci髇 indirecta: character a logical
vec <- c("FALSE", "TRUE", "Sin Info", "-", "TRUE") 
vec1 <- as.logical(vec)
vec1
#NAs introducidos por coercion

# coerci髇 indirecta: double a logical
vec <- c(1, 0, 17, 3.5, 0)
vec1 <- as.logical(vec)
vec1
# == 0 -> FALSE
# != 0 $ ->  TRUE


## Vectores anidados
# Los vectores at髆icos pueden ser anidados
c(1, c(2, c(3,4)))

c(1, 2, 3, 4)


###########################  2. Listas  #################################
# Una lista puede contener elementos de cualquier tipo y de distinta longitud. 
lst <- list(c(19, 22,18,30), c(TRUE,FALSE, FALSE), c("Maria", "Juan", "Carlos"))
lst

lst <- list(1:10, c("Azuay", "Quito", "Loja", "Ambato"), c(TRUE, FALSE,TRUE), c(1.3, 4.5,9.9))
typeof(lst)
is.atomic(lst)
# probamos si lst es una lista
is.list(lst)

## Coerci髇
# coerci髇 del vector lst a una lista
lst <- c("cheques", 4, 0.5,5,6.8)
as.list(lst)

# coerci髇 de lista a vector (reglas de coerci髇)
lst <- list(1:10, c("Azuay", "Quito", "Loja", "Ambato"), c(TRUE, FALSE,TRUE), c(1.3, 4.5,9.9))
unlist(lst)

## Elementos de una lista
# Para acceder al elemento i de la lista se utiliza x[i].
# Para acceder al objeto que contiene el elemento i se utiliza x[[i]].
lst <- list(c(1, 2,8,7), c(TRUE,FALSE,FALSE,TRUE), c("ABRIGOS", "bufandas", "guantes"))
lst
lst[1]
lst[[1]]

lst <- list(1:9, c("Susana", "Stefany", "Laura"), c(TRUE, FALSE), patrimonio=c(1300, 4500,6700))
lst[4]
lst[[4]]
lst$nomb_obj

## Listas vs vectores at髆icos
# Una lista es un vector recursivo
lst <- list(list(c(1,-5), c("a", "b")), list("Source", "Stat"))
str(lst)

# Un vector no puede contener otro vector:
c(1, c(2, c(3,4)))  ;  c(1, 2, 3, 4)


## Atributos
# Vector at贸mico:
# Vector sin el atributo names
vec <- c(3, 6, -1, 0.5)
attributes(vec)

# Vector con el atributo names
vec <- c(a=3, b=6, c=-1, d=0.5)
attributes(vec)


# Lista:
# Lista sin el atributo names
lst <- list(1:3, c("Source", "Stat", "Lab"), c(TRUE, FALSE))
attributes(lst)

# Lista con el atributo names
lst <- list(nomb_obj1=1:3, nomb_obj2=c("Source", "Stat", "Lab"), nomb_obj3=c(TRUE,FALSE))
attributes(lst)


## Funcion is.vector()
# is.vector(x) retorna TRUE si x es un vector con un solo atributo (names).

# Vector con el atributo names
vec <- c(a=3, b=6, c=-1, d=0.5)
is.vector(vec)

# Lista con el atributo names
lst <- list(nomb_obj1=1:3, nomb_obj2=c("Source", "Stat", "Lab"), nomb_obj3=c(TRUE,FALSE))
is.vector(lst)


## Matrices
# Una matriz es un vector con el atributo dim (dimensi贸n).
# El atributo dim es un vector de longitud 2: c(nrow, ncol).
mtx <- matrix (1:12,nrow=3, ncol=4, byrow=FALSE)
# se construye por columnas por default (byrow=FALSE)
mtx
attributes(mtx)

# dim() se usa para a帽adir el atributo dim a un vector o
mtx <- 1:12
mtx
dim(mtx) <- c(3,4)
mtx

# para hallar la dimensi贸n de una matriz.
mtx <- matrix (1:12, nrow=3, ncol=4, byrow=FALSE)
dim(mtx)

## Elementos de una matriz
(mtx <- matrix (1:12, nrow=3, ncol=4, byrow=FALSE))
mtx[1,2] # componente 1, 2 
mtx[,3]  # columna 3
mtx[1,]  # fila 1

(mtx <- matrix (1:12, nrow=3, ncol=4, byrow=FALSE))
mtx[,c(2,4)] # columnas 2 y 4
mtx[c(1,3),]  # filas 1 y 3

(mtx <- matrix (1:12, nrow=3, ncol=4, byrow=FALSE))
mtx[,c(FALSE, TRUE, TRUE, FALSE)] # columnas 2 y 4
mtx[c(TRUE, FALSE, TRUE),]  # filas 1 y 3


## Factores
# Es la estructura de datos utilizada para almacenar variables categ贸ricas.
# Creaci贸n de un factor si se dispone de un vector integer
vec <- c(1, 2, 2, 1, 2, 1, 2)
vec
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
fac

# Creaci贸n de un factor si se dispone de un vector character
vec <- c("Femenino","Masculino","Masculino","Femenino","Masculino",
         "Femenino","Masculino")
vec

fac <- factor(vec, levels= c("Femenino", "Masculino"), labels=c("FEM", "MASC"))
fac
# por defecto labels = levels, si no se setea el valor labels= se toma el valor por default
fac <- factor(vec, levels= c("Femenino", "Masculino"))
fac

# Para obtener los atributos de un factor utilizamos attributes().
vec <- c(1, 2, 2, 1, 2, 1, 2)
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
attributes(fac)

# Para considerar el vector entero utilizamos unclass().
# eliminaci贸n del atributo class
unclass(fac)

# Para realizar conteos por categor铆a, se utiliza la funci贸n table().
vec <- c(1, 2, 2, 1, 2, 1, 2)
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
# frecuencias
table(fac)
# porcentaje
prop.table(table(fac))

## Data Frame
# Es una lista en la cual todos los elementos tienen la misma longitud.
# A diferencia de las matrices, pueden almacenar vectores at贸micos de cualquier tipo.
# Presenta varios atributos adicionales class, rownames, names.
# Es la estructura de datos m谩s utilizada para almacenar data tabulada.

dbl_vec <- c(1, 2, 3)
dbl_vec
chr_vec <- c("R", "S", "T")
chr_vec
log_vec <- c(TRUE, FALSE, TRUE)
log_vec

# Creaci贸n de un data frame
df <- data.frame(dbl_vec, chr_vec, log_vec)
df
# Tipo de un data frame
typeof(df)

# Atributos de un data frame
attributes(df)
# Nombres de columnas
names(df) # colnames(df)
# Clase de un data frame
class(df)
# Nombres de filas
rownames(df)
# Dimensi贸n
dim(df)
# N煤mero de columnas
nrow(df)
# N煤mero de filas
ncol(df)

## Elementos de un data frame
nomb <- c("John", "Paul", "George", "Ringo")
nac <- c(1940, 1941, 1943, 1940)
instr <- c("guitar", "bass", "guitar", "drums")

df <- data.frame(nomb, nac, instr)
print(df)
df[2, c(2,3)]
df[2, 2] # componente 2, 2
df[3,] # fila 3
df[,2] # columna 2
df[,"nac"] # columna 2
df[c(1, 2),] # filas 1, 2
df[,c(1, 2)] # columnas 1, 2
df[,c("nomb", "nac")] # columnas 1, 2
df[,c(TRUE, FALSE, TRUE)] # columnas 1, 3
df[c(TRUE, TRUE, FALSE, TRUE),] # filass 1, 2, 4

## R Data Frame
# data frame: mtcars.
# Se carga la data mtcars
data(mtcars)
# visualizar data frame
View(mtcars)
# Visualizar las n primeras filas
head(mtcars, n = 2)
# Visualizar las n 煤ltimas filas
tail(mtcars, n = 2)


# Atributos de un data frame
attributes(mtcars)
# Nombres de columnas
names(mtcars) # colnames(mtcars)
# Clase
class(mtcars)
# Nombres de filas
rownames(mtcars)
# Dimensi贸n
dim(mtcars)
# N煤mero columnas
nrow(mtcars)
# N煤mero filas
ncol(mtcars)


## Funci贸n structure
# La funci贸n str() (structure) presenta una descripci贸n compacta de la estructura de datos. 
str(mtcars)

## Missing Values
# NA: Not Available. Dato p茅rdido.
# NaN: Not a Number. Resultado de una indeterminaci贸n 0/0, Inf/Inf, Inf*0.
x <- c(Inf*0, 3.2, NA, 5, NA)
x

y <- c(-1, 0/0, NA, 5, -6)
y

## Missing Values
# is.na(x) retorna TRUE para elementos NA de un vector at贸mico o lista.
x <- c(Inf*0, 3.2, NA, 5, NA)
is.na(x)

# is.nan(x) retorna TRUE para elementos NaN de un vector at贸mico.
y <- c(-1, 0/0, NA, 5, Inf*0)
is.nan(y)