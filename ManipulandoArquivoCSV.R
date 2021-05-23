# Trabalhando arquivos csv

# Instalando o pacote readr
install.packages("readr")
library(readr)

# Abrir o prompt para selecionar o arquivo
dados <- read_csv(file.choose())
#dados <- read_delim(file.choose(), sep = ",")
str(dados)

getwd()
list.files()
df1 <- read_table("temperaturas.txt", col_names = c("DAY", "MONTH", "YEAR","TEMP"))

head(df1)
str(df1)

# Lendo cada linha do arquivo
read_lines("temperaturas.txt", skip = 0, n_max = -1L)
read_file("temperaturas.txt")

# importando dados com read_csv
df_cad <- read_csv("URL SITE OR REPOSITORIO")
head(df_cad)
View(df_cad)
# Salvando em um arquivo local 
write.csv(df_cad, "df_bckp.csv")

# usando o dplyr
install.packages("dplyr")
# dplyr -> é um tipo de dataframe formatado em forma de tabela.

library(dplyr)

df_cad <- tbl_df(mtcars)
head(df_cad)
class(df_cad)

# Importando varios arquivos ao mesmo tempo
list.files()
getwd()
lista_arquivos <- list.files("C:/Users/Robso/Documents/scripts_r/dados", full.names = TRUE)
class(lista_arquivos)
lista_arquivos

list_archive <- lapply(lista_arquivos, read_csv)
problems(list_archive)

# funcao parse_date para formatar data na hora da importação dos dados.
parse_date("01/02/2021", "%m/%d/%Y")
parse_date("01-02-2021", "%d/%m/%y")
parse_date("01-02-2021", "%m/%d/%y")

locale('en')
