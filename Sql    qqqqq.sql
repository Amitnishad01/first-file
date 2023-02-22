SELECT emp_id, emp_name,salary,
  SUM(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)  AS RunningTotal,
case 
when SUM(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)<=100000 then 'Cat1'
when SUM(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)>100000  and SUM(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) <=150000 then 'Cat2'
else 'Fire' end
 FROM go_wellnext 

 with CTE as
 (
 SELECT 
 emp_id, 
 emp_name,
 salary,
 SUM(salary) OVER(ORDER BY salary ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as CommulativeTotal
 from go_wellnext
 )
 select emp_id,
 emp_name,
 CommulativeTotal,
 case 
 when CommulativeTotal>0 and CommulativeTotal<=100000 then 'Category1'
 when CommulativeTotal>100000 and CommulativeTotal<=150000 then 'Category2'
  when CommulativeTotal>150000 and CommulativeTotal<=300000 then 'Category3'
 else 'Fire' end  as Category
 from CTE
























 select * from go_wellnext