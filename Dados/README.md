# 📂 Dados Tratados - Projeto Segurança Pública

## 📌 Sobre esta pasta
Esta pasta contém os arquivos de dados processados para análise do estudo sobre a percepção de insegurança no Distrito Federal. Os dados foram tratados e organizados para garantir qualidade na análise estatística.

## 📄 Arquivo disponível
- **`Dados.csv`** → Contém os dados tratados utilizados na regressão e análises estatísticas.

## 🌍 Dados Originais
Os dados tratados foram obtidos a partir das seguintes fontes públicas:

- 🔗 [Secretaria de Segurança Pública do DF](https://www.ssp.df.gov.br/dados-por-regiao-administrativa/.)
- 🔗 [Pesquisa ObservaDF](https://observadf.unb.br/dados/)
- 🔗 [IPEDF - Pesquisa Distrital por Amostra de Domicílios](https://www.ipe.df.gov.br/pdad-2021-3/)
- 🔗 [IPEDF - Pesquisa de Emprego e Desemprego no Distrito Federal](https://www.ipe.df.gov.br/wp-content/uploads/2018/02/Boletim-PED-DF_Maio_2023.pdf)
- 🔗 [IBGE - Censo Brasileiro de 2022](https://www.ibge.gov.br/estatisticas/sociais/trabalho/22827-censo-demografico-2022.html)
- 🔗 [FBSP - 17o Anuário Brasileiro de Segurança Pública](https://forumseguranca.org.br/wp-content/uploads/2023/07/anuario-2023.pdf)

## 🏷️ Estrutura do arquivo `Dados.csv`
O arquivo `Dados.csv` contém as seguintes colunas:

| Coluna         | Descrição |
|---------------|-----------|
| `RA`          | Região Administrativa do Distrito Federal |
| `CCP`         | Crimes contra o patrimônio |
| `INTERNET`    | Percentual da população com acesso à internet |
| `RENDA`       | Renda média mensal per capita da população (em reais) |
| `INSEGURANÇA` | Índice de percepção de insegurança (escala de 0 a 1) |

## 🔍 Exemplo de Dados
| RA           | CCP  | INTERNET | RENDA   | INSEGURANÇA |
|-------------|------|----------|---------|-------------|
| Águas Claras | 0.005 | 0.782    | 5772.25 | 0.642       |
| Arniqueira   | 0.005 | 0.719    | 2706.46 | 0.579       |
| Brazlândia   | 0.005 | 0.503    | 1186.97 | 0.632       |

## 🛠️ Como usar os dados
Os dados podem ser carregados no R da seguinte forma:

```r
dados <- read.csv("data/processed/Dados.csv", sep = ";", header = TRUE, stringsAsFactors = FALSE)

⚠️ Observações

Os valores decimais estão separados por vírgula (,), caso necessário, substitua por ponto (.) ao carregar no software de análise.
A coluna CCP foi normalizada para representar crimes por mil habitantes.
📧 Para dúvidas ou sugestões, entre em contato!
