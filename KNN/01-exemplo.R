# KNN Nearest Neighbors
# Prevendo ocorrencia de câncer

# Instalando bibliotecas
#install.packages("class")
#install.packages("gmodels")

# Carregando biblioteca
library(class)
library(gmodels)
library(ggplot2)

# Coleta de dados
caminho = "/home/robson/Documents/scripts_r/dados/bc_data.csv"
dados <- read.csv(caminho, stringsAsFactors = FALSE)
head(dados)
str(dados)

# Entendendo os dados
# Removendo a coluna ID do csv
dados <- dados[-1]
str(dados)

# Verificando se possui valores nulos
any(is.na(dados))

# Transformando uma variavel no tipo fator
table(dados$diagnosis)
dados$diagnosis <- factor(dados$diagnosis, 
                          levels = c("B","M"), 
                          labels = c("Benigno","Maligno"))
str(dados$diagnosis)

# Verificando a proporção
round(prop.table(table(dados$diagnosis)) * 100, digits = 1)

# Medidas de tendencia central
# normalizando dados com diferentes formas
summary(dados[c("radius_mean", "area_mean", "smoothness_mean")])

# Funcão de normalização
normalizacao <- function(x){
  return((x - min(x)) / (max(x) - min(x)))
}

# Normalização dos dados
dados_norm <- as.data.frame(lapply(dados[2:31],normalizacao))

# Comparando normalização 
summary(dados[c("radius_mean", "area_mean", "smoothness_mean")])
summary(dados_norm[c("radius_mean", "area_mean", "smoothness_mean")])

# Com os dados já aleatorios, vamos criar os dados de treino e teste
dados_treino <- dados_norm[1:469,]
dados_teste <- dados_norm[470:569,]

dados_treino_labels <- dados[1:469,1]
dados_teste_labels <- dados[470:569,1]

# Criando o modelo com KNN
modelo <- knn(train = dados_treino,
              test = dados_teste,
              cl = dados_treino_labels,
              k = 21)

# funcao knn(), retorna um objeto do tipo fator
class(modelo)

# Criando uma tabela com dados previstos e dados atuais
CrossTable(x = dados_teste_labels, y = modelo, prop.chisq = FALSE)

# Calculando taxa de erro
prev = NULL
taxa_erro = NULL

for(i in 1:20){
  prev = knn(train = dados_treino,
             test = dados_teste,
             cl = dados_treino_labels,
             k = i)
  taxa_erro[i] = mean(dados$diagnosis != prev) 
}

# Adicionando valores de k e taxa_erro
k.values <- 1:20
df_erro <- data.frame(taxa_erro, k.values)
df_erro

# Visualizando gráfico com a taxa de erro baseado no k
ggplot(df_erro, aes(x = k.values, y = taxa_erro)) + geom_point() + geom_line()



