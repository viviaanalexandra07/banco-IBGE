-- 1. Criação do Banco de Dados
CREATE DATABASE IF NOT EXISTS economia_brasil;
USE economia_brasil;

-- 2. Tabela de Regiões / Nível Geográfico (Nacional, Estadual ou Municipal)
CREATE TABLE IF NOT EXISTS regioes (
    id_regiao INT AUTO_INCREMENT PRIMARY KEY,
    sigla VARCHAR(10) NOT NULL UNIQUE, -- Ex: 'BR', 'PR', 'SP'
    nome VARCHAR(100) NOT NULL         -- Ex: 'Brasil', 'Paraná', 'São Paulo'
);

-- 3. Tabela de Indicadores Econômicos
CREATE TABLE IF NOT EXISTS indicadores (
    id_indicador INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,        -- Ex: 'PIB', 'IPCA (Inflação)', 'Taxa Selic', 'Dólar Comercial'
    unidade_medida VARCHAR(20) NOT NULL, -- Ex: '%', 'R$', 'US$', 'Bilhões R$'
    descricao TEXT                     -- Breve explicação do indicador
);

-- 4. Tabela de Dados Econômicos (Fatos / Séries Temporais)
CREATE TABLE IF NOT EXISTS dados_economicos (
    id_dado INT AUTO_INCREMENT PRIMARY KEY,
    id_indicador INT NOT NULL,
    id_regiao INT NOT NULL,
    data_referencia DATE NOT NULL,     -- Data de apuração do dado (ex: '2026-01-01')
    valor DECIMAL(15, 4) NOT NULL,     -- Valor numérico do indicador
    CONSTRAINT fk_indicador FOREIGN KEY (id_indicador) REFERENCES indicadores(id_indicador),
    CONSTRAINT fk_regiao FOREIGN KEY (id_regiao) REFERENCES regioes(id_regiao)
);

-- ==========================================
-- POPULANDO COM DADOS DE EXEMPLO
-- ==========================================

-- Inserindo Regiões
INSERT INTO regioes (sigla, nome) VALUES 
('BR', 'Brasil'),
('PR', 'Paraná'),
('SP', 'São Paulo');

-- Inserindo Indicadores
INSERT INTO indicadores (nome, unidade_medida, descricao) VALUES 
('Taxa Selic', '% ao ano', 'Taxa básica de juros da economia brasileira definida pelo Copom.'),
('IPCA', '% ao mês', 'Índice Nacional de Preços ao Consumidor Amplo, mede a inflação oficial.'),
('PIB', 'Bilhões R$', 'Produto Interno Bruto - Soma de todas as riquezas produzidas.');

-- Inserindo Dados Históricos de Exemplo
INSERT INTO dados_economicos (id_indicador, id_regiao, data_referencia, valor) VALUES 
(1, 1, '2026-01-01', 11.25), -- Taxa Selic no Brasil em Jan/2026
(2, 1, '2026-01-01', 0.45),  -- IPCA no Brasil em Jan/2026
(3, 1, '2025-12-01', 11500.50); -- PIB estimado do Brasil
