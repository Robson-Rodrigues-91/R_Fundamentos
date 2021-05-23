# Coletando informacoes de uma pagina web.
install.packages("rvest")
install.packages("stringr")
install.packages("tidyr")

library(rvest)
library(stringr)
library(tidyr)

# Coletando informações do superbowl
url = "http://www.espn.com/nfl/superbowl/history/winners"
nfl <- read_html(url)

# Pegando informacoes da tabela
tabela <- html_nodes(nfl, 'table')
tabela

# Coletando os dados da 1ª posicao da tabela extraída do site
dados <- html_table(tabela)[[1]]

# Removendo titulos inapropriados para a tabela
dados <- dados[-(1:2),]

# adicionando novo cabecalho 
names(dados) <- c("id", "date", "site", "result") 
head(dados)

# Formatando numeros Romanos
dados$id <- 1:55

#Formatando as datas
dados$date <- as.Date(dados$date, "%B.%d, %Y")

# Separando os dados agrupados da coluna result.
dados <- separate(dados, result, c("winner", 'loser'), sep = ',' )

#Padrão numérico -> Ajuda a encontrar valor numerico dentro da coluna.
padrao = "\\d+$"

# Extraindo os valores numericos e adicionando em uma nova coluna.
dados$winScore <- as.numeric(str_extract(dados$winner, padrao))
dados$losScore <- as.numeric(str_extract(dados$loser, padrao))

# substituindo os valores numericos por vazios da coluna
dados$winner <- gsub(padrao,"",dados$winner)
dados$loser <- gsub(padrao,"",dados$loser)

#verifica o diretorio atual
dir()

# Salvando o arquivo em csv
write.csv(dados, "superbowl.csv", row.names = F)