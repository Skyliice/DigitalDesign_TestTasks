Select p.* from Employee p where p.Salary = (Select max(emp.Salary) from Employee emp);