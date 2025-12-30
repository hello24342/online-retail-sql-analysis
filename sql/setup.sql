/* Data Cleaning */
CREATE TABLE clean_transactions AS
SELECT *, quantity * unit_price AS revenue
FROM raw_data
WHERE customer_id IS NOT NULL
  AND quantity > 0
  AND unit_price > 0.001
  AND product_id REGEXP '^[0-9]+';

/* Table Creation */
PRAGMA foreign_keys = ON;

CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY
);

INSERT INTO customers (customer_id)
SELECT DISTINCT customer_id
FROM clean_transactions;

CREATE TABLE products (
    product_id TEXT PRIMARY KEY,
    product_name TEXT
);

INSERT INTO products (product_id, product_name)
SELECT
    product_id,
    MIN(product_name) AS product_name
FROM clean_transactions
GROUP BY product_id;

CREATE TABLE transactions (
    transaction_line_id INTEGER PRIMARY KEY AUTOINCREMENT,
    invoice_id TEXT,
    product_id TEXT,
    customer_id INTEGER,
    country TEXT,
    invoice_date TEXT,
    quantity INTEGER,
    unit_price REAL,
    revenue REAL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO transactions (
    invoice_id,
    product_id,
    customer_id,
    country,
    invoice_date,
    quantity,
    unit_price,
    revenue
)
SELECT
    invoice_id,
    product_id,
    customer_id,
    country,
    invoice_date,
    quantity,
    unit_price,
    revenue
FROM clean_transactions;

