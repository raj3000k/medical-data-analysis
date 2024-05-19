/*List All the Data From Department Table*/
SELECT *
FROM `medical-data-raj.medical_dataset.departments`

/*Display the records where the employee has resigned*/
SELECT emp_id, fname, date_of_resign
FROM `medical-data-raj.medical_dataset.employees`
WHERE date_of_resign IS NOT NULL

/*Find the number of males and females in each employee type category*/

SELECT emp_type, sex, count(emp_id) as totalCount
FROM `medical-data-raj.medical_dataset.employees`
GROUP BY emp_type, sex;

/*List the top 5 treatment with highest fee amount*/

select treatment_id, treatment_name, fees
from `medical-data-raj.medical_dataset.treatments`
order by fees desc limit 5;


/*List the department name and fees spent in that department*/
select d.dep_name, t.fees
from `medical-data-raj.medical_dataset.departments` d inner join `medical-data-raj.medical_dataset.treatments` t
on d.dep_no = t.dep_no;

/*Top 3 departments in terms of fees spent*/
select d.dep_name,  sum(t.fees) as TotalFees
from `medical-data-raj.medical_dataset.departments` d inner join 
`medical-data-raj.medical_dataset.treatments` t on d.dep_no = t.dep_no
group by d.dep_name 
order by sum(t.fees) desc
limit 3 ;

