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


