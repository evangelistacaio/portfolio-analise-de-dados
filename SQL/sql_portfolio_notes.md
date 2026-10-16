# Conceitos Avançados de SQL: Funções de Janela (Window Functions) & CTEs

Este repositório contém exemplos práticos de consultas SQL avançadas usando Funções de Janela (`OVER`, `PARTITION BY`, `RANK`) e Expressões de Tabela Comum (CTEs), aplicadas a um banco de dados real de gerenciamento de eventos (`agenda_shows`).

## 1. Função de Janela Básica: Ranking Global

Calcula o ranking de uma coluna específica sem agregar (esmagar) as linhas.

```sql
SELECT 
  projeto, 
  cidade, 
  publico_estimado,
  RANK () OVER (ORDER BY publico_estimado DESC) AS ranking_publico 
FROM agenda_shows;
```

**Objetivo:** Ranqueia todos os shows com base no público estimado, do maior para o menor, mantendo todos os dados individuais de cada show visíveis.

## 2. Função de Janela Particionada: Ranking por Categoria

Reinicia o cálculo do ranking toda vez que uma categoria específica muda.

```sql
SELECT 
  projeto, 
  cidade, 
  publico_estimado, 
  RANK () OVER (PARTITION BY projeto ORDER BY publico_estimado DESC) AS ranking_publico 
FROM agenda_shows;
```

**Objetivo:** Cria um ranking de público separado para *cada* projeto musical. O ranking volta para 1 sempre que o nome do `projeto` muda.

## 3. Soma Acumulada (Running Total)

Calcula uma soma acumulada linha por linha dentro de uma categoria específica.

```sql
SELECT 
  projeto, 
  cidade, 
  cache,
  SUM(cache) OVER (PARTITION BY projeto ORDER BY ano ASC) AS faturamento_acumulado
FROM agenda_shows;
```

**Objetivo:** Mostra o faturamento acumulado (`cache`) de cada projeto em ordem cronológica, zerando a soma para um novo projeto.

## 4. CTE + Função de Janela: Top N por Categoria

O padrão de mercado para filtrar os melhores resultados de um cálculo de Função de Janela.

```sql
WITH RankCache AS (
    SELECT
      projeto,
      cidade,
      cache,
      RANK () OVER (PARTITION BY projeto ORDER BY cache DESC) AS ranking_financeiro
    FROM agenda_shows
)

SELECT
  projeto,
  cidade,
  cache
FROM RankCache
WHERE ranking_financeiro = 1;
```

**Objetivo:** Extrai apenas o show com o maior cachê (Ranking 1) de cada projeto musical individualmente. A CTE cria uma tabela temporária para calcular o ranking, e a consulta externa (SELECT final) faz o filtro.
