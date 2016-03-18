###-----------------------------------------------###
###----------------- Curso R ---------------------###
###----------------- Clase 2----------------------###
###-----------------------------------------------###

## Estructuras de Datos
# R no tiene estructuras 0d (tipo escalar), el objeto básico son los vectores 
# El texto luego de # es un comentario (no es interpretado por R)
# Para crear un objeto se utiliza el operador de asignación  <- 

x <- 5
x

y <- "SSL"
y

## Vectores
## 1. Vectores atómicos, nombro como vec a mi vector, el nombre de un vector puede ser cualquiera
## R distingue nombres de vectores con mayúsculas o minúsculas como diferentes

vec <- c(1, 2)
vec

## Elementos de un vector atómico
# La i-ésima componente de un vector se obtiene mediante vec[i]

vec <- c(6, 1, 3, 6, 10, 5)
vec
vec[5]

# Elementos de la posición 2, 4, 6 de un vector
vec[c(2, 4, 6)]

# Eliminamos elementos del vector antecediendo el signo -

vec[-c(2)]
vec[-c(1, 6)]

# TRUE, FALSE también permiten obtener ciertos elementos:
vec <- c(6, 1, 3, 6, 10, 5)
vec
# elementos de la posición 2, 4, 6
vec[c(FALSE, TRUE, FALSE, TRUE, FALSE, TRUE)]

#################  Tipos de vectores atómicos ################# 

# Vector double (números reales: ....,-3,-2,-1,0,1,2,3,4,...; decimales también)
dbl_vec <- c(1, 2, -1, 8, 15)
dbl_vec

## Vector entero
# sufijo L para vector entero; es decir, datos que no contienen números decimales
int_vec <- c(3L, 7L, 1L, 14L, 21L) 
int_vec

## Vector lógico: son usados para tomar desiciones 
# TRUE y FALSE (T, F) para vector lógico
log_vec <- c(FALSE, TRUE, F, T, TRUE, F) 
log_vec
## Vector caracter
chr_vec <- c("Source", "Stat", "Lab", "Ec")
chr_vec

######################### Tipos y Tests #########################

# Para hacer una prueba al vector de datos sobre el tipo de elementos del que consta, si son del tipo
# entero, double, lógico o caracter

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


############## Función is.numeric(). #################

# Retorna TRUE para vectores double e integer; es decir, retorna TRUE O FALSE para decirnos si el vector
# de datos esta compuesto o no por datso numéricos

dbl_vec <- c(1, 2, -1.2)
dbl_vec
is.numeric(dbl_vec)

int_vec <- c(3L, 7L, 1L)
int_vec
is.numeric(int_vec)

#################  Coerción  ###################
# Cuando los elementos de un vector de datos son de diferente tipo, algunos numéricos, algunos caracteres 
# o algnos lógicos, entonces la COERCIÓN  homogeniza al vector de datos, coerciona los datos al tipo 
# de dato más flexible dado por la siguiente jerarquía

# character <= double <= integer <= logical

# al tener una base de datos con el mismo tipo de datos, podemos manipularla de mejor forma

vec <- c("ssl", 12,13.6,-90, TRUE, FALSE)
vec
typeof(vec)

vec1 <- c(0.5, 2, TRUE, FALSE)
vec1
typeof(vec1)

# Las funciones aritméticas, operaciones matemáticas en general  +, abs, log, etc coercionan a double o integer.

# Coerción de funciones

vec <- c(3, 0.5, -6)
vec1 <- (vec)^2
vec1
typeof(vec1)

#COERCION DE LAS OPERACIONES +, -, *, /
vec1 <- c(1L, 3L, -6L) #números enteros
vec2 <- c(2L, -5L, 9L)
vec3 <- vec1 + vec2
vec3
typeof(vec3)

# Las funciones &, |, any, all, etc coercionan a logical.


vec <- c(TRUE, FALSE, FALSE, TRUE) #DECISIÓN
(vec1 <- all(vec)) # ALL. RETORNA TRUE si todos sus elementos son TRUE
typeof(vec1)

#OPERACIONES ENTRE VECTORES LÓGICOS
vec1 <- c(FALSE, TRUE, TRUE, FALSE)
vec2 <- c(TRUE, TRUE, FALSE, FALSE)
(vec3 <- vec1 | vec2) # | "O" EJEMPLO: CLIENTE PAGO ENERO | FEBRERO
typeof(vec3)

## Coerción - Funciones "as"
# Para coercionar un vector a un determinado tipo, se utilizan las funciones "as"

# coerción directa: double a character
vec <- c(1.7, 5, 8.2, 15.1)
typeof(vec) #double
vec1 <- as.character(vec)
vec1
typeof(vec1)# si los datos estan como caracter (letras y palabras) y quiero que sean numeros, uso la sentencia as.double(vector)
vec1 <- as.character(vec)
vec2<-as.double(vec1)
typeof(vec2)
vec2


# coerción directa: logical a character
vec <- c(FALSE, TRUE, FALSE, TRUE, TRUE)# si quiero convertir datos logicos en caracteres  
vec1 <- as.character(vec)
vec1 #vector tipo caracter o palabras

# coerción directa: logical a double
vec <- c(FALSE, TRUE, FALSE, TRUE, TRUE,F,T,T,T,T,T,T,T,T,F,F,F,F,F,F,F,F,F,F) 
vec1 <- as.double(vec)
vec1
typeof(vec1)
# TRUE -> 1
# FALSE -> 0

###########################################################

sum(vec) ######## sum de un vector logico nos da número total de TRUEs 
length(vec) ###### el total de datos en vec
mean(vec) ###### proporción (porcentaje) de TRUEs, el 46% de personas son mujeres o empleadas, o lo que signifique TRUE

###########################################################

# coerción indirecta: character a double
vec <- c("15", "Sin Información", "25", "-")# vector de datos contaminado
vec1 <- as.double(vec) ########comprobar si los datos son numeros y si nos dice que hay NAs entonces hay datos basura, o datos atipicos 
vec1
#NAs introducidos por coercion

# coerción indirecta: character a logical
vec <- c("FALSE", "TRUE", "Sin Info", "-", "TRUE") 
vec1 <- as.logical(vec) #comprobando que los datos sean logicos o de una decisión
vec1
#NAs introducidos por coercion en un logical, es mejor quitarlos del vector de datos

# coerción indirecta: double a logical
vec <- c(1, 0, 17, 3.5, 0,-2) #no es contaminado. tiene otra codificacion
vec1 <- as.logical(vec)#comprobar que sean vectores logicos
vec1

vacaciones<-sum(vec1)
vacaciones
length(vacaciones)
vec1[2]
# == 0 -> FALSE
# != 0 $ ->  TRUE


## Vectores anidados
# Los vectores atómicos pueden ser anidados
datos_generales<-nombres("Jose", edad(20, direccion("Ecuador","Quito","La Vicentina"))) #vectores de informacion dentro de otros, que los puedo juntar
datos_generales
c(1, 2, 3, 4)

ventas1<-producto("colchones",cantidad(34,venderor("Maria")))
ventas1








###########################  2. Listas  #################################
# Una lista puede contener elementos de cualquier tipo y de distinta longitud. 
lst <- list(c(19, 22,18,30), c(TRUE,FALSE, FALSE), c("Maria", "Juan", "Carlos"))
lst

lista<-list(c(T,T,T,T,F,F,F,F),nombres("MARISOL","LEONARDO"),paises("ALEMANIA","FRANCIA","ECUADOR"),sueldos(5600,780,960))
lista
lst <- list(1:10, c("Azuay", "Quito", "Loja", "Ambato"), c(TRUE, FALSE,TRUE), c(1.3, 4.5,9.9))

typeof(lst)


is.atomic(lst)
# probamos si lst es una lista
is.list(lst)# pregunta de si la base recibida es una lista

## Coerción
# coerción del vector lst a una lista
lst <- c("cheques", 4, 0.5,5,6.8)
as.list(lst)


encabezado<-c("nombres","direccion","numero de cuenta")
as.list(encabezado) #etiquetas
# coerción de lista a vector (reglas de coerción)
datos <- list(1:10, c("Azuay", "Quito", "Loja", "Ambato"), c(TRUE, FALSE,TRUE), c(1.3, 4.5,9.9))
datos
unlist(datos)####### tranforma los datos de la lista a un solo tipo de dato



###################################################


## Elementos de una lista
# Para acceder al elemento, a la columna i de la lista se utiliza x[i] (columna).
# Para acceder al objeto que contiene el elemento i se utiliza x[[i]] (fila que corresponde a i).
productos <- list(cantidad=c(1, 2,8,7), elegancia=c(TRUE,FALSE,FALSE,TRUE), producto=c("ABRIGOS", "bufandas", "guantes"))
#ASIGANCION DE ETIQUETAS A LAS COLUMNAS
productos
productos["elegancia"]
productos["cantidad"]

datos_economicos <- list(1:9, c("Susana", "Stefany", "Laura"), c(TRUE, FALSE), patrimonio=c(1300, 4500,6700))
datos_economicos[4] #ACCESO A LOS ELEMENTOS Y COLUMNAS DE LA LISTA
datos_economicos["patrimonio"]
datos_economicos$"patrimonio" #acceder a una columna de la lista

## Listas vs vectores atómicos
# Una lista es un vector recursivo
lista_recursiva <- list(list(c(1,-5), c("a", "b")), list("Source", "Stat"))
lista_recursiva
str(lista_recursiva) ######## 
View(lista_recursiva)
# Un vector no puede contener otro vector:
c(1, c(2, c(3,4)))  ;  c(1, 2, 3, 4) # cuando separamos vectores con ";" se crean dos columnas

















## Atributos
# Vector atÃ³mico:
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
# Una matriz es un vector con el atributo dim (dimensiÃ³n).
# El atributo dim es un vector de longitud 2: c(nrow, ncol).
mtx <- matrix (1:12,nrow=3, ncol=4, byrow=FALSE)
# se construye por columnas por default (byrow=FALSE)
mtx
attributes(mtx)

# dim() se usa para aÃ±adir el atributo dim a un vector o
mtx <- 1:12
mtx
dim(mtx) <- c(3,4)
mtx

# para hallar la dimensiÃ³n de una matriz.
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
# Es la estructura de datos utilizada para almacenar variables categÃ³ricas.
# CreaciÃ³n de un factor si se dispone de un vector integer
vec <- c(1, 2, 2, 1, 2, 1, 2)
vec
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
fac

# CreaciÃ³n de un factor si se dispone de un vector character
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
# eliminaciÃ³n del atributo class
unclass(fac)

# Para realizar conteos por categorÃ?a, se utiliza la funciÃ³n table().
vec <- c(1, 2, 2, 1, 2, 1, 2)
fac <- factor(vec, levels=c(1,2), labels = c("Femenino", "Masculino"))
# frecuencias
table(fac)
# porcentaje
prop.table(table(fac))

## Data Frame
# Es una lista en la cual todos los elementos tienen la misma longitud.
# A diferencia de las matrices, pueden almacenar vectores atÃ³micos de cualquier tipo.
# Presenta varios atributos adicionales class, rownames, names.
# Es la estructura de datos mÃ¡s utilizada para almacenar data tabulada.

dbl_vec <- c(1, 2, 3)
dbl_vec
chr_vec <- c("R", "S", "T")
chr_vec
log_vec <- c(TRUE, FALSE, TRUE)
log_vec

# CreaciÃ³n de un data frame
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
# DimensiÃ³n
dim(df)
# NÃºmero de columnas
nrow(df)
# NÃºmero de filas
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
str(mtcars) ### RESUMEN
# visualizar data frame
View(mtcars)
# Visualizar las n primeras filas
head(mtcars, n = 2)
# Visualizar las n Ãºltimas filas
tail(mtcars, n = 2)


# Atributos de un data frame
attributes(mtcars)
# Nombres de columnas
names(mtcars) # colnames(mtcars)
# Clase
class(mtcars)
# Nombres de filas
rownames(mtcars)
# DimensiÃ³n
dim(mtcars)
# NÃºmero columnas
nrow(mtcars)
# NÃºmero filas
ncol(mtcars)


## FunciÃ³n structure
# La funciÃ³n str() (structure) presenta una descripciÃ³n compacta de la estructura de datos. 
str(mtcars)

## Missing Values
# NA: Not Available. Dato pÃ©rdido.
# NaN: Not a Number. Resultado de una indeterminaciÃ³n 0/0, Inf/Inf, Inf*0.
x <- c(Inf*0, 3.2, NA, 5, NA)
x

y <- c(-1, 0/0, NA, 5, -6)
y

## Missing Values
# is.na(x) retorna TRUE para elementos NA de un vector atÃ³mico o lista.
x <- c(Inf*0, 3.2, NA, 5, NA)
is.na(x)

# is.nan(x) retorna TRUE para elementos NaN de un vector atÃ³mico.
y <- c(-1, 0/0, NA, 5, Inf*0)
is.nan(y)