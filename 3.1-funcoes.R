# tipos de funcoes

#funcoes built-in
#sqrt()
#class()
#abs()
#prod()
#rec()
#sum()
#mean()


# Tudo em R são funções.

# Função anonima, não possui nome mesmo assim continua sendo um objeto.

calcula <- function(x){
  total = x + x
  return(total)
}

calcula(10)

# Calcula a raiz quadrada
raizQuadrada <- function(x){
  total = sqrt(x)
  return(total)
}
class(raizQuadrada)
raizQuadrada(25)

potencia <- function(x,y){
  total = x ^ y
  return(total) 
}
potencia(2,10)

#Criando um dataframe
dataframefunc <- function(...){
  df = data.frame(cbind(...))
  print(df)
}

vec1 <- c("a","b","c","d")
vec2 <- c(2,3,4,5,6,7)

dataframefunc(vec2)
dataframefunc(vec2,vec1)

# Medindo o tempo de execução da função.
system.time(potencia(2,100000))
