-- ============================================================================
-- PORTFÓLIO DE ANÁLISE DE DADOS: CONSULTAS COMPLEXAS (SUBQUERIES E CTES)
-- Cenário: Análise de discrepância e performance de cachês de eventos
-- ============================================================================

-- 1. COMPARAÇÃO COM A MÉDIA GERAL (CTE Simples)
-- Objetivo: Identificar eventos de alta performance que faturaram acima da 
-- média global de cachês de toda a produtora.

WITH TabelaMediaGeral AS (
    SELECT AVG(cache) AS valor_medio
    FROM agenda_shows
)
SELECT 
    projeto,
    cidade,
    cache
FROM agenda_shows
WHERE cache > (SELECT valor_medio FROM TabelaMediaGeral)
ORDER BY cache DESC;


-- 2. COMPARAÇÃO COM A MÉDIA POR SEGMENTO (CTE + INNER JOIN)
-- Objetivo: Identificar eventos que faturaram acima da média da sua respectiva 
-- cidade, evitando comparações injustas entre praças com custos operacionais 
