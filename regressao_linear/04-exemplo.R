# Regressão Linear

# Instalando pacotes
install.packages("caTools")
install.packages("ggplot2")

library(caTools)
library(ggplot2)
# Treinando um modelo na prática

# Coletando dados
caminho <- "/home/robson/Documents/scripts_r/dados/estudantes.csv"
df <- read.csv2(caminho)

# Verificando dados
summary(df)
str(df)

# Verificando se contém dados nulos
any(is.na(df))

# Criando amostra de forma randomica
set.seed(110)
amostra <- sample.split(df$age, SplitRatio = 0.70)

# Criando dados de treino - 70% dos dados
treino = subset(df, amostra = TRUE)

# Criando dados de teste - 30% dos dados 
teste = subset(df, amostra = FALSE)

# Gerando um modelo com todos os atributos
modelo_1 <- lm(G3 ~ ., treino)
summary(modelo_1)

modelo_2 <- lm(G3 ~ G1 + G2, treino)
summary(modelo_2)

modelo_3 <- lm(G3 ~ Fedu, treino)
summary(modelo_3)

modelo_4 <- lm(G3 ~ absences, treino)
summary(modelo_4)

# Visualizando dados e analisando o modelo

# Coletando os residuos 
res <- residuals(modelo_1)

# transformando o resultado em um dataframe
df_res <- as.data.frame(res)
df_res

# Gerando um histograma
ggplot(df_res, aes(df_res)) +
         geom_histogram(fill = 'blue',
                        alpha = 0.5,
                        binwidth = 1)

# Criando as previsoes 
previsao_g3 <- predict(modelo_1,teste)
previsao_g3

# Visualizando os calores previstos e observados
resultados <- cbind(previsao_g3, teste$G3)
colnames(resultados) <- c('Previsto', 'Real')
resultados <- as.data.frame(resultados)
resultados
min(resultados)

# Funcao que substitui qualquer numero negativo por 0
add_zero <- function(x){
  if(x < 0 ){
    return(0)
  }else{
    return(x)
  }
}

# Removendo valores negativos da nossa previsão
resultados$Previsto <- sapply(resultados$Previsto, add_zero)
resultados$Previsto

# Calculando o erro quadratico
mse <- mean((resultados$Real - resultados$Previsto) ^ 2)
print(mse)

# Calculando o RMSE
rmse <- mse ^ 0.5
rmse

# Calculando o R - Squared
SSE = sum((resultados$Previsto - resultados$Real) ^ 2 )
SST = sum((mean(df$G3) - resultados$Real) ^ 2)

# R - Squared
R2 = 1 - (SSE / SST)
R2