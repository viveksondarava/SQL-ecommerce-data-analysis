# E-Commerce Sales & Customer Analytics — MySQL

A portfolio-ready SQL data analysis project built in MySQL Workbench to answer practical e-commerce business questions using relational sales data.

## Project objective

Analyse customers, orders, order items and products to produce business KPIs, revenue analysis, customer segmentation, product/category performance and time-series insights.

## Dataset

Synthetic portfolio dataset:

- 100 customers
- 27 products
- 400 orders
- 981 order items
- 4 product categories
- 2025 order dates

> The dataset is synthetic and must not be presented as real company data.

## Data model

```text
customers (customer_id)
        |
        | customer_id
        v
orders (order_id, customer_id)
        |
        | order_id
        v
order_items (order_item_id, order_id, product_id)
        |
        | product_id
        v
products (product_id)
```

## Business questions answered

1. What is the total order-item value?
2. How many orders and customers are in the dataset?
3. Which product categories generate the most value?
4. Which products generate the most value?
5. Which customers generate the most completed-order revenue?
6. What is the order-status distribution?
7. How does completed revenue change month by month?
8. How much of completed revenue is contributed by each customer?
9. How can orders be classified using `CASE WHEN`?
10. What is completed-order revenue?
11. How can CTEs simplify customer revenue analysis?
12. How can customers be ranked with a window function?
13. What percentage of completed revenue does each customer contribute?
14. What is monthly completed revenue?
15. Which categories generate the most completed-order revenue?

## SQL techniques demonstrated

- `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`
- Aggregate functions: `SUM()`, `COUNT()`
- `INNER JOIN`
- `CASE WHEN`
- Subqueries
- CTEs using `WITH`
- `DATE_FORMAT()`
- Window functions: `RANK()` and `SUM() OVER()`
- Percentage contribution analysis
- Business KPI calculations

## Key results

| KPI | Result |
|---|---:|
| Customers | 100 |
| Orders | 400 |
| Order items | 981 |
| All-status order-item value | £303,468.01 |
| Completed orders | 260 (65.00%) |
| Cancelled orders | 75 (18.75%) |
| Returned orders | 65 (16.25%) |
| Completed-order revenue | £195,551.92 |

### Completed revenue by category

| Category | Completed revenue |
|---|---:|
| Electronics | £62,358.16 |
| Accessories | £47,791.79 |
| Fitness | £43,465.43 |
| Home | £41,936.54 |

### Top completed-revenue customer

Customer 042 generated £5,817.84 in completed-order revenue, representing 2.98% of total completed revenue in this synthetic dataset.

## Important analytical distinction

The project deliberately separates:

- **All-status order-item value:** £303,468.01 — calculated across all order items regardless of order status.
- **Completed-order revenue:** £195,551.92 — restricted to orders whose status is `Completed`.

This distinction prevents cancelled and returned orders from being treated as realised sales when the business question is completed revenue.

## Project structure

```text
SQL_Ecommerce_Data_Analysis/
├── README.md
├── Business_Insights.md
├── sql/
│   ├── 01_database_setup.sql
│   ├── 02_business_analysis.sql
│   └── 03_advanced_analysis.sql
├── data/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── order_items.csv
└── screenshots/
    ├── q11_customer_revenue.png
    ├── q12_customer_ranking.png
    ├── q13_customer_contribution.png
    └── q14_monthly_completed_revenue.png
```

## How to run

1. Install MySQL 8.0 and MySQL Workbench.
2. Open `sql/01_database_setup.sql` and run it.
3. Open `sql/02_business_analysis.sql` and run the business KPI queries.
4. Open `sql/03_advanced_analysis.sql` and run the advanced queries.
5. Review the result grids and compare them with `Business_Insights.md`.

## Portfolio value

This project demonstrates how a junior analyst can use SQL to move from raw relational data to measurable business questions, rather than simply writing isolated SQL syntax examples.

## Next project

The same e-commerce dataset can be used for a **Power BI Business Dashboard**, creating a portfolio workflow of:

**SQL analysis → business insights → dashboard visualisation.**
