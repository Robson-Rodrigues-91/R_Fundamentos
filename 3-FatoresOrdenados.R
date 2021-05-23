# Praticando Fatores

vec1 <- c("Macho","Femea","Macho","Femea","Macho","Femea","Macho","Femea")
fat_vec1 <- factor(vec1)
fat_vec1
class(vec1)
class(fat_vec1)


# Variaveis categoricas Nominais 
# Possuem uma ordem Implicita
animais <- c("Macaco","Tigre","Elefante","Formiga","Leão")
animais
fac_animais <- factor(animais)
fac_animais
class(fac_animais)
levels(fac_animais)

# Variaveis categoricas ordinais 
# Possuem uma ordem natural
grad <- c("Bacharelado", "Pos Graduação", "Mestrado", "Doutorado","Pos Graduação","Pos Graduação","Pos Graduação")
grad
fac_grad <- factor(grad, order = TRUE, levels = c("Dontorado","Mestrado","Pos Graduação","Bacharelado"))
fac_grad
class(fac_grad)
levels(fac_grad)

#Sumarizar os dados fornece uma visão geral sobre o conteudo
summary(fac_grad)
summary(grad)

# Transformar um vetor em uma tabela fator, fica mais facil de trabalhar com categorização de dados através 
# da function factor()

#Tratamento dos dados para uma possivel classificação
vec2 <-c("M","F","M","F","M","F","M","F","M","F","M","F","M","F","M","F")
vec2
fat_vec2 <- factor(vec2)
fat_vec2
levels(fat_vec2) <- c("Femea","Macho")
data_vec2 = factor(fat_vec2, labels=c("Feminino","Masculino"))
fat_vec2
data_vec2
summary(vec2)
summary(fat_vec2)
summary(data_vec2)

# Fatores não ordenados
set1 <- c("AA","B","CA","CB","CC","AA","B","CA","CB","CC","AA","B","CA","CB","CC")
set1
fac_set1 <- factor(set1)
fac_set1
class(fac_set1)
is.ordered(fac_set1)

# Criando uma ordenação do vetor 
ord_fac_set1 <- factor(set1, levels = c("CA","CB","AA","B"),ordered = TRUE)
ord_fac_set1

# Importando dataframe -> etnias.csv
df <- read.csv2(file.choose(), sep=',')
df
str(df)
levels(df$Etnia)
summary(df$Etnia)

plot(df$Idade~df$Etnia, xlab = "Etnia", ylab="Idade",main="Teste")

# CRiando uma nova coluna com o fator de Estado civil
df$Estado_Civil.cat <- factor(df$Estado_Civil, labels=c("Solteiro","Casado","Divorciado"))
df

 