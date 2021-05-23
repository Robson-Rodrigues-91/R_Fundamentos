# Limpando dados com lplyr e dplyr

# Instalando pacotes
install.packages("dplyr")
install.packages("readr")
install.packages("ggplot2")
install.packages("tidyr")
library(ggplot2)
library(dplyr)
library(readr)
library(tidyr)

path = "C:/Users/Robso/Documents/scripts_r/dados/sono.csv"
df_sono <- read_csv(path)
head(df_sono)
str(df_sono)

# Verificando status dos dados 
glimpse(df_sono)

# Simulando uma nova coluna no dataframe com metado do peso
glimpse(mutate(df_sono, peso_dividido = peso / 2))

# Contando pessoas por pais
count(df_sono, pais)

# Criando um histograma com a coluna peso
hist(df_sono$peso)

# Mostrando 10 resultados do dataframe
?sample_n

# Coletando uma amostra do dataframe
amostra <- sample_n(df_sono, size = 10)
print(amostra)

# Pegando nome e total de horas de sono
# Usando select
media_sono <- select(df_sono, nome, sono_total)
mutate(media_sono, media_sono = sono_total / 12)

# Usando um filter para selecionar determinado tipo de dado
# Usando filter
filter(df_sono, sono_total >= 10)
filter(df_sono, sono_indice >= 9)
filter(df_sono, cidade %in% c("Rio de Janeiro", "Recife"))

# Arrange organiza o dataframe por valores
df_sono%>%arrange(cidade)%>%head

# usando arrange para organizar dados
# Ordenando o sono_total por ordem decrescente
# Com o resultado maior que 16

df_sono %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>%
  filter(sono_total >= 16)

df_sono%>%
  select(nome, cidade, sono_total)%>%
  arrange(cidade, sono_total) %>%
  filter(sono_total <= 16)

head(df_sono)

# Criando colunas usando mutate
df_sono%>%
  mutate( novo_indice = sono_total / peso, media_peso = peso/ 12)%>%
  head()

# Usando summarise para calcular colunas do dataframe
df_sono%>%
  summarise(media_sono = mean(sono_total))%>%
  head()

df_sono%>%
  summarise(media_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total))%>%
  head()

# Usando um group_by para organizar os dados
df_sono%>%
  group_by(cidade)%>%
  summarise(avg_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())%>%
  head()

# Instalando o pacote hflights (dados de voos de houston)
install.packages("hflights")
library(hflights)

# tbl_df é uma inovação do dataframe mais sofisticado.
df_fly <- tbl_df(hflights)
df_fly

# Verificando variaveis
str(df_fly)
glimpse(df_fly)

# Criando um filtro raiz
head(df_fly[df_fly$ActualElapsedTime == 60 & df_fly$TaxiIn == 6, ])

data.frame(head(df_fly))

filter(df_fly, Month == 1, DayofMonth == 1)
filter(df_fly, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(df_fly, UniqueCarrier %in% c("AA","UA"))

# Trabalhando com tidyr

install.packages("tidyr")
library(tidyr)

# Criando um data frame para manipular
df <- data.frame(nomes = c("Billions", "Suits", "Game of Thrones"),
                  regiaoA = c(34,64,83),
                 regiaoB = c(43,25,74))
df

# Usando o metodo gather para unir colunas em uma nova.
# gather("nova coluna", "Coluna com a nota, "coluna1:coluna2")
df %>%
  gather(Regiao, NotaFinal, regiaoA:regiaoB)

?set.seed()
?runif()
set.seed(10)

# Criando um novo tratamento de dados
df2 <- data.frame(
  id = 1:4,
  acao = sample(rep(c('controle', 'tratamento'), each = 2)),
  work.t1 = runif(4),
  home.t1 = runif(4),
  work.t2 = runif(4),
  home.t2 = runif(4))

df2
# Reorganizando dados usando gather
# Quebrando o valor da coluna key em 2 colunas
df2_organizado <- df2 %>% gather(key, time, -id, -acao)
df2_organizado

# Quebrando o valor da coluna key em 2 colunas
df2_organizado2 <- df2_organizado %>% separate(key, into = c('localidade','tempo'))

df2_organizado2 %>% head(5) 

# exemplo 3
df3 <- data.frame(
  participante = c('p1','p2','p3','p4','p5','p6'),
  info = c("g1m","g1m","g1f","g2m","g2f","g2m"),
  day1score = rnorm(n = 6, mean = 60, sd = 10),
  day2score = rnorm(n = 6, mean = 40, sd = 5)
)

df3

# Organizando o dataframe e criando 2 colunas novas com o valor da coluna info.
df3 %>% gather(day, score, c(day1score:day2score)) %>%
  separate(col = info, into = c("group","gender"), sep = 2)


df3 %>%
  gather(day, score, c(day1score, day2score)) %>%
  separate(col = info, into = c("group", "gender"), sep = 2) %>%
  ggplot(aes(x = day, y = score)) + 
  geom_point() + 
  facet_wrap(~ group) +
  geom_smooth(method = "lm", aes(group = 1), se = F)

spread(df3,info, participante)

unite(df3,"new_column", info:participante, sep = "_", remove = F)
