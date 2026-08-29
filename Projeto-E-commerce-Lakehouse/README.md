# 🛒 Projeto E-commerce Lakehouse

Projeto de portfólio para demonstrar um pipeline de dados de e-commerce usando arquitetura em camadas **Raw → Bronze → Silver → Gold**.

## 🎯 Objetivo

Simular um pequeno ambiente de dados de e-commerce, partindo de arquivos CSV brutos, tratando os dados com SQL e gerando uma camada Gold pronta para análises.

## 🏗️ Arquitetura

```text
CSV / RAW
   ↓
BRONZE
   ↓
SILVER
   ↓
GOLD
   ↓
SQL Analytics
```

## 🛠️ Tecnologias

- Python
- SQL
- DuckDB
- Pandas
- PyArrow
- Parquet
- Git / GitHub

## 📂 Estrutura

```text
Projeto-E-commerce-Lakehouse/
├── data/
│   └── raw/
├── sql/
│   ├── 01_bronze.sql
│   ├── 02_silver.sql
│   ├── 03_gold.sql
│   └── 04_analytics.sql
├── src/
│   ├── generate_data.py
│   └── run_pipeline.py
├── docs/
├── notebooks/
├── .gitignore
├── requirements.txt
└── README.md
```

## 📊 Dados

O projeto possui dados simulados de:

- Clientes
- Categorias
- Produtos
- Pedidos
- Itens dos pedidos

## 🔄 Camadas

### Raw
Dados originais em CSV.

### Bronze
Leitura dos dados Raw e persistência em tabelas analíticas.

### Silver
Limpeza, padronização e conversão de tipos.

### Gold
Tabela `gold_sales` preparada para análise.

## 📈 Perguntas respondidas

- Qual o faturamento total?
- Quais são os produtos mais vendidos?
- Qual produto gera mais receita?
- Qual cidade gera mais faturamento?
- Qual categoria possui maior receita?
- Qual cliente mais gastou?
- Qual é o ticket médio?
- Como o faturamento evolui por mês?
- Qual o ranking dos produtos?

## ▶️ Como executar

### 1. Criar ambiente virtual

```bash
python -m venv .venv
```

Windows:

```bash
.venv\Scripts\activate
```

Linux/Mac:

```bash
source .venv/bin/activate
```

### 2. Instalar dependências

```bash
pip install -r requirements.txt
```

### 3. Gerar dados

```bash
python src/generate_data.py
```

### 4. Executar pipeline

```bash
python src/run_pipeline.py
```

O pipeline cria o banco local `ecommerce.duckdb`.

### 5. Executar análises

As consultas estão em:

```text
sql/04_analytics.sql
```

## 🧠 Conceitos demonstrados

- SQL
- JOIN
- GROUP BY
- ORDER BY
- CTE
- Window Functions
- RANK
- LAG
- DATE_TRUNC
- ETL/ELT
- Data Lakehouse
- Camadas Bronze, Silver e Gold

## 🚀 Próximos passos

- Adicionar testes de qualidade de dados
- Criar dashboard no Power BI
- Aumentar o volume de dados
- Adicionar Docker
- Automatizar execução
- Evoluir para AWS S3 + Athena
