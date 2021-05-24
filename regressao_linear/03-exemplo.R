# Regressão linear 

#instalando pacotes necessários
install.packages("ggplot2")
install.packages("ggthemes")
install.packages("dplyr")
install.packages("corrgram")
install.packages("corrplot")

library(ggplot2)
library(ggthemes)
library(dplyr)
library(corrgram)
library(corrplot)

# Importando arquivo 
arquivo = "/home/robson/Documents/scripts_r/dados/estudantes.csv"

# Transformando em um dataframe
df <- read.csv2(arquivo)

# Explorando dados
head(df)
summary(df)
str(df)

# Verificando se contém algum dado vazio
any(is.na(df))

# Obtendo somente as colunas numericas
colunas_numericas <- sapply(df, is.numeric)
colunas_numericas

# Filtrando colunas numericas
data_correlacao <- cor(df[,colunas_numericas])
data_correlacao

# Criando um corrplot
corrplot(data_correlacao, method = 'color')

# Criando um corrgram
corrgram(df)
corrgram(df, order = TRUE, 
         lower.panel = panel.shade, 
         upper.panel = panel.pie, 
         text.panel = panel.txt)

# Criando um Histograma
ggplot(df, aes(x = G3)) + 
      geom_histogram(bins = 20,
                      alpha = 0.5,
                      fill = 'blue') + theme_minimal()

