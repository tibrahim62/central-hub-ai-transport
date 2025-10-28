# Central HUB – AI-Driven Transportation Data Intelligence Platform

**Tech Stack:** Oracle ADB (AI Vector Search) • SQL/PLSQL • APEX • Python (optional embeddings)

**Use Cases:** Incident similarity search • Duplicate detection • Root-cause triage • Knowledge lookup

**Author:** Tarek I. Adam — Oracle Certified Cloud Consultant *(Top 10 in Race to Certification 2025)*

This repository demonstrates an end-to-end pattern for using **Oracle Autonomous Database (ADB)** with **AI Vector Search** to power semantic search over transportation operations data (shipments & incident reports). It mirrors a real enterprise scenario (“Central HUB”) integrating **ADB**, **Oracle Integration Cloud (OIC)**, **Oracle APEX**, and **Oracle Analytics Cloud (OAC)**.

---

## Table of Contents
- [What this project shows](#what-this-project-shows)
- [Architecture](#architecture)
- [Quick start](#quick-start)
- [Files](#files)
- [Example Semantic Query](#example-semantic-query)
- [Author](#author)

---

## What this project shows
- Create **ADB tables** for shipments & incidents with a **VECTOR** column for embeddings  
- Load sample transport data  
- Build a vector index  
- Run **semantic similarity queries** using `VECTOR_DISTANCE(...)`  
- *(Optional)* Generate embeddings with Python and push them back into ADB  
- Wire an **APEX** page to search semantically

> 💡 *This repo is self-contained: you can run the SQL scripts directly in SQL Developer Web on ADB. The Python notebook is optional for generating embeddings if you prefer that route.*

---

## Architecture

```
Data sources (OIC) → ADB (tables + VECTOR) → Vector Index → SQL queries
                                           ↘ APEX UI (search & results)
```


---

## Quick start
> **Prerequisites:** Oracle ADB 23ai (VECTOR/JSON enabled) and SQL Developer Web access.  
> *(Optional)* Python 3.10+ with `oracledb`, `numpy`, and your embedding library if generating embeddings.
1. **Create an ADB instance** (or use an existing one) and open **SQL Developer Web**.  
2. Run `schema.sql` to create tables and the vector index.  
3. Run `sample_data.sql` to insert sample shipments & incidents.  
4. If you have embeddings ready, run `vector_update.sql` to update the `embedding` column (vector) for each incident.  
   - Alternatively, open `embeddings.ipynb` to compute embeddings and update ADB via Python.  
5. Try the semantic search in `vector_query.sql`:  
   - Replace `:query_embedding` with a vector literal or a bind variable produced by your embedding function.

---
> **Disclaimer:**  
> For demo and educational purposes only. Example scripts use portable defaults — review and harden before production deployment.

## Files
- [`schema.sql`](schema.sql) — Create tables (shipments, incidents) and the vector index
- [`sample_data.sql`](sample_data.sql) — Seed data for shipments & incident reports
- [`vector_update.sql`](vector_update.sql) — Example `UPDATE` statements to attach embeddings
- [`vector_query.sql`](vector_query.sql) — Example semantic search queries with `VECTOR_DISTANCE(...)`
- [`embeddings.ipynb`](embeddings.ipynb) — Python notebook to generate embeddings and update ADB
- [`apex/`](apex/) — (optional) screenshots or export of a simple APEX search page

---

## Example Semantic Query
```sql
-- Find incidents most similar to a given query vector
SELECT
  incident_id,
  description,
  VECTOR_DISTANCE(embedding, :query_embedding) AS similarity
FROM   shipment_incidents
ORDER  BY similarity ASC
FETCH FIRST 5 ROWS ONLY;

```

> Oracle syntax for vector index/parameters may differ slightly by version; consult your ADB 23ai docs if needed. Scripts here use portable defaults.

<p align="right"><a href="#table-of-contents">⬆ Back to top</a></p>

---
## Author

Built by **Tarek I. Adam** – Oracle Cloud Certified Professional  
as a public demonstration of practical Oracle analytics on Oracle Cloud.  
**Stack:** Oracle ADB (Vector Search), PL/SQL, APEX, OAC, OIC  
[LinkedIn](https://www.linkedin.com/in/tarek-adam) | [GitHub](https://github.com/tibrahim62)

<p align="right"><a href="#table-of-contents">⬆ Back to top</a></p>
