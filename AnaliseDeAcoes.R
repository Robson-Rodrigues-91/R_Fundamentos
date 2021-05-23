# Analise de ações do mercado

install.packages("quantmod")
install.packages("xts")
install.packages("moments")


library(quantmod)
library(xts)
library(moments)


?quantmod
?xts
?moment

# Definindo Periodo
data_inicio = as.Date("2021-01-01")
data_final = as.Date("2021-04-15")

?getSymbols

# Buscando informações no periodo determinado.
bitcoin <- getSymbols("BTC-USD", 
                      src = 'yahoo', 
                      from = data_inicio, 
                      to = data_final,
                      auto.assign = FALSE)

# Analisando o tipo de dados
class(bitcoin)
is.xts(bitcoin)

head(bitcoin)

# Recuperando dados de fechamento
bitcoin_close <- bitcoin[,'BTC-USD.Close']
head(Cl(bitcoin_close),5)

# Criando grafico de candlestick de bitcoin
?candleChart
candleChart(bitcoin, 
            up.col = "orange", 
            dn.col = "green")

# Plot de Fechamento
plot(bitcoin_close, 
     main = "Dados Bitcion", 
     col = 'red',
     xlab = "Data",
     ylab = "Preço",
     major.ticks = "day",
     minor.ticks = F)

# Adicionando bandas de bollinger
?addBBands
addBBands(n = 20, sd = 3.0)

# Adicionando o indicador ADX, média 11 do tipo exponencial
?addADX
addADX(n = 11, maType = "EMA")

# Analisando Logs
bitcoin_ret <- diff(log(bitcoin_close), lag = 1)
bitcoin_ret <- bitcoin_ret[-1]
bitcoin_ret

# Plano da taxa de retorno.
plot(bitcoin_ret, 
     main = "Retorno diário de bitcoins",
     col = "red",
     xlab = "Data",
     ylab = "Preço",
     major.tricks = "month",
     minor.tricks = F)

# Calculando algumas medidas estatisticas
statNames <- c("Media", "Desvio Padrão", "Skewness", "Kurtosis")
bitcoin_status <- c(mean(bitcoin_ret), 
                    sd(bitcoin_ret), 
                    skewness(bitcoin_ret),
                    kurtosis(bitcoin_ret))
names(bitcoin_status) <- statNames
bitcoin_status

# Coletando informações da moeda do site 
new_bit <- getSymbols("BTC-USD",
           src = 'yahoo',
           from = data_inicio,
           to = data_final,
           auto.assign = F)

# SAlVANDO O ARQUIVO .RDS
saveRDS(new_bit, file = "bitcoin.rds")

# Lendo o arquivo salvo
bit <- readRDS('bitcoin.rds')
xts(bit)