# Coletando dados em R

install.packages('ggplot2')
install.packages('ggmap')
install.packages("downloader")

library(ggplot2)
library(ggmap)
library(downloader)

# Caminho do arquivo
path <- "C:/Users/Robso/Documents/DataScienseAcademy/01. Big Data Analytics com R e Microsoft Azure Machine Learning/Datasets/Parte 3/crimes.zip"
arquivo <- "crimes_funcionais.zip"
download(path, arquivo)
unzip("C:/Users/Robso/Documents/DataScienseAcademy/01. Big Data Analytics com R e Microsoft Azure Machine Learning/Datasets/Parte 3/crimes.zip")


# Criando um dataframe

df <- read.csv('crimes.txt')
head(df)

str(df)
dim(df)

# Criando um plot em mapa
mapa <- qmap("seattle", zoom = 11, source = "stamen",
             maptype = 'toner', darken = c(.3,"#BBBBBB"))

mapa

# Mapeando os dados
grafico <- geom_point(data = df, aes(x = Longitude, y = Latitude))


# Mapeando os dados e ajustando a escala
escala <- geom_point(data = df, aes(x = Longitude, y = Latitude), 
                     color = 'dark green', alpha = .03, size = 1.1)

# Mapeando os dados definindo uma camada de intensidade
intensidade <- stat_density2d(data = df,
                              aes(x = Longitude, 
                                  y = Latitude, 
                                  color = ..density..,
                                  size = ifelse(..density..<=1,0,..density..),
                                  alpha = ..density..), geom = "tile", contour = F) + 
scale_color_continuous(low = 'orange', high = 'red', guide = 'none') +
scale_size_continuous(range = c(0,3), guide = 'none') + 
scale_alpha(range = c(0,5), guide = "none") + 
ggtitle("Crimes in Seattle city") + 
theme(plot.title = element_text(family = "Trebuchet MS", size = 15, face = 'bold', hjust = 0,1))

# Grafico básico
ggplot() + grafico

# Gráfico com formatação
ggplot() + grafico + escala + intensidade