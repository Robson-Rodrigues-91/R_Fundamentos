# Instalndo pacotes
install.packages('readr')
install.packages('data.table')
install.packages('ggplot2')
install.packages('scales')

# Importando bibliotecas
library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)
library(ggplot2)

# Carregando os dados usando time para comparar tempo de carregamento.
# Usando read.cv2()

# Usando cv2
system.time(df_locate <- read.csv2(file.choose()))

# Usando table
system.time(df_locate2 <- read.table("TemperaturasGlobais.csv"))

# Usando fread
system.time(df_locate3 <- fread(file.choose()))
?fread

# Verificando os nomes das colunas
str(df_locate3)

Round <- subset(df_locate3, Country == 'Brazil') # Coletando informações conforme a regra.
Round <- na.omit(Round) # Removendo os valores N/A's
head(Round)
nrow(Round)
dim(Round)
nrow(df_locate3)

# Convertendo datas
Round$dt <- as.POSIXct(Round$dt,format = '%Y-%m-%d') # Pegando todas as datas e formatando.
Round$Month <- month(Round$dt) # Criando uma nova coluna usando somente o Mes.
Round$Year <- year(Round$dt) # Criando uma nova coluna usando somente o ano.

history <- subset(Round, City == 'São Paulo') # Gerando um novo subset por categoria history
history

new_history <- subset(history, Year %in% c(1992,1997,2004)) # Definindo o periodo dos dados 
new_history

letter_words <- subset(Round, City == 'Curitiba') # Gerando um novo subset por categoria letter_words
letter_words

new_letter_words <- subset(letter_words, Year > 2003) # Definindo o periodo dos dados maiores que 2003
new_letter_words

# Construindo um grafico ggplot
p_his <- ggplot(new_history, loess(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
          geom_smooth(se = FALSE, fill = NA, size = 2) +
          theme_dark(base_size = 20) + 
          xlab("Mês") + 
          ylab("Temperatura Média") + 
          scale_color_discrete("") +
          ggtitle("Dados medios ao longo dos anos por categoria") + 
          theme(plot.title = element_text(size = 18))

p_his