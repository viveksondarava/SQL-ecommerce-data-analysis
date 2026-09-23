# Business Insights — E-Commerce Sales & Customer Analytics

## Executive summary

The synthetic dataset contains 400 orders from 100 customers. Of the 400 orders, 260 are completed, 75 cancelled and 65 returned.

The analysis identifies £303,468.01 of all-status order-item value and £195,551.92 of completed-order revenue. These figures should not be treated as interchangeable because the first includes order items associated with cancelled and returned orders.

## Key findings

### 1. Order outcomes

- Completed: 260 orders (65.00%)
- Cancelled: 75 orders (18.75%)
- Returned: 65 orders (16.25%)

These figures describe the synthetic dataset only.

### 2. Completed revenue by category

| Category | Completed revenue |
|---|---:|
| Electronics | £62,358.16 |
| Accessories | £47,791.79 |
| Fitness | £43,465.43 |
| Home | £41,936.54 |

### 3. Customer concentration

Customer 042 is the highest completed-revenue customer at £5,817.84, contributing 2.98% of completed revenue. The individual contribution is relatively small, so the dataset does not depend on a single customer for most completed revenue.

### 4. Monthly completed revenue

| Month | Completed revenue |
|---|---:|
| 2025-01 | £10,488.23 |
| 2025-02 | £24,123.78 |
| 2025-03 | £18,416.35 |
| 2025-04 | £11,295.37 |
| 2025-05 | £18,077.50 |
| 2025-06 | £19,495.82 |
| 2025-07 | £8,484.64 |
| 2025-08 | £20,408.16 |
| 2025-09 | £15,293.69 |
| 2025-10 | £16,057.92 |
| 2025-11 | £16,363.23 |
| 2025-12 | £17,047.23 |

## Analyst recommendations

1. Report completed revenue separately from cancelled and returned orders.
2. Investigate cancellation and return patterns by category, product and month.
3. Use completed revenue as the sales KPI when the business question concerns realised sales.
4. Monitor high-revenue customers and products over time rather than relying on a single-period ranking.
5. In a production environment, confirm finance rules for refunds and returns before defining final revenue KPIs.

## Limitations

- Synthetic dataset for portfolio use.
- No marketing channel, discount, acquisition-cost or refund-value data.
- Product cost is not used to calculate profit.
- Revenue definitions in a real business may differ from the simplified order-item calculation used here.
