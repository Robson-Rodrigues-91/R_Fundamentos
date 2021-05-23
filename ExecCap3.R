# Exercicios Capitulo 3

# Exercicio 1 - Crie uma funcao que receba e vetores como parametro, converta-os em um dataframe e imprima
vec1 <- c(3,2,4,32,5,32,5,3,4)
vec2 <- c(2,43,4,6,3,6,56,3,4)

dataframe <- function(x, y){
  df <- data.frame(cbind(x,y))
  print(df)
}

dataframe(vec1,vec2)
#-----------------------------------------------------------------------

# Exercicio 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida
#com numeros inteiros e calcule a media de cada linha
# apply(dados, margem, funcao)
# margem = 1 -> media por linhas
# margem = 2 -> media por colunas

mat <- matrix(c(1:16), nrow = 4, ncol = 4)
mat
mean_by_row <- apply(mat,1,mean)
print(mean_by_row)

#-----------------------------------------------------------------------

# Exercicio 3 - Considere o dataframe abaixo. Calcule a media por disciplina
escola <- data.frame(Aluno = c('Alan', 'Alice', 'Alana', 'Aline', 'Alex', 'Ajay'),
                     Matematica = c(90, 80, 85, 87, 56, 79),
                     Geografia = c(100, 78, 86, 90, 98, 67),
                     Quimica = c(76, 56, 89, 90, 100, 87))
escola
# Criando um novo dataframe apenas com as ultimas 3 colunas
new_df <- data.frame(escola[,c(2:4)])
apply(new_df, 1, mean)

result <- apply(escola[,c(2,3,4)], 2, mean)
print(result)
#-----------------------------------------------------------------------

# Exercicio 4 - Cria uma lista com 3 elementos, todos numéricos
# e calcule a soma de todos os elementos da lista

lista <- list(a = (1:50), b = (1:5), c = (1:10))
lista
do.call(sum,lista)
?do.call

#-----------------------------------------------------------------------

# Exercicio 5 - Transforme a lista anterior um vetor
vector <- unlist(lista)
print(vector)
#-----------------------------------------------------------------------
# Exercicio 6 - Considere a string abaixo. Substitua a palavra textos por frases
str <- c("Expressoes", "regulares", "em linguagem R", 
         "permitem a busca de padroes", "e exploracao de textos",
         "podemos buscar padroes em digitos",
         "como por exemplo",
         "10992451280")
gsub("textos","frases", str)

#-----------------------------------------------------------------------

# Exercicio 7 - Usando o dataset mtcars, crie um grafico com ggplot do
# tipo scatter plot. Use as colunas disp e mpg nos eixos x e y respectivamente.

library(ggplot2)
ggplot(mtcars, aes(x = disp, y = mpg)) + geom_point()


#-----------------------------------------------------------------------

# Exercicio 8 - Usando o exemplo anterior, explore outros tipos de gráficos

library(ggplot2)
head(mtcars)
ggplot(mtcars, aes(x = disp, fill = as.factor(cyl))) + geom_histogram()
#-----------------------------------------------------------------------
