import duckdb
from pathlib import Path

DATABASE = "ecommerce.duckdb"

SCRIPTS = [
    "sql/01_bronze.sql",
    "sql/02_silver.sql",
    "sql/03_gold.sql",
]

con = duckdb.connect(DATABASE)

try:
    for script_path in SCRIPTS:
        print(f"Executando {script_path}...")
        sql = Path(script_path).read_text(encoding="utf-8")
        con.execute(sql)

    print("Pipeline executado com sucesso!")
    print("Banco criado:", DATABASE)

    result = con.execute(
        "SELECT COUNT(*) AS rows FROM gold_sales"
    ).fetchone()

    print(f"Linhas na Gold: {result[0]}")

finally:
    con.close()
