# Manipulando data tables

install.packages("data.table")
library(data.table)

?data.table

cores <- c('verde', 'azul', 'amarelo', 'vermelho')
numeros <- c(2,4,63,3)

dt <- data.table(cores,numeros)

dt

# Criando slicing do data table
vec1 <- c(A = 1:9, B = c("W", "G", "E"), C = rnorm(9), D = TRUE)
dt2 <- data.table(A = 1:9, B = c("W", "G", "E"), C = rnorm(9), D = TRUE)
dt2
dt2[3:5,]
dt2[,.(B,D)]

#aplicando funcoes
# Soma e media
dt2[,.(Total = sum(A), Media_C = median(C))]

# Criando um grafico
dt2[,plot(A,C)]

# Terceiro datatable

dt3 <- data.table(B = c("a","b","c","d","e","a","b","c","d","e"),
                  val = c(6:10, 1:5))
dt3

dt4 <- as.data.table(iris)
dt4
dt4[, .(Sepal.Length = median(Sepal.Length),
        Sepal.Width = median(Sepal.Width),
        Petal.Length = median(Petal.Length),
        Petal.Width = median(Petal.Width)), by = Species]

# Usando o lapply para facilitar 
dt5 <- as.data.table(iris)
dt5[, lapply(.SD, median), by = Species]
