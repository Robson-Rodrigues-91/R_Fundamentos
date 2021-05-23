# Trabalhando para subsetting

# Atomicidade -> 

# Criando um df com numeros aleatorios
x <- rnorm(5)

# Nomeando as colunas com letras do alfabeto
dt_nomeado <- setNames(x,letters[1:5])
dt_nomeado

# Criando uma matrix
mat <- matrix(data = 1:9, nrow = 3)
colnames(mat) <- c(letters[1:3])
mat[,1:2]
mat[1:2,]

# outer -> faz com que uma matriz tenha o mesmo comportamento de um vetor
vetores <- outer(1:5, 1:5 , FUN = 'paste', sep = ',')
vetores
vetores[c(1,4)]

# Acessando niveis de elementos

head(mtcars)
var <- "wt"

mtcars$var
mtcars[[var]]

# Criando um vetor com numeros divisiveis por 2 

vetor <- 1:10 %% 2 == 0
vetor
valores <- which(vetor)
valores

vetor2 <- 1:50 %% 5 == 0
vetor2

valores2 <- which(vetor2)
valores2

intersect(vetor, vetor2) # Verifica os padrões dos vetores
union(vetor, vetor2) # une as informações 
setdiff(vetor, vetor2) # Faz uma comparação logica e tras os valores diferentes.