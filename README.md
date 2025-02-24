Documentação do Repositório GitHub para Reprodução do Estudo

1. Introdução

Este repositório contém o código R e os dados utilizados no estudo sobre percepção de insegurança no Distrito Federal. O objetivo é disponibilizar o material para que outros pesquisadores possam reproduzir e validar os resultados. O repositório segue as boas práticas da ciência da computação e da ciência aberta, promovendo transparência e reprodutibilidade.

2. Estrutura do Repositório

O repositório está organizado da seguinte forma:

/Artigo_Seguranca_Publica
│-- /Dados                   # Dados brutos e tratados
│   ├── dados_tratados.csv
│-- /Script                # Código em R para análise dos dados
│   ├── analise_regressao.R
│-- /Documentos              # Documentos do modelo
│   ├── diagnostico_modelo.txt
│   ├── tabela_regresão.htlm
│   ├── referencias_bibliograficas.txt  # Referências utilizadas no estudo
│   ├── metodologia.pdf
│-- README.md
│-- LICENSE                 # Licença de uso


3. Requisitos para Execução do Código

Para executar os scripts R corretamente, é necessário instalar os seguintes pacotes:

install.packages(c("car", "ggplot2", "boot", "MASS", "stargazer", "ggpubr", "lmtest", "nortest", "olsrr"))

Além disso, é recomendado utilizar a versão mais recente do R e do RStudio para evitar problemas de compatibilidade.

4. Como Reproduzir a Análise

Clone o repositório para sua máquina:

git clone (https://github.com/AntonioOrdones/Artigo_Seguranca_Publica)

Acesse a pasta do projeto:

cd Artigo_Seguranca_Publica

Abra o arquivo analise_regressao.R no RStudio e execute as linhas de código para processar os dados e gerar os resultados.

Verifique os diagnósticos do modelo executando diagnosticos_modelo.R.

5. Licenciamento e Direitos Autorais

Este repositório está licenciado sob a MIT License, permitindo uso e modificação do código, desde que seja dado o devido crédito aos autores originais.

6. Contato

Caso tenha dúvidas ou sugestões, entre em contato pelo e-mail: ordones.antonio@aluno.unb.br ou abra uma Issue neste repositório.

7. Publicação no Zenodo

Este repositório está vinculado ao Zenodo, o que permite gerar um DOI permanente para referência acadêmica. Após a publicação, o DOI correspondente será disponibilizado aqui.

8. Citação do Trabalho

Se você utilizar os dados ou códigos deste repositório, por favor cite da seguinte forma:

Ordones Neto, A., & Rodrigues, F. B. S. (2025). Código R para Análise da Percepção de Insegurança no Distrito Federal (v1.0.0). Zenodo. https://doi.org/10.5281/zenodo.14917404
