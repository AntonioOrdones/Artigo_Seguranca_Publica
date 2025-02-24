# 📂 Dados Tratados - Projeto Segurança Pública

## 📌 Sobre esta pasta
Esta pasta contém os arquivos de dados processados para análise do estudo sobre a percepção de insegurança no Distrito Federal. Os dados foram tratados e organizados para garantir qualidade na análise estatística.

## 📄 Arquivo disponível
- **`Dados.csv`** → Contém os dados tratados utilizados na regressão e análises estatísticas.

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
