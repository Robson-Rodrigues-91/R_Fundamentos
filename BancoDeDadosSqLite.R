# TRABALHANDO COM BANCO DE DADOS SRQLITE

# Instalando o sqlite
install.packages("RSQLite")
library(RSQLite)

# Remover o banco sqlite, caso exista - não é obrigatorio
# remover no windows
system("del exemplo.db")

# Criando um drive de conexão com o banco de dados
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db")

# Criando uma tabela e carregando o banco de dados mtcars
dbWriteTable(con,"mtcars", mtcars)

#Listando uma tabela
dbListTables(con)

# Verificando se a tabela existe
dbExistsTable(con,"mtcars")

# Listando nome de colunas
dbListFields(con,'mtcars')

# Lendo conteudo da tabela
dbReadTable(con, "mtcars")

# Criando uma definição para a tabela
dbWriteTable(con,"mtcars2", mtcars[0,])

# Listando as tabelas do banco de dados
dbListTables(con)

# Criando uma consulta no banco de dados 
query = "select row_names from mtcars"
result = dbSendQuery(con, query)
dados = fetch(result, n = -1)
class(dados)

# Executando consultas no banco de dados
query = "select hp from mtcars"
result = dbSendQuery(con, query)
while(!dbHasCompleted(result))
{
  dados = fetch(result, n = 1)
  print(dados$hp)
}

query = "select disp,hp from mtcars where hp > 150"
result = dbSendQuery(con, query)
while(!dbHasCompleted(result))
{
  dados = fetch(result, n = 1)
  print(dados)
}

query= "select row_names, avg(hp) from mtcars group by row_names"
result = dbSendQuery(con, query)

# Criando uma tabela a partir de um arquivo
path = 'C:\Users\Robso\Documents\scripts_r\dados\pedido.txt'
dbWriteTable(con, "pedido", path, sep = ',', header = TRUE)
dbListTables(con)
dbReadTable(con,'pedido')

# Encerrando a conexão com o banco de dados
dbDisconnect(con)

# Carregando um banco de dados do zero
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "exemplo.db")


# Carregando dados para a nova tabela
path = 'C:/Users/Robso/Documents/scripts_r/dados/etnias.csv'
dbWriteTable(con, "etnias", path, sep=',', header = T )

# Removendo tabela com dados errados
dbRemoveTable(con, "etnias")

dbListTables(con)
dbReadTable(con,'etnias')

df <- dbReadTable(con, 'etnias')
str(df)

# Verificando os nomes das colunas e os tipos da cada coluna.
sapply(df,class)

# Grafico Idade
hist(df$Idade)

# Tirando a media das colunas IDADE, PESO e ALTURA.
df_mean <- unlist(lapply(df[,c(3,4,5)], mean))
df_mean

dbDisconnect(con)