-- ============================================================================
-- PORTFÓLIO DE ANÁLISE DE DADOS: WINDOW FUNCTIONS (ROW_NUMBER & PARTITION BY)
-- Cenário: Ranking regional de performance de público
-- ============================================================================

-- RANKING DE PÚBLICO POR CIDADE
-- Objetivo: Identificar qual foi o show de maior público dentro de cada cidade,
-- reiniciando a contagem a cada praça diferente.

SELECT 
    cidade, 
    projeto, 
    publico_estimado,
    ROW_NUMBER() OVER (
        PARTITION BY cidade
        ORDER BY publico_estimado DESC
    ) AS ranking_cidade
FROM agenda_shows
ORDER BY cidade ASC, ranking_cidade ASC;
