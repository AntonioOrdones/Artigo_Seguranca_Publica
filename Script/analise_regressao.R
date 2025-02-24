# 📌 Script para Diagnóstico do Modelo de Regressão
# Autor: ORDONES NETO, Antonio; RODRIGUES, Frederico Bertholini Santos.
# Data: 24 fev. 2025
# Objetivo: Gerar diagnósticos estatísticos e gráficos do modelo de regressão

# Carregar pacotes necessarios
library(car)
library(ggplot2)
library(boot)
library(MASS)
library(stargazer)
library(ggpubr)
library(lmtest)
library(nortest)
library(olsrr)
library(readr)  # Para melhor compatibilidade na leitura do CSV

# 📥 Solicitar ao usuário que faça o upload do arquivo
cat("Selecione o arquivo CSV contendo os dados tratados\n")
arquivo <- file.choose()  # Abre uma janela para seleção do arquivo

# 🔄 Carregar os dados sem especificar caminho fixo
dados <- read_csv2(arquivo)  # Usa `read_csv2()` porque os dados têm separador `;`

# 🔍 Ajustar tipos de dados, convertendo vírgulas para pontos (se necessário)
dados$RENDA <- as.numeric(gsub(",", ".", dados$RENDA))
dados$INTERNET <- as.numeric(gsub(",", ".", dados$INTERNET))
dados$CCP <- as.numeric(gsub(",", ".", dados$CCP))
dados$INSEGURANÇA <- as.numeric(gsub(",", ".", dados$INSEGURANÇA))

# Aplicar transformacoes nos dados
dados$log_RENDA <- log(dados$RENDA)
dados$CCP_mil <- dados$CCP * 1000

# Especificar o modelo de regressao linear
modelo <- lm(INSEGURANÇA ~ INTERNET + log_RENDA + CCP_mil, data = dados)

# Resumo do modelo
summary(modelo)

# Tabela de regressao em texto
stargazer(modelo, type = "text")

# Tabela de regressao em formato LaTeX
stargazer(modelo, type = "latex", title = "Tabela de Regressao")

# Tabela de regressao em HTML
stargazer(modelo, type = "html", title = "Tabela de Regressao", out = "tabela_regressao.html")

# Diagnostico de colinearidade
vif(modelo)  # Estatisticas de VIF

# Estatisticas de residuos
durbinWatsonTest(modelo)  # Teste de Durbin-Watson para autocorrelacao

# Teste de normalidade dos residuos
shapiro.test(resid(modelo))  # Teste de Shapiro-Wilk
ks.test(resid(modelo), "pnorm", mean = mean(resid(modelo)), sd = sd(resid(modelo)))  # Teste de Kolmogorov-Smirnov

# Teste de heterocedasticidade
bptest(modelo)  # Teste de Breusch-Pagan

# Teste de especificacao do modelo (Ramsey RESET)
resettest(modelo, power = 2, type = "fitted")

# Histogramas dos residuos
hist(resid(modelo), main = "Histograma dos Residuos", xlab = "Residuos", breaks = 20, col = "lightblue")

# Q-Q Plot dos residuos
qqPlot(modelo, main = "Q-Q Plot dos Residuos")

# Diagnostico de influencia
influencePlot(modelo)

# Distancia de Cook
cooksd <- cooks.distance(modelo)
dados$cooksd <- cooksd
ggplot(dados, aes(x = 1:nrow(dados), y = cooksd)) +
  geom_point() +
  geom_hline(yintercept = 1, col = "red") +
  labs(title = "Distancia de Cook", x = "Observacao", y = "Cooks Distance")

# Alavancagem (Leverage)
hatvalues <- hatvalues(modelo)
dados$leverage <- hatvalues
ggplot(dados, aes(x = 1:nrow(dados), y = leverage)) +
  geom_point() +
  geom_hline(yintercept = 2 * (length(coef(modelo)) / nrow(dados)), col = "red") +
  labs(title = "Alavancagem", x = "Observacao", y = "Leverage")

# Residuos x Valores Ajustados
plot(modelo$fitted.values, resid(modelo), main = "Residuos vs Valores Ajustados",
     xlab = "Valores Ajustados", ylab = "Residuos", pch = 16, col = "blue")
abline(h = 0, lty = 2)

# Bootstrap para estimativas dos coeficientes
boot_fn <- function(data, indices) {
  modelo_boot <- lm(INSEGURANÇA ~ INTERNET + log_RENDA + CCP_mil, data = data[indices, ])
  return(coef(modelo_boot))
}
set.seed(123)
resultados_boot <- boot(data = dados, statistic = boot_fn, R = 5000)

# Intervalos de confianca dos coeficientes via bootstrap
boot.ci(resultados_boot, type = "perc")

# Graficos dos coeficientes estimados
coef_df <- data.frame(Variavel = names(coef(modelo)), Coeficiente = coef(modelo))
ggplot(coef_df, aes(x = Variavel, y = Coeficiente)) +
  geom_bar(stat = "identity", fill = "blue", alpha = 0.7) +
  theme_minimal() +
  labs(title = "Coeficientes Estimados", x = "Variaveis", y = "Coeficiente")

# Boxplot dos residuos
ggplot(dados, aes(y = resid(modelo))) +
  geom_boxplot(fill = "lightblue") +
  theme_minimal() +
  labs(title = "Boxplot dos Residuos", y = "Residuos")

# Combinacao de graficos
ggarrange(
  ggplot(dados, aes(x = modelo$fitted.values, y = resid(modelo))) +
    geom_point() +
    geom_hline(yintercept = 0, linetype = "dashed", color = "red") +
    theme_minimal() +
    labs(title = "Residuos vs Valores Ajustados", x = "Valores Ajustados", y = "Residuos"),
  ggplot(coef_df, aes(x = Variavel, y = Coeficiente)) +
    geom_bar(stat = "identity", fill = "blue", alpha = 0.7) +
    theme_minimal() +
    labs(title = "Coeficientes Estimados", x = "Variaveis", y = "Coeficiente"),
  ncol = 2
)

# 📥 Salvar relatório do diagnóstico
sink("diagnostico_modelo.txt")
cat("### 📊 Diagnóstico do Modelo de Regressão ###\n\n")
print(summary(modelo))
print("\n---\n")
print("Teste de Colinearidade (VIF):")
print(vif(modelo))
print("\n---\n")
print("Teste de Normalidade (Shapiro-Wilk):")
print(shapiro.test(resid(modelo)))
print("\n---\n")
print("Teste de Heterocedasticidade (Breusch-Pagan):")
print(bptest(modelo))
print("\n---\n")
print("Teste de Autocorrelação dos Resíduos (Durbin-Watson):")
print(durbinWatsonTest(modelo))
print("\n---\n")
print("Teste de Especificação do Modelo (RESET):")
print(resettest(modelo, power = 2, type = "fitted"))
sink()
