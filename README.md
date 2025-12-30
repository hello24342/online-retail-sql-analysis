# Online Retail SQL Analysis

## Overview
This project analyzes an online retail dataset to understand customer behavior, product performance, and revenue patterns using SQL.

## Dataset
Source: https://www.kaggle.com/datasets/tunguz/online-retail

Rows: 541k raw, ~300k after cleaning

## Setup
- Removed rows with invalid product IDs (e.g. postage, manual adjustments)
- Excluded negative quantities (returns, damaged items)
- Excluded products with negative or 0 price
- Handled inconsistent product descriptions and prices
- Normalized data into customers, products, and transactions tables
- Defined primary and foreign keys

## Analysis
- Top customers by revenue
- Number of customers who place more than one order
- Top selling products by number of orders
- Countries that generate the most revenue

## Tools
- SQL (SQLite)
