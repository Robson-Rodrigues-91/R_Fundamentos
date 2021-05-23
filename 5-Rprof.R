# Rprof na pratica

# Iniciando a analise de performance
Rprof("dados.txt")

# Criando vetores e medindo o tempo de execução
vector1 <- c(2,43,6,3,6,34,7,3,3)
vector2 <- c(345,3,2,6,9,23,23,4,8)

# Transformando em um dataframe
df <- data.frame(vector1, vector2)

# Exibindo
df
Rprof(example(mtcars))
plot(df)

# Terminando a execução e salvando os dados no arquivo dados.txt
summaryRprof("dados.txt")

# usando uma biblioteca externa
install.packages("profr")
library(profr)
library(ggplot2)
x <- profr(example(glm))
x
ggplot(x)

