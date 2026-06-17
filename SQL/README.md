# LeetCode SQL

My solved SQL problems, in the order I did them. Keeping these here mostly so I don't forget the reasoning later.

| # | Problem | Difficulty |
|---|---|---|
| 175 | Combine Two Tables | Easy |
| 176 | Second Highest Salary | Easy |
| 177 | Nth Highest Salary | Medium |
| 181 | Employees Earning More Than Their Managers | Easy |
| 182 | Duplicate Emails | Easy |
| 183 | Customers Who Never Order | Easy |
| 184 | Department Highest Salary | Medium |
| 185 | Department Top Three Salaries | Hard |
| 196 | Delete Duplicate Emails | Easy |

## stuff i want to remember

175 and 183 both use LEFT JOIN to keep every row from the left table even when nothing matches on the right. For 183 the trick is checking `WHERE o.customerId IS NULL` after the join — that's how you find customers with zero orders.

184 took me a couple tries. If you just check `salary IN (list of max salaries)` without the department attached, you can accidentally match the wrong department if two departments happen to have the same max salary number. Pairing `(salary, departmentId)` together fixes that.

185 i solved twice, two different ways, because I wanted to see both:
- a correlated subquery that counts how many higher distinct salaries exist per department for each row
- DENSE_RANK() partitioned by department, which does the same thing in one pass instead of rescanning the table for every row

Used DENSE_RANK instead of RANK specifically because RANK skips a number after a tie (1, 1, 3) which throws off the distinct salary count. DENSE_RANK doesn't skip (1, 1, 2) so filtering `rnk <= 3` actually gives you the top 3 unique salaries.

196 is basically the same self-join idea as 181, just used for DELETE instead of SELECT.
