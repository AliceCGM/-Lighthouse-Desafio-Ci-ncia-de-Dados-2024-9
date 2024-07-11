sink("./dasefioR.txt", append = T)
library(tidyverse)
library(psych)
# Anlisando normalidade dos dados 
# import dados
describe(dados_rstudio$Gross, IQR = T)
describe(dados_rstudio$Runtime)
describe(dados_rstudio$IMDB)
describe(dados_rstudio$Meta_Score)

# Calcular a correlação de Pearson variáveis numéricas
cor_matrix <- cor(dados_rstudio %>% select(Runtime, IMDB , Meta_Score, Gross, No_of_Votes), use = "complete.obs")
print(cor_matrix)

# Relação entre as variáveis cateóricas e o orçamento 
kruskal.test(Gross ~ Certificate, data = dados_rstudio)
kruskal.test(Gross ~ Year, data = dados_rstudio)
kruskal.test(Gross ~ Genre, data = dados_rstudio)
kruskal.test(Gross ~ Director, data = dados_rstudio)
kruskal.test(Gross ~ Star1, data = dados_rstudio)
kruskal.test(Gross ~ Star2, data = dados_rstudio)
kruskal.test(Gross ~ Star3, data = dados_rstudio)
kruskal.test(Gross ~ Star4, data = dados_rstudio)

# Exploração de variáveis com alta correlação com o faturamento  
# Calcular as medianas de Gross para cada gênero
median_gross_per_genre <- aggregate(Gross ~ Genre, data = dados_rstudio, median)

# Ordenar os resultados por Gross
median_gross_per_genre <- median_gross_per_genre[order(-median_gross_per_genre$Gross), ]

# Mostrar os resultados
print(median_gross_per_genre)
#
# Calcular as medianas de Gross para cada Categoria
median_gross_per_catg <- aggregate(Gross ~ Certificate, data = dados_rstudio, median)

# Ordenar os resultados por Gross
median_gross_per_catg <- median_gross_per_catg[order(-median_gross_per_catg$Gross), ]

# Mostrar os resultados
print(median_gross_per_catg)
#
# Director positivo
#Calcular as medianas de Certificate para cada diretor
median_gross_per_Director <- aggregate(Gross ~ Director, data = dados_rstudio, median)

# Ordenar os resultados por Gross
median_gross_per_Director <- median_gross_per_Director[order(-median_gross_per_Director$Gross), ]

# Mostrar os resultados
print(median_gross_per_Director)

# Ator positivo
#Calcular as medianas de Certificate para cada ator principal
median_gross_per_Star1 <- aggregate(Gross ~ Star1, data = dados_rstudio, median)

# Ordenar os resultados por Gross
median_gross_per_Star1 <- median_gross_per_Star1[order(-median_gross_per_Star1$Gross), ]

# Mostrar os resultados
print(median_gross_per_Star1)

#Identificação de outlier
boxplot(dados_rstudio$Gross,main="Boxplot de Faturamento", ylab="Valores", horizontal = F)
outliers <- boxplot.stats(dados_rstudio$Gross)$out
outliers_ordenados <- sort(outliers, decreasing = TRUE)
# Exibir os outliers
print(outliers)
sink()
