WITH cte AS (
   SELECT 1 AS lvl, e.Chief_Id, e.id
   FROM Employee e
   WHERE Chief_Id IS NULL
   UNION ALL
   SELECT lvl + 1, emp.Chief_Id, emp.id
   FROM Employee emp
   JOIN cte
     ON emp.Chief_Id = cte.id
) Select max(lvl) as 'Макимальная глубина' from cte;