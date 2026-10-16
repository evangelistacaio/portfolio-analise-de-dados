# 📊 Visão Gerencial: Projetos Musicais

**[🔗 Acessar o Dashboard Interativo](https://datastudio.google.com/reporting/ea540e26-7a40-4556-8245-022affcea47d)**

## 📌 Sobre o Projeto
Este projeto de Business Intelligence foi desenvolvido para fornecer uma visão gerencial do faturamento e engajamento de público de três projetos musicais (Cor dos Olhos, Bloco Baba de Camelo e Belchior - Alucina). O dashboard interativo permite o acompanhamento de KPIs financeiros e a tomada de decisão baseada em dados.

## 🛠️ Ferramentas e Tecnologias
- **Ferramenta de BI:** Looker Studio (antigo Google Data Studio)
- **Base de Dados:** Google Sheets / Excel
- **Processos:** ETL (Extração e Limpeza), Modelagem Visual, Cross-filtering e Criação de Medidas Calculadas.

## 📈 Indicadores Chave (KPIs) e Métricas Criadas
1. **Faturamento Total:** Cartão de visão geral exibindo a receita bruta consolidada (R$ 46.500,00).
2. **Desempenho por Projeto:** Agrupamento visual (`GROUP BY`) comparando o volume total de público por banda.
3. **Mapeamento Geográfico:** Gráfico de barras categorizando o faturamento por praça (cidade) com ordenação do maior para o menor.
4. **Ticket Médio (Medida Calculada):** Fórmula customizada (`SUM(cache) / SUM(publico_estimado)`) desenvolvida na própria ferramenta de BI para descobrir a rentabilidade real por espectador.

## 💡 Principais Insights de Negócio
- **Rentabilidade Oculta:** Apesar de o *Bloco Baba de Camelo* possuir o maior volume absoluto de público (7.500 pessoas), a métrica calculada de Ticket Médio revelou que a *Cor dos Olhos* é o projeto mais rentável por indivíduo, gerando **R$ 5,37 por pessoa** contra R$ 2,27 do Bloco.
- **Interatividade:** A aplicação de filtros cruzados (*cross-filtering*) e controles de período dinâmicos permite isolar rapidamente cenários, como o faturamento de **R$ 27.000,00** concentrado exclusivamente no ano de 2026.
