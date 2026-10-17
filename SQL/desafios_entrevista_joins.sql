-- ============================================================================
-- PORTFÓLIO DE ANÁLISE DE DADOS: DESAFIOS TÉCNICOS DE SQL (JOINS E AGREGAÇÕES)
-- Cenário: Auditoria financeira e comercial de uma plataforma de ingressos
-- ============================================================================

-- 1. RELATÓRIO DE RECEITA POR EVENTO (INNER JOIN + GROUP BY)
-- Objetivo: Calcular o faturamento bruto consolidado por evento, ordenando dos mais lucrativos para os menos lucrativos.

SELECT
    eventos.nome_evento, 
    SUM(vendas.qtd_ingressos * vendas.valor_unitario) AS receita_total
FROM eventos
INNER JOIN vendas 
    ON eventos.id_evento = vendas.id_evento
GROUP BY eventos.nome_evento
ORDER BY receita_total DESC;


-- 2. FILTRO DE META EXECUTIVA (CLÁUSULA HAVING)
-- Objetivo: Filtrar apenas os eventos de alta performance cujo faturamento somado ultrapassou a meta de R$ 50.000,00.

SELECT
    eventos.nome_evento, 
    SUM(vendas.qtd_ingressos * vendas.valor_unitario) AS receita_total
FROM eventos
INNER JOIN vendas 
    ON eventos.id_evento = vendas.id_evento
GROUP BY eventos.nome_evento
HAVING SUM(vendas.qtd_ingressos * vendas.valor_unitario) > 50000
ORDER BY receita_total DESC;


-- 3. AUDITORIA DE EVENTOS SEM VENDAS (LEFT ANTI-JOIN)
-- Objetivo: Identificar eventos cadastrados no sistema que possuem ZERO vendas registradas para ações emergenciais de marketing.

SELECT
    eventos.nome_evento,
    eventos.cidade
FROM eventos
LEFT JOIN vendas
    ON eventos.id_evento = vendas.id_evento
WHERE vendas.id_evento IS NULL;
