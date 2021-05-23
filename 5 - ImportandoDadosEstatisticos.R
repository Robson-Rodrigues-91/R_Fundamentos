# Importando dados estatisticos de outros softwares.


install.packages("haven")
library(haven)

#Importando um arquivo SAS
path = "C:/Users/Robso/Documents/scripts_r/dados/vendas.sas7bdat"
vendas <- read_sas(path)
class(vendas)
str(vendas)
vendas

media_ano <- median(vendas$age)
media_ano

#Importando um arquivo State
path_2 = "C:/Users/Robso/Documents/scripts_r/dados/mov.dta"
florida <- read_dta(path_2)
str(florida)

florida$Date <- as.Date(as_factor(florida$Date))
class(florida)
head(florida$Date)

# Importando um arquivo SPSS
path_3 = "C:/Users/Robso/Documents/scripts_r/dados/pessoas.sav"
pessoas <- read_sav(path_3)
head(pessoas)

# Instalando o pacote foreign
install.packages("foreign")
library(foreign)

# Importando um arquivo SPSS
path_4 = "C:/Users/Robso/Documents/scripts_r/dados/international.sav"
dados <- read_spss(path_4)
class(dados)
head(dados)

# Convertendo para dataframe
df <- data.frame(dados)
head(df)
boxplot(dados$gdp)

cor(dados$f_illit, dados$gdp)
cor(dados$m_illit, dados$gdp)

