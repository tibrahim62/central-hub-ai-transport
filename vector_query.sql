-- vector_query.sql
-- Example semantic similarity search using a bind variable :query_embedding

-- Find top-5 most similar incident descriptions to the query vector
SELECT incident_id,
       severity,
       DBMS_LOB.SUBSTR(description, 160, 1) AS snippet,
       VECTOR_DISTANCE(embedding, :query_embedding) AS similarity
FROM   shipment_incidents
WHERE  embedding IS NOT NULL
ORDER  BY similarity ASC
FETCH FIRST 5 ROWS ONLY;
