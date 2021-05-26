# KNN 
# Instalando Pacotes necessários
install.packages("class")
install.packages("gmodels")
install.packages("caTools")
install.packages("ggplot2")

# Usando as bibliotecas no script abaixo.
library(class)
library(gmodels)
library(caTools)
library(ggplot2)

#  1- Coletando Dados
caminho = '/home/robson/Documents/dados/bc_data.csv'
dados <- read.csv(caminho, stringsAsFactors = FALSE)

# 2 - Explorando dados
# Removendo a coluna ID
dados <- dados[-1]

# Verificando aa estrutura dos dados.
str(dados)
head(dados)

# Verificando se existe dados nulos.
any(is.na(dados))

# Verificando a quandidade de dados na coluna.
table(dados$diagnosis)

# Definindo os valores como fator e substituindo siglas por palavras.
dados$diagnosis <- factor(dados$diagnosis,
                          levels = c("B","M"),
                          labels = c("Benigno","Maligno"))

# Verificando colunas que precisam ser padronizadas. 
summary(dados[c("radius_mean", "texture_mean", "perimeter_mean", "area_mean", 
                "area_se", "radius_worst","texture_worst","perimeter_worst","area_worst")])

# Function para normalizar os dados. 
normalize <- function(x){
  return ((x - min(x)) / (max(x) - min(x)))
}

# Aplicando a funcao de normalização de dados usando lapply
new_dados <- as.data.frame(lapply(dados[2:31], normalize))
head(new_dados)

# 3 - Treinando dados 

# Como os dados já estão aleatórios vamos separa 70/30.
dados_treino <- new_dados[1:469,]
dados_teste <- new_dados[470:569,]

# Criando labels com os dados originais todas as linhas e apenas 1 coluna.
# Para avaliar o nivel da variavel categorica que criamos como fator.
# Será usada dentro do knn para mapear os dados dentro do dataset de treino.
dados_label_treino <- dados[1:469, 1]
dados_label_teste <- dados[470:569, 1]

# Treinando os dados adicionando o resultado em um objeto.
modelo_1 <- knn(train = dados_treino, test = dados_teste, cl = dados_label_treino, k = 5)
modelo_2 <- knn(train = dados_treino, test = dados_teste, cl = dados_label_treino, k = 10)
modelo_3 <- knn(train = dados_treino, test = dados_teste, cl = dados_label_treino, k = 15)
modelo_4 <- knn(train = dados_treino, test = dados_teste, cl = dados_label_treino, k = 20)

# knn retorna um objeto fator.
class(modelo_1)

# 4 - Interpretando os dados de saída.

# Criando uma tabela cruzada para analise de dados.
CrossTable(x = dados_label_teste, y = modelo_1, prop.chisq = FALSE)
CrossTable(x = dados_label_teste, y = modelo_2, prop.chisq = FALSE)
CrossTable(x = dados_label_teste, y = modelo_3, prop.chisq = FALSE)
CrossTable(x = dados_label_teste, y = modelo_4, prop.chisq = FALSE)

# Utilizando o metodo Scale()
?scale()

# Padronizando o Score do dataframe
dados_scale <- as.data.frame(scale(dados[-1]))

# Separando dados de treino e teste
dados_treino_scala <- new_dados[1:469,]
dados_teste_scala <- new_dados[470:569,]

dados_treino_label <- dados[1:469, 1]
dados_teste_label <- dados[470: 569, 1]

# TReinando os dados usando o KNN.
modelo_5 <- knn(train = dados_treino_scala,
                test = dados_teste_scala,
                cl = dados_treino_label,
                k = 21)

CrossTable(x = dados_teste_label, y = modelo_5, prop.chisq = FALSE)

# Calculando a taxa de erro
prev = NULL
taxa_erro = NULL

for(i in 1:20){
  prev = knn(train = dados_treino_scala, test = dados_teste_scala, cl = dados_treino_label, k = i)
  taxa_erro[i] = mean(dados$diagnosis != prev) 
}

k.values <- 1:20
df_erro <- data.frame(taxa_erro, k.values)
df_erro

ggplot(df_erro, aes(x = k.values, y = taxa_erro)) +
  geom_point() + 
  geom_line(lty = "dotted", color = 'red')


# Explicando Resultados.
# Primeira coluna, é o label de teste
# Segunda e Terceira coluna, Benigno e Maligno) do modelo, mostram os resultados do KNN.

# 1 - Célula Benigno (label) x Benigno (Modelo) - 61 casos - true negative 
# 2 - Célula Benigno (label) x Maligno (Modelo) - 00 casos - false positive 
# 3 - Célula Maligno (label) x Benigno (Modelo) - 02 casos - false negative (o modelo errou)
# 4 - Célula Maligno (label) x Maligno (Modelo) - 37 casos - true positive 

# Lendo a Confusion Matrix (Perspectva de ter ou não a doença):

# True Negative
# * Nosso modelo previu que a pessoa NÃO tinha a doença e os dados mostraram que
#   realmente a pessoa NÃO tinha a doença.

# False Positive
# * Nosso modelo previu que a pessoa tinha a doença e os dados mostraram 
#   que NÃO, a pessoa tinha a doença.

# False Negative
# * Nosso modelo previu que a pessoa NÃO tinha a doença e os dados mostraram
#   que SIM, a pessoa tinha a doença.

# True Positive
# * Nosso modelo previu que a pessoa tinha a doença e os dados mostraram que
#   SIM, a pessoa tinha a doença.

# Melhor Modelo acerto 98% de 100 comparações.