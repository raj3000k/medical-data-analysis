# medical-data-analysis
Analysis of the hospital data for different business queries and their results (output) of Google Clouds BigQuery Platform, using appropriate SQL Commands.
# File Description:
department.csv : 
employee.csv : 
treatments_available.csv : 

1) List All the Data From the Department Table
``` 
SELECT * FROM `medical-data-raj.medical_dataset.departments`
```
![Screenshot 2024-05-19 at 1 24 42 PM](https://github.com/raj3000k/medical-data-analysis/assets/91799854/b85511ea-a18f-412c-b31e-6d85f0b1e008)

2) Display the records where the employee has resigned
```
SELECT emp_id, fname, date_of_resign
FROM `medical-data-raj.medical_dataset.employees`
WHERE date_of_resign IS NOT NULL
```
![Screenshot 2024-05-19 at 1 26 08 PM](https://github.com/raj3000k/medical-data-analysis/assets/91799854/67e41a3b-44a4-4611-8f9c-85f7bc5dbacf)

3) Find the number of males and females in each employee type category
```
SELECT emp_type, sex, count(emp_id) as totalCount
FROM `medical-data-raj.medical_dataset.employees`
GROUP BY emp_type, sex;
```
![Screenshot 2024-05-19 at 1 27 00 PM](https://github.com/raj3000k/medical-data-analysis/assets/91799854/3913f1a5-2714-4bde-bbda-ae65e7c35962)

4) List the top 5 treatments with the highest fee amount
```
select treatment_id, treatment_name, fees
from `medical-data-raj.medical_dataset.treatments`
order by fees desc limit 5;
```
![Screenshot 2024-05-19 at 1 27 51 PM](https://github.com/raj3000k/medical-data-analysis/assets/91799854/ab9022f0-d945-4b40-9e44-7950db530eea)


5) List the department name and fees spent in that department
```
select d.dep_name, t.fees
from `medical-data-raj.medical_dataset.departments` d inner join `medical-data-raj.medical_dataset.treatments` t
on d.dep_no = t.dep_no;
```
![Screenshot 2024-05-19 at 1 29 20 PM](https://github.com/raj3000k/medical-data-analysis/assets/91799854/e9302a45-ca33-4b33-8072-f2b568876b92)

6) Top 3 departments in terms of fees spent
```
select d.dep_name,  sum(t.fees) as TotalFees
from `medical-data-raj.medical_dataset.departments` d inner join 
`medical-data-raj.medical_dataset.treatments` t on d.dep_no = t.dep_no
group by d.dep_name 
order by sum(t.fees) desc
limit 3 ;
```
![Screenshot 2024-05-19 at 1 30 17 PM](https://github.com/raj3000k/medical-data-analysis/assets/91799854/95aac00a-348a-4965-a70e-23114b1aa6a7)






