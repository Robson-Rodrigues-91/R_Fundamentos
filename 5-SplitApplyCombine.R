# dividindo um data set em varios outros datasets

install.packages("plyr")
install.packages("gapminder")

library(plyr)
library(gapminder)

?ddply

head(gapminder)

df <- ddply(gapminder, 
            ~ continent,
            summarise,
            max_le = max(lifeExp))

levels(df$continent)
head(df)

new_df <- ddply(gapminder, 
                ~ continent, 
                summarise, 
                n_countries = length(unique(country)))
              
head(new_df)

new_data <- ddply(gapminder,
                  ~ continent,
                  summarise,
                  min = min(lifeExp),
                  max = max(lifeExp),
                  mean = mean(lifeExp))

head(new_data)

head(mpg)
df_car <- mpg[,c(1,7:9)]
df_car
?mpg

# Sumariar valores por combinação
data_car <- ddply(df_car,
                  .(manufacturer),
                  summarise,
                  median_cty = mean(cty),
                  median_hwy = mean(hwy))

head(data_car)

# Sumariar valores por combinação de variaveis
data_car_new <- ddply(df_car,
                  .(manufacturer, drv),
                  summarise,
                  median_cty = mean(cty),
                  median_hwy = mean(hwy))

head(data_car_new)

# Diferenca entre summarise e transform
ddply(df_car, .(drv), summarise, media_cty = mean(cty))
ddply(df_car, .(drv), transform, media_cty = mean(cty))