# Regressão linear

# Criando uma massa de dados aleatória
x <- seq(0,1000)
y <- 3 * x + 25

# Gerando uma distribuição normal
z <- y + rnorm(1001,0,500)

# Criando um gráfico de relacionamento
plot(x, z, pch = 19 , xlab = 'x', ylab = 'z')

# Criando um modelo de regressão
modelo <- lm(z~x)
modelo

modelo_parte1 <- modelo$coefficients[1]
modelo_parte2 <- modelo$coefficients[2]

# Aplicando a fórmula de regressão 
new_modelo <- modelo_parte1 + modelo_parte2 * x
new_modelo

# Visualizando a linha de regressão
lines(x, new_modelo, lwd = 2)

# Simulando linhas de regressão
modelo2 <- (new_modelo[51]-50*(modelo_parte2 - 1)) + (modelo_parte2-1) * x
lines(x,modelo2, lty = 3)

modelo3 <- (new_modelo[51]-50*(modelo_parte2 - 1)) + (modelo_parte2-1) * x
lines(x,modelo3, lty = 3)

modelo4 <- (new_modelo[51]-50*(modelo_parte2 - 2)) + (modelo_parte2 - 2) * x
lines(x,modelo4, lty = 3)


