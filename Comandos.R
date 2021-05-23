# Descobrindo o caminho atual do Repositorio
getwd()

# Verificando os contribuintes da linguagem
contributors()

# Verificando a Sessão
sessionInfo()

# Verificando a licença
license()

# Exibindo informações na tela
print("Robson Rodrigues")

# Gerando um grafico no R
plot(range(1:30))

# Gerando um Histograma
hist(rnorm(10))

# Instalando um pacote no R
install.packages('randomForest')

# Usando o pacote instalado
library(randomForest)

# Descarregando o pacote instalado.(está instalado mas não carregado na area)
detach(package:randomForest)

# Verificando informações da função
help(mean)

# Funcção example('matplot) -> ensina como se usa determinada função.
#example('matplot')

# Coletando o resto da divisão
total = 14 %% 3
print(total)


# Verificando o tipo do objeto
class(total)

# Declarando um valor para a variavel
x = 4

# Verificando se a variavel é do tipo inteiro
is.integer(x)
 
# Transformando a variavel em um tipo Inteiro.
y = as.integer(x)

# Numero complexo -> adicionando o i no final do numero.
com = 2.3 + 3i
class(com)

# Objeto Variavel
var = 367

# Retorna o tipo de armazenamento do objeto
mode(var)

# Atribuindo valores ao objeto
x <- c(2,3,4,56,6)
mode(x)

# Modificando os valores do x
assign("x",c(1,4,2,34))

# Imprimindo a posição do 1 do valor de x
x[1]

# Listando as variaveis do usadas
ls()
objects()

# Aprendendo sobre objetos

# VETORES
# Preenchendo um vetor com o range.
vector1 <- c(1:20)
vector1

# Verificando o tamanho do vetor
length(vector1)

# Criando uma matriz -> limitada a 2 dimensoes
matriz <- matrix(1:20, nrow=4)
matriz

# Criando uma array em forma de cubo
y <- c(3,3,3)
array1 <- array(1:15,dim=y)
array1

# DATAFRAME -> Uma matriz de diferentes dados
View(iris)

# Criando uma lista em R
lista1 <- list(a=matriz,b=array1)
lista1

# Criando uma funcao em R
# Retorna a raiz quadrada de um numero
func <- function(x){
  var = sqrt(x)
  return(var)
}
func(25)

# CRIANDO VETOR
vector1 <- c('Teste','Teste2')
vector1

vector2 <- c(2.3,43.2)
vector2

vector3 <- c(2.3+2i,43.2+9i)
vector3

vector4 <- c(2,3,43,2,45,43,7,5,1)
vector4

vector5 <- c(2,3,43,20,42,44,7,5,1)
vector5

# Concatenando vector 2 e 4
c(vector5,vector4)

# Somando os vetores
vector5 + vector4

# MANIPULANDO MATRIZES

# Criando uma matrix e passando a quantidade de linhas 
matrix(c(1:6), nr=2)
matrix(c(1:6), nr=3)
matrix(c(1:8), nr=4)

# Criando uma matrix e passando o numero de colunas
matrix(c(1:8), nc=4)

meus_dados = c(1:50)
matrix(data=meus_dados,nrow=5,ncol=5,byrow=T)
w <- matrix(data=meus_dados,nrow=5,ncol=5)

# Transpondo a matriz
t(w)

# Invertendo a matriz
solve(w)

# Combinando matrizes por colunas
cbind(matriz1,matriz2)
 
# Combinando matrizes por linhas
rbind(matriz1,matriz2)

# Transformando uma matriz em um vetor 
c(matriz)

# LISTAS -> CONJUNTOS DE OBJETOS DE TAMANHOS E TIPOS DIFERENTES.
lista <- list(1,2,3,2,4,5,3)

lista1 <- list(2.43,5.346,34.5)

lista2 <- list(1:10,c("Robson","Maria"),rnorm(10))

# Nomeando elementos da lista
names(lista2) <- c("Inteiros","Nomes","Numericos")
lista2

lista2$Nomes[1]
# APRENDENDO SOBRE STRINGS
texto <- "Isso é uma string"
texto

# Convertendo Float em string
x = 3.14
y = as.character(x)
y

# Concatenando strings
nome = 'Robson'
sobrenome = 'Rodrigues'
paste(nome,sobrenome)
cat(nome,sobrenome)

# Formatando saidas
sprintf("O governo existe há %d anos",8)

# Coletando trechos da string
text <- "Isso é uma frase enorme."
new_text = substr(text,start = 3, stop=10)
new_text

# Contando o numero de caracteres
nchar(text)

# Transformando as letras em minusculas e maiusculas
tolower(text)
toupper(text)

install.packages('stringr')

library(stringr)

# Dividindo a string por espaços
strsplit("Teste de desenvolvimento na linguagem R"," ")

# Dividindo a string em caracteres e salvando em uma lista
lista_dados <- list(strsplit("Teste de desenvolvimento na linguagem R",NULL))
lista_dados

# Adicionando 2 strings
string1 <- c("teste de desenvolviemtno")
string2 <- c("na linguagem R")
str_c(c(string1,string2),sep="")

# Contando quantas vezes o caractere aparece na frase
str_count(string1,"e")

# Verifica a primeira e ultima vez que aparece o caractere
str_locate_all(string1,"e")

# Verifica se existe um certo padrão dentro da string
teste <- "Teste de desenvolvimento"
padrao = "de des"
padrao_atual = grepl(pattern = padrao, x = teste)

if(padrao_atual){
  print("Sim, existe um padrão na string")
}else{
  print("Não, não existe um padrão na string")
}

# Importando arquivos txt
arquivo <- read.csv("Caminho do arquivo.txt")

# As 10 primeiras linhas
head(arquivo)

# AS ultimas 10 linhas
tail(arquivo)

# Contando um caractere especifico
str_count(arquivo,"a")

# Mostrando todas as posições que o caractere aparece
str_locate_all(arquivo,"a")

# FUNCOES EM R

strtail <- function(s,n=1){
  if(n<0){
    substring(s,1-n)
  }else{
    substring(s,nchar(s)-n+1)
  }
}

strtail("teste de desenvolvimento", 10)

#APRENDENDO DATAFRAME

# Criando um dataframe
data.frame("conteudo")

#Lendo arquivos de dataframe
read.csv("arquivo")

nomes <- character()
datas <- as.Date(character())
numeros <- numeric()
telefone <- integer()

# Criando um dataframe com os dados criados a cima
df <- data.frame(c(nomes,datas,numeros,telefone))
df

# Criando um novo dataframe com dados 
pais = c("EUA","Brasil","Alemanha","Suecia","Inglaterra")
nomes = c("Robson","Rowena","Maria","Roberta","Nicolly")
alturas = c(1.85,1.58,1.59,1.77, 1.60)
codigos = c(43534,5353,3454,3453,346534)

pesquisa2 = data.frame(pais,nomes,alturas,codigos)
pesquisa2

# Criando um novo dataframe e adicionando mais uma coluna de dados
olhos = c("preto","verde","castanho","preto","castanho")
new_pesquisa = cbind(pesquisa2,olhos)
new_pesquisa

# Informaçõe do dataframe
str(new_pesquisa) # Verifica os vetores
dim(new_pesquisa) # Verifica a dimensao
length(new_pesquisa) # Verifica o tamanho

# Acessando a posicao do vetor dentro do dataframe
new_pesquisa$nomes[1]

# Pesquisando o numero de colunas e linhas do dataframe
ncol(new_pesquisa)
nrow(new_pesquisa)
new_pesquisa$pais 

?mtcars

# Criando filtros nas colunas do dataframe

# Trazendo daddos com a altura menor que 1.70
new_pesquisa[alturas < 1.70,]

# Trazendo daddos com a altura menor que 1.70 e apenas as colunas passadoas
new_pesquisa[alturas < 1.70,c('pais','olhos')]

# Nomeando dataframes
names(new_pesquisa) <- c("Pais","Nomes","Altura","Código","Olhos")
new_pesquisa

# Nomeando Colunas
colnames(new_pesquisa) <- c("col1","col2","col3","col4","col5")

# Nomeando Linhas
rownames(new_pesquisa) <- c("row1","row2","row3","row4","row5")

new_pesquisa

# Lendo um arquivo csv
df2 <- data.frame(read.csv(file='dframe.csv', header=TRUE, sep=','))
df2

# Verificando dados de uma tabela do R
summary(mtcars$mpg)

# Criando graficos com os dados da tabela
plot(mtcars$mpg,mtcars$gear)
plot(mtcars$mpg,mtcars$wt)

head(mtcars)

# Interagindo com o sistema operacional
list.files() # Lista os arquivos do repositorio atual.
.Platform$OS.type # exibe o tipo de sistema operacional.
.Platform$file.sep # Mostra o tipo de separador.
Sys.Date() # Mostrando a data atual.
Sys.info() # Exibindo dados da maquina.
R.version # Versão do R
?system # Invocando comandos do so.
system('ls -a') # exibindo os arquivos do diretorio atual.

# Criando um vector 
vector <- c("Robson","Maria")
vector

# Criando uma matriz - conjunto de elemento bidimensional do mesmo tipo de dados.
dados <- c(1:100)
matriz <- matrix(dados, nrow = 5, ncol = 5, byrow = T)
matriz

# Criando uma lista 
lista <- list(vector,matriz)
lista

# Criando um data frame que aceita dados de diferentes tipos
vector1 <- c(10,20,30,40,50)
dados1 <- c(1:50)
matriz1 <- matrix(dados1, nrow = 5, ncol = 5, byrow = T)
lista1 <- list(vector1,matriz1,dados1)
df <- data.frame(vector1,dados1,matriz1,lista1)
df

# Comparando vetores e matrizes
vector1 > 10
matriz1 > 20
dados1 > 50
lista1 > 2

# 1 - Usando loop para percorrer a lista e verificar a seguinte condição
for (valor in length(vector1)){
  if(vector1[valor] > 10){
    print("Pelo menos um numero é maior que 10.")
  }else{
    print("todos os numeros são menores que 10.")
  }
}

# 2 - Usando loop para percorrer a lista e verificar a seguinte condição
for(valor in vector1){
  print(valor)
}

# 3 - Usando loop para percorrer a lista e imprimir as posicoes.
for(valor in 1:length(vector1)){
  print(valor)
}

# Criando uma transposta da matriz inverte linhas e colunas
matriz2 <- matrix((1:25), nrow = 5, ncol = 5, byrow = T)
matriz2
matriz3 <- t(matriz2)
matriz3

# Adicionando nomes as colunas da matriz
colnames(matriz3) <- c("coluna1","coluna2","coluna3","coluna4","coluna5")
matriz3

# Verifica se é uma matriz
is.matrix(matriz3)

# Converte para uma lista 
as.list(matriz3)

# Criando uma matriz com valores N/A
mat1 <- matrix(1:90,10)
mat1

# Misturando numeros n/a na matriz
mat1[sample(1:50, 10)] = NA
mat1

# Operadores em objetos
vector1
sum(vector1) # Somando valores
mat1
rowSums(mat1) # Somando as linhas da matriz
colSums(mat1) # Somando as colunas da matriz
cbind(vector1,mat1) # unir por colunas
rbind(vector1,mat1) # unir por linhas
mat1 * 3 # Multiplica toda a matriz por 3.

# Dataframes

mtcars # dataframe nativo do R
head(mtcars) # as 10 primeiras posicoes
tail(mtcars) # as ultimas 10 posicoes
str(mtcars) # sumario do dataframe
mtcars[,5] # slicing pegando todos os valores até 5
mtcars[1:4, 7:9] # Pegando as primeiras posicoes conforme a segunda condição
mtcars[1:4, 'hp'] # pegando as primeiras posicoes da coluna 'hp'
subset(mtcars, subset = 'hp' > 170) # Usando para criar regras na pesquisa

# Usando ordenação com a biblioteca dplyr
library(dplyr)
slice(mtcars,1:4) # fatiando o dataframe mtcars
order(mtcars) # Ordenando o dataframe
order(mtcars$hp) # Ordenando o dataframe por uma coluna especifica.

#Manipulacao de lista
lista <- list(v1=34,v2 = list(123,234,2,46,7,"sdfsd"), v3 = c(234,354,43,32))
lista
class(lista)

# unlist -> usado para desfazer uma lista e transformar os resultados em vetores
new_vetor <- unlist(lista)
new_vetor
class(new_vetor)

data <- list()

N <- 100

for (n in 1:N){
  data[[n]] = data.frame(index = n, char = sample(letters, 1), z = rnorm(1))
}

head(data)

# do.call - Serve para aplicar uma regra em todos os dados de uma lista.
# do.call(funcao,objeto)

do.call(rbind,data)

valor <- list(234,34,2,345,32,4,4)
do.call(sum,valor)

#Usando na pratica

data <- c("2021-23-03","2021-24-03","2021-25-03")

data <- strsplit(data,"-")
class(data)
data
matriz <- matrix(unlist(data), ncol = 3, byrow=TRUE)
matriz

# Aprendendo o Funcoes especiais

# Instalando a biblioteca
install.packages('plyr')
install.packages('rbenchmark')
library(rbenchmark)
library(plyr)

# Chamando a biblioteca

list_y <- list(1:3,1:8,1:5)

#Vector de inteiros 
vector_numeric <- list(as.numeric(1:300000),as.numeric(1:600000),as.numeric(1:900000))
benchmark(do.call(sum,list_y), ldply(list_y,sum), do.call(sum,vector_numeric), ldply(vector_numeric,sum))

# Apredendo o strsplit
texto <- "Essa � uma string de informacoes"
new_texto <- strsplit(texto," ")
new_texto
class(new_texto)

# manipulando dadtas
data <- c("2021-04-06","2021-11-09","2021-09-02","2021-08-05")
new_list_data <- strsplit(data,"-")
new_list_data

# Criando uma matriz com o valor
matriz <- matrix(unlist(new_list_data), ncol = 3, byrow= TRUE)
class(matriz)

#manipulando uma lista de nomes
nomes <- c("Robson, Rodrigues", "maria das , dores", "Roberta, Rodrigues", "Rowena, Reis")
new_list_names <- strsplit(nomes, ",")
new_list_names

phrase <- "Muitas vezes temos que se afastar de coisas e pessoas ruins, para que os seus objetivos e sonhos se tornem realidade."
new_phrase <- strsplit(phrase," ")[[1]]
new_words = unique(tolower(new_phrase))
new_words

#INSTALANDO PACOTES EM R
install.packages(c('ggvis','tm','dplyr'))
library(ggvis)
library(tm)
require(dplyr)

# Verifica os pacotes na area de trabalho 
search()

#remove pacotes
detach(package:utils)

search()

# Verifica funcoes dentro do pacote
ls(pos = "package:tm")

# Fixando o dataset iris para uso na area de trabalho
attach(iris)
sum(Sepal.Length)


# EXPRESSOES REGULARES 
# --------------------------------------------------------
str_words <- c("Robson Rodrigues", " Maria das dores","Teste de desenvolvimento",
               "Aprendendo novo conteudo", "nova materia")
class(str_words)
length(str_words)

# Trabalhando com grep()
grep("de", str_words, value = F) # vALOR FALSE TRAS APENAS O INDICE EM QUE SE ENCONTRA.
grep("de", str_words, value = T) # vALOR TRUE TRAS O CONTEUDO DO INDICE EM QUE SE ENCONTRA.

grepl("\\d", str_words) # Usada para verificar se existe algum padr�o e retorna falso na string que n�o tenha.

gsub("o","O", str_words)
gsub("a","A", str_words, ignore.case = TRUE) # Vai ignorar o case sensitive.

sub("d","D", str_words) # substitui apenas o primeiro padrao que encontrar em cada elemento.

# MANIPULA��O DE DATAS 
# --------------------------------------------------------
hoje <- Sys.Date()
hoje
class(hoje)

hora <- Sys.time()
hora
class(hora)

hora_local <- Sys.timezone()
hora_local
class(hora_local)

# Formatando a data pre formatada
data <- as.Date("2021-04-06")
class(data)

# Formatando uma data pr� definida
new_data <- as.Date("Jun-02-21", format = "%b-%d-%y")
class(new_data)

# Pegando a data de hoje e formatando 
today <- format(Sys.Date(), format = "%d,%B de %Y")
today

# manipulando usando as.POSIXct
date1 <- "Jun 13, '96 hours:23 minutes:01 seconds:45"
data_convert <- as.POSIXct(date1, format = "%B %d, '%y")
data_convert

new_date <- as.Date("2021-05-03", format = "%Y-%m-%d")
new_date

# extraindo periodos
b1 = ISOdate(2021,6,4)
b2 = ISOdate(1991,7,9)

my_age = b1 - b2
my_age

difftime(my_age, units = 'weeks')

# trabalhando com o pacote lubridate
install.packages('lubridate')
library(lubridate)

# formatos de datas do sistema
ymd("20210604")
mdy("06-04-2021")
dmy('06-04-2021')

# pegando data e hora
checkin <- ymd_hms("2021-04-06 13:00:00")
checkout <- ymd_hms("2021-07-06 14:00:00")

interval(checkin, checkout)

# mostrando os segundos
second(checkin) <- 24
checkin

#Mostrando o dia da semana
wday(checkin, label = TRUE)

# BASE PLOTTING SYSTEM
# --------------------------------------------------------------
search()

class(lynx)
plot(lynx) # Transformando em gr�fico
plot(lynx, ylab="Plot com dataframes", xlab='')
plot(lynx, ylab="Plot com dataframes", xlab='Observa��es')
plot(lynx, main="Plot com dataframes", col='green')
plot(lynx, main="Plot com dataframes", col='red', col.main = 'grey80')

library(datasets)
hist(warpbreaks$breaks)

# SALVANDO GRAFICOS

#png
png('grafico.png', width = 500, height = 500, res = 80)

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = "Gr�fico a partir do dadtaset iris")

dev.off()

#pdf
png('grafico2.png')

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = "Gr�fico a partir do dadtaset iris")

dev.off()

# Aumentando as funcionanlidaddes do pacote de graficos
install.packages('plotrix')
library(plotrix)

par(mfrow = c(1,1), col.axis = 'red')
plot(1:6, las = 3, xlab = 'lty 1:6', ylab = '', main = "Teste de graficos")

# Criando um novo grafico

x = rnorm(10,5,7)
y = rpois(10,7)
z = rnorm(10,6,7)
t = rpois(10,9)

plot(x, y, col = 'darkblue', main = 'teste de desenvolvimento', col.main = 'red',
     xlab = 'independente', ylab = 'dependente', pch = 10, cex.main = 1.6)

# Adiciona outros dados
points(z , t , col = 'orange' , pch = 9)

# Adiciona mais dados
points(y,x, col = 'pink', pch= 6)

# Criando legenda
legend(-2,3, legend = c("Nivel 1", "Nivel 2", "Nivel 3"),
       col = c('darkblue','orange','pink'), 
       pch = c(10,9,6),
       cex = 0.65,
       bty = 'n')


# trabalhando com grafico pizza
?iris
attach(iris3)
values = table(Species)
labels = paste(names(values))
values
labels
pie(values, labels = labels, main = "Distrib. Especies")


# GR�FICOS GGPLOT 2
# ------------------------------------------------------------------------------
install.packages('ggplot2')
install.packages('reshape2')
library(ggplot2)
library(reshape2)

#plotando um grafico basico com qplot()
data(tips,package = 'reshape2')
qplot(total_bill, tip, data = tips, geom = 'point')


#Camada 1 criando um objeto
camada1 <- geom_point(
  mapping = aes(x = total_bill, y = tip, color = sex), 
  data = tips, 
  size = 3)

ggplot() + camada1

# Construindo um modelo de regressao

modelo_base <- lm(tip ~ total_bill, data = tips)
modelo_fit <- data.frame(
  total_bill = tips$total_bill,
  predict(modelo_base, interval = "confidence")
)

head(modelo_fit)
 
# construindo a camada 2
camada2 <- geom_line(
  mapping = aes(x = total_bill, y = fit),
  data = modelo_fit,
  color = 'darkred'
)

ggplot() + camada1 + camada2


# Construindo a camada 3
camada3 <- geom_ribbon(
  mapping = aes(x = total_bill, ymin = lwr, ymax = upr),
  data = modelo_fit,
  alpha = 0.3
)

ggplot() + camada1 + camada2 + camada3

# Vers�o otimizada
ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

# Versao do grafica em um objeto
grafico <- ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')

print(grafico)

ggplot(mtcars, aes(x = disp, y = mpg)) + geom_point(shape = 2)

carros <- ggplot(mtcars, mapping = aes(x = disp, y = mpg)) + 
          geom_point(shape = 4)

print(carros)

# outro aspecto que pode ser mapeado de grafico
ggplot(data = mtcars, aes(x = disp, y = hp, colour = as.factor(vs))) +
  geom_point()

# outro aspecto que pode ser mapeado de grafico construindo cores com variaveis
ggplot(data = mtcars, aes(x = disp, y = hp, colour = cyl)) +
  geom_point()

# outro aspecto que pode ser mapeado de grafico construindo cores com variaveis
ggplot(data = mtcars, aes(x = disp, y = hp, colour = cyl, size = wt)) +
  geom_point()

# Criando um grafico de barras com apenas um elemento 
ggplot(data = mtcars, aes(x = disp,fill = as.factor(vs))) +
  geom_histogram() + xlab("Horizontal") + ylab("Vertical") + xlim(0,1000) + ylim(0,5) 

# Colour = Contorno do gr�fico
# Fill = Preenchimento interno do gr�fico.

# Graphic MAPS Google -> Register API_KEY
# ------------------------------------------------------------------------------
install.packages("ggmap")
install.packages("mapproj")

library(ggmap)
library(mapproj)
library(ggplot2)
#criando um mapa simples
map1 <- get_map(location = "BRAZIL", zoom = 5)
ggmap(map1)

qmap('Recife')

# NetworkD3
# Arestas e nodes de um grafo 

install.packages('networkD3')
library(networkD3)
data(MisLinks, MisNodes)

forceNetwork(Links = MisLinks, 
             Nodes = MisNodes, 
             Source = 'source', 
             Target = 'target', 
             Value = 'value', 
             NodeID = 'name',
             Group = 'group', 
             opacity = 1.0)

#Criando dados

src <- c("A","A","A","A",
         "B","B","C","C","D")

target <- c("B", "C", "D", "J", 
            "E", "F", "G", "H", "I")

networkData <- data.frame(src,target)

simpleNetwork(networkData, opacity = 1.0)