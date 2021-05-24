# Regressão linear 

# Pesquisa de dados sobre idade e reação

# Criando dados
Idade <- c(12, 43, 54, 6, 78, 23, 34, 10, 22, 19, 13, 14, 16, 61, 51)
Tempo <- c(12.32, 43.23, 10.10, 13.65, 12.31, 10.65, 16.11, 41.12,
           13.32, 33.23, 30.10, 42.65, 33.31, 22.65, 11.11)

# Grafico de dispersão
plot(Idade, Tempo, xlab = 'Idade', ylab = 'Tempo')

# Criando o Modelo 
modelo <- lm (Idade ~ Tempo)
modelo

# Ajustando parametro negativo
reta <- 25.75 - 0.5742 * Idade
lines(Tempo,reta)

# Relação entre peso e altura
altura <- c(123,176,145,187,196,154)
peso <- c(82, 34, 56, 99, 112, 76)

plot(altura, peso, pch = 16, cex = 1.3, col = 'blue',
     main = "ALTURA X PESO",
     xlab = 'Altura (cm)',
     ylab = 'Peso (kg)')

# Criando o modelo 
new_modelo <-lm(altura ~ peso)
summary(new_modelo)

# Prevendo possiveis resultados usando predict
previsao <- predict(new_modelo)
previsao

abline(new_modelo)

# Tamanho das amostras de dados
num <- length(altura)
num

# Valores Residuais
for (k in 1:num) {
   lines(c(peso[k],peso[k]), c(altura[k],previsao[k]))
}

# Distribuição de residuos
par(mfrow = c(2,2))
plot(modelo)