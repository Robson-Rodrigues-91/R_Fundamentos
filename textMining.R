# instalando as bibliotecas

install.packages(c("tm","SnowballC","worldcloud","RColorBrewer"))
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

#Carregando o dataset
df <- read.csv(file.choose(), stringsAsFactors = FALSE)
head(df)

# Criando corpus use sempre VCORPUS
dfCorpus <- VCorpus(VectorSource(df$Question))
class(dfCorpus)

# Convertendo o corpus em um documento de texto plano 
dfCorpus <- tm_map(dfCorpus, PlainTextDocument)

# Removendo pontuação
dfCorpus <- tm_map(dfCorpus, removePunctuation)

#Remover palavras especificas do ingles
dfCorpus <- tm_map(dfCorpus, removeWords, stopwords(kind = 'english'))

# Converter palavras similares que aparecem com muita frequencia no texto
dfCorpus <- tm_map(dfCorpus, stemDocument)

# Removendo palavras especificas
dfCorpus <- tm_map(dfCorpus, removeWords, c('the','this', stopwords(kind = 'en')))
length(dfCorpus)

#Crian a nuvem de palavras
wordcloud(dfCorpus, max.words = 500, random.order = FALSE)