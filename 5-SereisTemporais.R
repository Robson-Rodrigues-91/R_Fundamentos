# Exemplo de series temporais

# Coletando informações
kings <- scan("http://robjhyndman.com/tsdldata/misc/kings.dat", skip = 3)
kings
class(kings)

# Convertendo o valor numerico para serie temporal
ts_king <- ts(kings)
ts_king

# Criando um gráfico de series temporais
plot.ts(ts_king)

?scan

# Lendo o arquivo externo
nascimento <- scan("http://robjhyndman.com/tsdldata/data/nybirths.dat")
ts_nasc <- ts(nascimento, frequency = 1, start = c(1940,1))
ts_nasc

# Criando Gráfico com o valor convertido
plot.ts(ts_nasc)

# Coletando cotações de ações
url <- "http://ichart.finance.yahoo.com/table.csv?s=IBM&a=00&b=2&c=1990&d=05&e=26&f=2016&g=d&ignore=.csv"
IBM.df <- read.table(url, header = TRUE, sep = ',')

# Visualizando as primeiras linhas do dataframe
head(IBM.df)				

# Convertendo o dataframe em série temporal
IBM <- xts(IBM.df$Close, as.Date(IBM.df$Date))	
head(IBM)

# Construindo um plot
plot(IBM)		

?window

# window is a generic function which extracts the subset of 
# the object x observed between the times start and end. If a 
# frequency is specified, the series is then re-sampled at
# the new frequency.

# Criando um subset do conjunto de dados de series temporais
IBM.2014 <- window(IBM,start="2014-01-01", end="2015-01-01")	

# Plotando
plot(IBM.2014)         




