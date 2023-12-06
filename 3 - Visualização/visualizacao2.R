# Instalação e carregamento de pacotes
install.packages("car")
installed.packages()
library(car)
library(dplyr)

# Carregamento do dataset mtcars e criação de um novo objeto 'carros' #
carros <- mtcars

# Gráfico de dispersão com linha de regressão #
plot(carros$wt, carros$mpg, main = "Gráfico de Dispersão",
     xlab = "Peso do Carro", ylab = "Milhas por galão", pch = 19)
abline(lm(mpg ~ wt, data = carros), col = "red")

# Salvando o gráfico de dispersão com linha de regressão em png #
png("grafico_mtcars1.png")
dev.off()

# Gráfico de barras verticais #
numero_carros <- table(carros$gear)
barplot(numero_carros,
        main = "Gráfico de Barras Verticais",
        xlab = "Engrenagens",
        ylab = "Quantidade de Carros",
        col = "blue")

# Salvando o gráfico de barras verticais em png #
png("grafico_mtcars2.png")
dev.off()

# Gráfico de barras horizontais #
barplot(numero_carros,
        main = "Gráfico de Barras Horizontais",
        horiz = TRUE,
        xlab = "Quantidade de Carros",
        ylab = "Engrenagens",
        col = "blue")

# Gráfico de barras horizontais #
barplot(numero_carros,
        main = "Gráfico de Barras Horizontais",
        horiz = TRUE,
        names.arg = c("3 engrenagens", "4 engrenagens", "5 engrenagens"),
        xlab = "Quantidade de Carros",
        ylab = "Engrenagens",
        col = "blue")

# Salvando o gráfico de barras horizontais em png #
png("grafico_mtcars3.png")
dev.off()

# Criando um dataframe com informações de alunos #
alunos <- data.frame(
  "Nome" = c("Alice", "Bob", "Charlie", "Diana", "Eva", "Fernanda", "Gabriel", "Helen", "Ian", "Julia"),
  "Idade" = c(20, 22, 21, 23, 19, 24, 20, 22, 21, 23),
  "Qtd_Livros" = c(10, 5, 8, 12, 6, 15, 9, 7, 11, 13),
  "Faculdade" = c("Engenharia", "Ciências da Computação", "Medicina", "Medicina", "Administração",
                  "Engenharia", "Engenharia", "Medicina", "Medicina", "Ciências da Computação")
)


# Quantidade de aluno em cada curso da faculdade #
engenharia <- alunos %>%
  filter(Faculdade == "Engenharia")
numero_alunos_eng <- length(engenharia$Nome)

ciencias_computacao <- alunos %>%
  filter(Faculdade == "Ciências da Computação")
numero_alunos_cp <- length(ciencias_computacao$Nome)

medicina <- alunos %>%
  filter(Faculdade == "Medicina")
numero_alunos_med <- length(medicina$Nome)


# Gráfico de pizza simples #
slices <- c(numero_alunos_eng, numero_alunos_cp, numero_alunos_med)
rotulos <- c("Engenharia", "Ciências da Computação", "Medicina")
pie(
  slices,
  labels = rotulos,
  main = "Alunos por Curso"
)

# Gráfico de pizza com porcentagem #
porcentagem <- round(slices/sum(slices) * 100)
rotulos <- paste(rotulos, porcentagem) #concatenando rótulos e porcentagem
rotulos <- paste(rotulos, "%", sep="") #incluindo o % no rótulo
pie(
  slices,
  labels = rotulos,
  col = rainbow(length(rotulos)),
  main = "Quantidade percentual de alunos por curso"
)

# Gráfico de Linha #

ano_temperatura <- data.frame(
  "Ano" = c("2014", "2015", "2016", "2017", "2018", "2019", "2020", "2021", "2022", "2023"),
  "Media_Temperatura" = c(25, 19, 35, 40, 20, 30, 25, 28, 30,38),
  stringsAsFactors = FALSE
)

plot(
  y = ano_temperatura$Media_Temperatura,
  x = ano_temperatura$Ano,
  type = "o",
  col = "blue",
  xlab = "Ano",
  ylab = "Temperatura",
  main = "Gráfico de Linha"
)

# Gráfico de boxplot #

boxplot(
  mpg~cyl,
  data = carros,
  main = "Gráfico de Boxplot",
  xlab = "Número de cilindros",
  ylab = "Milhas por galão",
  col = "blue"
)