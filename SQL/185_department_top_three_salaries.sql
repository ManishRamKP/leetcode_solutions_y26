# first way i solved it - correlated subquery
# Write your MySQL query statement below
SELECT d.name AS Department, e1.name AS Employee, e1.salary AS Salary
FROM Employee e1
INNER JOIN Department d ON e1.departmentId = d.id
WHERE (
    SELECT COUNT(DISTINCT(e2.salary))
    FROM Employee e2
    WHERE e2.salary > e1.salary AND e1.departmentId = e2.departmentId
) < 3


# second way - using DENSE_RANK instead
# went with DENSE_RANK over RANK because RANK skips a number after a tie
# which would mess up counting distinct salaries
SELECT Department, Employee, Salary
FROM (
    SELECT d.name AS Department, e.name AS Employee, e.salary AS Salary,
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS rnk
    FROM Employee e
    JOIN Department d ON e.departmentId = d.id
) ranked
WHERE rnk <= 3
