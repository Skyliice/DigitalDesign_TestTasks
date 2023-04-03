SELECT Top(1) d.Id, d.Name as "Наименование департмента",SUM(e.salary) AS "Суммарная зарплата"
FROM Employee e JOIN Department d ON e.department_id = d.id
 GROUP BY d.Name, d.Id Order by (Sum(e.salary)) desc 