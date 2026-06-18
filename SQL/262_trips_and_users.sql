# Write your MySQL query statement below
select t.request_at AS Day, ROUND(sum(case when status != 'completed' then 1 else 0 end)/count(*),2) AS 'Cancellation Rate' 
FROM trips t 
JOIN Users c ON c.users_id = t.client_id 
JOIN Users d ON d.users_id = t.driver_id 
WHERE request_at between '2013-10-01' AND '2013-10-03' AND c.banned ='No' AND d.banned='No'
GROUP BY t.request_at
