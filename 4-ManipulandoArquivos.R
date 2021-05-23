# Manipulando arquivos em R

# verificando pacotes carregados
search()

# Verificando funcoes
?read.table

arquivo = 'pedido.txt'

# Verifica os arquivos do ambiente
list.files()

# Importando dados
df_pedido <- read.table(arquivo)

# Exibindo o dataframe
df_pedido

# Verificando as dimensoes do dataframe
dim(df_pedido)

# Importando o dataframa determinando alguns parametros
df_pedido <- read.table(arquivo, header = TRUE, sep = ',')
df_pedido

# Importando sem o titulo de cabecalho
df_pedido <- read.table(arquivo, header = FALSE, sep = ',')
df_pedido

# Definindo titulo de cabecalho 
df_pedido <- read.table(arquivo, header = TRUE, sep = ',',
                      col.names = c("Nome","Pedido","Data"))
df_pedido


# Definindo titulo de cabecalho inibindo variaveis
df_pedido <- read.table(arquivo, header = TRUE, sep = ',',
                      col.names = c("Nome","Pedido","Data"),
                      na.strings = c("Maria","Rowena"),
                      stringsAsFactors = FALSE)
df_pedido

# Funcao str, tras o resumo do dataframe
 str(df_pedido)
 
 
 # Lendo arquivos usando o read.csv
 df_pedido1 <- read.csv(arquivo, header = TRUE, sep = ',')
 df_pedido1
 
 df_pedido1 <- read.csv2(arquivo, header = TRUE, sep = ',')
 df_pedido1
 
 str(df_pedido1)
 dim(df_pedido1)
 
 # Importando um arquivo e adicionando o separador em virgula
 write.table(mtcars, file = 'mtcars.txt', sep = ',')
 
 setwd("C:/Users/Robso/Documents/scripts_r/dados")
 # Lendo um arquivo e definindo parametros.
 df_mtcars <- read.table('mtcars.txt', header = TRUE, sep = ',')
 str(df_mtcars)
 dim(df_mtcars)
 head(df_mtcars)
 
 install.packages("ggplot2")
 library(ggplot2)
 
 ggplot(df_mtcars, aes(x = gear), fill = c(cyl)) + geom_histogram()
   
 
 

