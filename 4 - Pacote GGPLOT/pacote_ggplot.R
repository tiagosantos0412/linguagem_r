# instalando a biblioteca GGPLOT 2 e tidyverse #
install.packages("ggplot2")
install.packages("tidyverse")

# https://www.r-graph-gallery.com/ggplot2-package.html #

# Carregando os pacotes para o ambiente R #
library(ggplot2)
library(tidyverse)
library(car)

# Criando um dataframe com informações de alunos #
alunos <- data.frame(
  "Nome" = c("Alice", "Bob", "Charlie", "Diana", "Eva", "Fernanda", "Gabriel", "Helen", "Ian", "Julia"),
  "Idade" = c(20, 22, 21, 23, 19, 24, 20, 22, 21, 23),
  "Qtd_Livros" = c(10, 5, 8, 12, 6, 15, 9, 7, 11, 13),
  "Faculdade" = c("Engenharia", "Ciências da Computação", "Medicina", "Medicina", "Administração",
                  "Engenharia", "Engenharia", "Medicina", "Medicina", "Ciências da Computação")
)

#########
# Histograma - Mesma cor #
ggplot(alunos, aes(x = Faculdade))+
  geom_bar(stat = "count", fill = "#ff6666")+
  xlab("Cursos")+
  ylab("Quantidade total de alunos")

#########
# Histograma com cores para cada classe (automático) #
ggplot(alunos, aes(x = Faculdade, fill = Faculdade)) +
  geom_bar(stat = "count") + 
  xlab("Faculdade") + 
  ylab("Quantidade total de alunos") #+ guides(fill=FALSE)


#########
# Histograma com cores para cada classe (manual) #
ggplot(alunos, aes(x = Faculdade, fill = Faculdade)) +
  geom_bar(stat = "count") + 
  xlab("Cursos") + 
  ylab("Quantidade total de alunos") +
  scale_fill_manual("Legenda", values = c("Administração" = "#BDB76B", "Ciências da Computação" = "#DAA520", "Engenharia" = "#B8860B", "Medicina" = "#8B4513")) +
  labs(title = "Histograma") + 
  theme_bw() + 
  theme(plot.title = element_text(hjust = 0.5))

#########
# Histograma Horizontal
ggplot(data = alunos, aes(x = Faculdade, fill = Faculdade)) +
  geom_bar(stat = "count") + 
  coord_flip() +
  xlab("Cursos") +
  ylab("Quantidade total de alunos") +
  ggtitle("Histograma Horizontal") +
  theme_dark() + 
  theme(plot.title = element_text(hjust = 0.5))

#########
# Criando um Data Frame com dados de cilindros de carros #
mtcars$cyl <- as.factor(mtcars$cyl)
# Gráfico de pontos com regressão $ #
ggplot(mtcars, aes(x=wt, y=mpg)) +
  geom_point(shape = 18, color = "blue") +
  geom_smooth(method = lm, color = "darkred") +
  labs(title = "Gráfico de pontos")
# Gráfico de pontos por classe e com cores #
ggplot(mtcars, aes(x=wt, y=mpg, shape=cyl, color=cyl)) +
  geom_point() +
  labs(title = "Gráfico de pontos") +
  scale_color_brewer(palette = "Dark2")

#########
#Gráfico de pizza basico #
ggplot(alunos, aes(x="", fill=Faculdade)) +
  geom_bar(stat = "count", width = 1) +
  coord_polar("y", start = 0)

ggplot(alunos, aes(x="", fill=Faculdade)) +
  geom_bar(stat = "count", width = 1, color = "white") +
  coord_polar("y", start = 0) +
  theme_void() +
  labs(title = "Gráfico de Pizza")

#########
# Gráfico de pizza completo #
# Calculando quantos estudantes há em cada curso #
count.data <- alunos %>%
              count(Faculdade)
# Realizando a soma acumulativa dos dados e criando rotulos #
alunos_2 <- count.data %>%
  mutate(Faculdade = factor(Faculdade, levels = c("Administração", "Ciências da Computação", "Engenharia", "Medicina")),
         soma_acumulativa = cumsum(n),
         midpoint = soma_acumulativa - n / 2,
         label = paste0(round(n / sum(n) * 100, 1), "%"))

#Gráfico de pizza com rótulos #
ggplot(alunos_2, aes(x = 1, weight = n, fill = Faculdade)) +
  geom_bar(width = 1, position = "stack") +
  coord_polar(theta = "y") +
  geom_text(aes(x = 1.3, y = midpoint, label = label)) +
  scale_fill_brewer(palette="Set1") +  theme_void() +#
  labs(title = "Gráfico de pizza com rótulos") + 
  theme(plot.title = element_text(hjust = 0.5)) + # centralizando título
  labs(fill='Cursos') 



