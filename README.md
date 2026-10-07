
# Banco de Dados: Economia Brasil

## Visão Geral
Schema SQL para armazenar indicadores econômicos brasileiros em diferentes níveis geográficos (nacional, estadual, municipal).

## Estrutura de Tabelas

### `regioes`
Armazena níveis geográficos de abrangência dos dados.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| id_regiao | INT | Chave primária |
| sigla | VARCHAR(10) | Identificador único (ex: BR, SP, PR) |
| nome | VARCHAR(100) | Nome descritivo |

### `indicadores`
Define os indicadores econômicos rastreados.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| id_indicador | INT | Chave primária |
| nome | VARCHAR(100) | Nome do indicador (ex: PIB, IPCA) |
| unidade_medida | VARCHAR(20) | Unidade (%, R$, US$, etc.) |
| descricao | TEXT | Explicação do indicador |

### `dados_economicos`
Séries temporais de valores por indicador e região.

| Campo | Tipo | Descrição |
|-------|------|-----------|
| id_dado | INT | Chave primária |
| id_indicador | INT | FK para indicadores |
| id_regiao | INT | FK para regiões |
| data_referencia | DATE | Data de apuração |
| valor | DECIMAL(15,4) | Valor numérico |

## Indicadores Padrão
- **Taxa Selic**: % ao ano
- **IPCA**: % ao mês
- **PIB**: Bilhões R$
