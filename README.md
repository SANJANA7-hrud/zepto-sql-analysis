# zepto-sql-analysis

SQL-driven data analysis project using the Zepto dataset. This repository currently includes a SQL schema and a collection place for SQL queries. The README is written to be recruiter-facing and to help anyone quickly run or extend the analyses.

## Quick repo snapshot
- `schema.sql` — database schema for the Zepto dataset (create tables and example constraints).
- `sql/` — directory for query files, e.g., ETL, analysis, or reporting queries.
- `README.md` — this file.

## Project overview
This project demonstrates end-to-end relational data analysis patterns using SQL. It is designed to be lightweight so you can run locally (SQLite) or port to a more powerful RDBMS (Postgres, MySQL).

Goals:
- Show realistic SQL skills (joins, window functions, aggregations, CTEs).
- Provide reproducible steps to create a local database and run example queries.
- Be easy to demo for interviews — highlight specific queries and insights.

## Recruiter-friendly summary
This repo is a concise example of practical data engineering and analytics skills:
- Core SQL competencies: schema design, joins, window functions, aggregate KPIs.
- End-to-end thinking: schema → data ingest → queries → reporting.
- Portable and explainable: runs locally in SQLite, easily ported to Postgres/BigQuery.
When sharing with recruiters, call out a single neat insight or a performance improvement you implemented (e.g., optimized join, created summary table to avoid repeated heavy queries).

## What's included now
- `schema.sql` — create the relational tables used by the project. Use this to build a local dev DB.
- `sql/` — add your SQL query files here. Examples you might include:
  - `sql/01_create_views.sql`
  - `sql/02_monthly_kpis.sql`
  - `sql/03_user_segmentation.sql`

## How to get started (local SQLite example)
1. Create a new SQLite database and load the schema:
   sqlite3 zepto.db < schema.sql

2. If you have CSV data to import, use SQLite's `.import` or a small Python script:
   ```bash
   sqlite3 zepto.db
   sqlite> .mode csv
   sqlite> .import data/users.csv users
   ```

3. Run queries from the `sql/` directory:
   ```bash
   sqlite3 -header -column zepto.db < sql/02_monthly_kpis.sql
   ```

4. (Optional) Use Python for more complex ETL and analysis:
   - pandas to read CSVs and write cleaned tables to SQLite via SQLAlchemy.

## Example SQL pattern (illustrative)
```sql
WITH orders_by_user AS (
  SELECT user_id, COUNT(*) AS orders_count
  FROM orders
  GROUP BY user_id
)
SELECT *
FROM orders_by_user
ORDER BY orders_count DESC
LIMIT 10;
```

## Recommendations — what to add next
- Add sample CSVs in `data/sample/` so reviewers can run examples quickly (small sized).
- Add example SQL files in `sql/` that correspond to showcase analyses (KPIs, segmentation, cohort analysis).
- Add a short `scripts/` or `src/` helper to populate the DB from CSVs (Python or Bash).
- Add a short `results/` folder with sample outputs or screenshots that demonstrate insights.

## How to present this in interviews
- Briefly explain the schema and one interesting query.
- Walk through the ETL path for a single KPI (where data came from, how it was cleaned, and how the final metric is computed).
- Mention any choices about indexing, denormalization, or query optimization if applicable.

## Contributing & contact
Contributions welcome. Open an issue or submit a PR. For questions, reach out to the repository owner: @SANJANA7-hrud

## License
Add a LICENSE file (for example, MIT) to clarify reuse terms.