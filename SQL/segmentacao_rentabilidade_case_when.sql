-- ============================================================================
-- PORTFÓLIO DE ANÁLISE DE DADOS: LÓGICA CONDICIONAL E SEGMENTAÇÃO (CASE WHEN)
-- Cenário: Classificação de portfólio de eventos por Tier de Rentabilidade
-- ============================================================================

-- 1. CLASSIFICAÇÃO INDIVIDUAL DE EVENTOS (CASE WHEN)
-- Objetivo: Categorizar cada show da agenda em faixas de rentabilidade (Alta, Média, Baixa) de acordo com o cachê.

SELECT
    projeto,
    cidade,
    cache,
    CASE
        WHEN cache >= 10000 THEN 'Alta Rentabilidade'
        WHEN cache >= 5000 THEN 'Média Rentabilidade'
        ELSE 'Baixa Rentabilidade'
    END AS faixa_rentabilidade
FROM agenda_shows
ORDER BY cache DESC;


-- 2. VISÃO EXECUTIVA CONSOLIDADA POR FAIXA (CASE WHEN + GROUP BY)
-- Objetivo: Contabilizar o volume total de shows e o faturamento acumulado dentro de cada tier de rentabilidade.

SELECT
    CASE
        WHEN cache >= 10000 THEN 'Alta Rentabilidade'
        WHEN cache >= 5000 THEN 'Média Rentabilidade'
        ELSE 'Baixa Rentabilidade'
    END AS faixa_rentabilidade,
    COUNT(*) AS total_de_shows,
    SUM(cache) AS faturamento_da_faixa
FROM agenda_shows
GROUP BY faixa_rentabilidade
ORDER BY faturamento_da_faixa DESC;
