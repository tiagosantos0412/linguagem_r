# Instalação do pacote dplyr #
install.packages("dplyr")
# Chamar o pacote #
library(dplyr)

# Aplicação - Exemplo de Data Frame #

exemplo <- data.frame("nome" = c("Tiago", "Viviane", "Giovana", "Cristiano"),
                      "idade" = c(36, 26, 20, 19),
                      "qtd_livros" = c(1, 10, 4, 3),
                      "curso_universitario" = c("Análise e Desenvolvimento de Sistemas", "Enfermagem", "Farmácia", "Engenharia"))

# Filtrando linhas #
engenharia <- exemplo %>%
              filter(curso_universitario == "Engenharia")

exemplo %>%
  filter(curso_universitario == "Enfermagem")

# Utilizando operações matemáticas nos dados filtrados #

# Calculando a média da idade #
exemplo %>%
  mutate(media_idade = mean(idade))

dados_filtrados <- exemplo %>%
                    #filter(curso_universitario == "Enfermagem") %>% # Realizando o filtro por curso #
                    mutate(media_idade = mean(idade)) %>% # calculando a média das idades #
                    select(nome, curso_universitario, idade, media_idade) # selecionando as colunas desejadas para a exibição #

# Agrupando colunas com Group By #
exemplo %>%
  group_by(curso_universitario) %>%
  tally()



