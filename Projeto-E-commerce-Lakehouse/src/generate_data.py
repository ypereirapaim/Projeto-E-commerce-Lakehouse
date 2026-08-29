from pathlib import Path
import pandas as pd

RAW_PATH = Path("data/raw")
RAW_PATH.mkdir(parents=True, exist_ok=True)

customers = pd.DataFrame([
    [1, "Ana Silva", "São Paulo", "SP"],
    [2, "Carlos Souza", "Rio de Janeiro", "RJ"],
    [3, "Marina Costa", "Curitiba", "PR"],
    [4, "João Santos", "Belo Horizonte", "MG"],
    [5, "Lucas Oliveira", "Porto Alegre", "RS"],
], columns=["customer_id", "name", "city", "state"])

categories = pd.DataFrame([
    [1, "Eletrônicos"],
    [2, "Livros"],
    [3, "Casa"],
], columns=["category_id", "category_name"])

products = pd.DataFrame([
    [1, "Notebook", 4500.00, 1],
    [2, "Mouse Gamer", 150.00, 1],
    [3, "Teclado Mecânico", 350.00, 1],
    [4, "SQL para Iniciantes", 80.00, 2],
    [5, "Livro Python", 100.00, 2],
    [6, "Cadeira Escritório", 900.00, 3],
], columns=["product_id", "product_name", "price", "category_id"])

orders = pd.DataFrame([
    [1, 1, "2026-01-10"],
    [2, 2, "2026-01-11"],
    [3, 1, "2026-01-15"],
    [4, 3, "2026-02-02"],
    [5, 4, "2026-02-10"],
    [6, 5, "2026-02-20"],
], columns=["order_id", "customer_id", "order_date"])

order_items = pd.DataFrame([
    [1, 1, 1],
    [1, 2, 2],
    [2, 4, 1],
    [3, 2, 1],
    [4, 3, 2],
    [5, 6, 1],
    [6, 5, 2],
], columns=["order_id", "product_id", "quantity"])

customers.to_csv(RAW_PATH / "customers.csv", index=False)
categories.to_csv(RAW_PATH / "categories.csv", index=False)
products.to_csv(RAW_PATH / "products.csv", index=False)
orders.to_csv(RAW_PATH / "orders.csv", index=False)
order_items.to_csv(RAW_PATH / "order_items.csv", index=False)

print("Dados RAW criados com sucesso.")
