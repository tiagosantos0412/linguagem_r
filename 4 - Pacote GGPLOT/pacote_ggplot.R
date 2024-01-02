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