CREATE TABLE Employee (
emp_id INT,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
experience INT,
performance_rating CHAR(1)
);
INSERT INTO Employee (emp_id, emp_name, department, salary, experience, performance_rating)
VALUES
(1, 'Karthik', 'Engineering', 95000, 9, 'A'),
(2, 'Prathik', 'HR', 55000, 4, 'B'),
(3, 'Vinay', 'Finance', 78000, 10, 'B'),
(4, 'Vijay', 'Marketing', 48000, 3, 'C'),
(5, 'Anil', 'Engineering', 88000, 6, 'A'),
(6, 'Suresh', 'Finance', 92000, 12, 'A'),
(7, 'Ramesh', 'HR', 46000, 2, 'C'),
(8, 'Mahesh', 'Marketing', 67000, 7, 'B'),
(9, 'Rajesh', 'Engineering', 72000, 5, 'B'),
(10,'Naveen', 'Finance', 61000, 6, 'C'),
(11,'Deepak', 'HR', 83000, 11, 'A'),
(12,'Arjun', 'Engineering', 54000, 3, 'C'),
(13,'Kiran', 'Marketing', 76000, 8, 'A'),
(14,'Rohit', 'Finance', 68000, 4, 'B'),
(15,'Pavan', 'HR', 59000, 5, 'B'),
(16,'Srikanth', 'Engineering', 102000, 14, 'A'),
(17,'Manoj', 'Finance', 47000, 2, 'C'),
(18,'Varun', 'Marketing', 52000, 6, 'B'),
(19,'Ashok', 'HR', 74000, 9, 'A'),
(20,'Sunil', 'Engineering', 66000, 4, 'B'),
(21,'Nikhil', 'Finance', 86000, 7, 'A'),
(22,'Harish', 'Marketing', 45000, 1, 'C'),
(23,'Vamsi', 'Engineering', 79000, 8, 'B'),
(24,'Chaitanya','HR', 91000, 13, 'A'),
(25,'Lokesh', 'Finance', 58000, 5, 'B');

--- Problem 1: Salary Hike Based on Experience and PerformanceScenario: You want to give a salary hike based on both experience and performance rating. If the employee has: Experience ≥ 8 and Performance 'A', they get a 20% hike. Experience ≥ 5 and Performance 'B', they get a 15% hike. Performance 'C' gets no hike. For other cases, they get a 10% hike.

Select *,
case 
    when experience >= 8 and performance_rating = 'A' then '20%'
    when experience >= 5 and performance_rating = 'B' then '15%'
    when performance_rating = 'C' then 'No Hike'
    Else '10%'
End as Hike
From Employee

 --- Problem 2: Bonus Calculation Based on Department and Performance Scenario: Bonus is calculated based on the department and performance rating:For Finance department: If performance is 'A', the bonus is 20% of the salary. If performance is 'B', the bonus is 15% of the salary. If performance is 'C', the bonus is 5% of the salary. For Engineering department: If performance is 'A', the bonus is 18% of the salary. If performance is 'B', the bonus is 12% of the salary. If performance is 'C', the bonus is 3% of the salary. For other departments, a flat 10% bonus.

Select *,
case 
    when department = "Finance" then
    case 
        when performance_rating = 'A' then '20%'
        when performance_rating = 'B' then '15%'
        when performance_rating = 'C' then '5%'
    end
    
    when department = "Engineering" then
    case 
        when performance_rating = 'A' then '18%'
        when performance_rating = 'B' then '12%'
        when performance_rating = 'C' then '3%'
    end
    
    else '10%'
End as Bonus
From Employee

-- Problem 3: Categorizing Employees by Salary Range and Performance Scenario: You want to categorize employees based on salary ranges and their performance: If salary is greater than 80,000 and performance is 'A', label them as High Performer. If salary is between 50,000 and 80,000 and performance is 'B', label them as Mid Performer. If salary is less than 50,000 or performance is 'C', label them as Low Performer.

Select *,
    case 
        when salary > 80000 and performance_rating = 'A' then 'High Performer'
        when (salary > 50000 and salary < 80000) and performance_rating = 'B' then 'Mid Performer'
        when salary < 50000  and performance_rating = 'C' then 'Low Performer'
    End as Performance
From Employee

-- Problem 4: Risk Assessment Based on Experience and Department Scenario: You want to assess employee risk based on their experience and department: For employees in the HR department: If experience is less than 5 years, they are High Risk. If experience is more than 5 years, they are Low Risk. For employees in Engineering or Finance departments: If experience is more than 8 years, they are Low Risk. If experience is less than 8 years, they are Medium Risk. Employees in other departments are automatically labeled Medium Risk.

Select *,
    case 
    when department = "HR" then
        case
        when experience > 5 then 'Low Risk'
        when experience < 5 then 'High Risk'
        ELSE 'Medium Risk'
        end
    when department = "Engineering" then
        case
        when experience > 8 then 'Low Risk'
        when experience < 8 then 'Medium Risk'
        ELSE 'Medium Risk'
        end
    Else 'Medium Risk'
    End as Risk_Rating
From Employee

-- Problem 1: Nested CASE for Performance and Salary Hike Based on Multiple Criteria Scenario: You want to determine the salary hike based on performance rating, experience, and current salary. The hike rules are: If performance is 'A': For salaries above 80,000, experience above 5 years gets a 25% hike, otherwise 20%. For salaries between 50,000 and 80,000, the hike is 15%. If performance is 'B': For experience above 5 years, the hike is 12%.Otherwise, it's 10%. For performance 'C', there is no hike.

Select *,
    case 
    when performance_rating = "A" then
        case
        when salary > 80000 and experience > 5 then '25%'
        when salary > 80000 then '20%'
        when salary between 50000 and 80000 then '15%'
        end
    when performance_rating = "B" then
        case
        when experience > 5 then '12%'
        ELSE '10%'
        end
    when performance_rating = "C" then "No Hike"
    End as Hike_Stats
From Employee

-- 2.Department and Performance Scenario: You are tasked with giving bonuses based on the department, performance rating, and experience: For Finance department: If performance is 'A' and experience is more than 10 years, bonus is 25% of salary. Otherwise, bonus is 20%. For HR department: If performance is 'B' or experience is greater than 5 years, the bonus is 15%. Otherwise, the bonus is 10%. For other departments, the bonus is 8%.

Select * , 
Case 
    when department = "Finance" then
    case 
    when performance_rating = 'A' and experience > 10 then '25%'
    else  '20%'
    end
    
    when department = "HR" then
    case 
    when performance_rating = 'B' or experience > 5 then '15%'
    else  '10%'
    end
    else '10%'
    
    end as Bonus
    From Employee

/*
Problem 3: Nested CASE for Employee Categorization Based on Salary, Performance, and Experience

Scenario:
Categorize employees based on their salary, performance rating, and experience:

• If salary is above 70,000:
    - If performance is 'A' AND experience is more than 8 years → 'Top Performer'
    - If experience is less than 8 years → 'Mid Performer'

• If salary is between 50,000 and 70,000:
    - 'Average Performer'
    - BUT if performance is 'A' → 'Rising Star'

• If salary is below 50,000:
    - 'Low Performer'
*/

SELECT *,
CASE

    WHEN salary > 70000 THEN
        CASE
            WHEN performance_rating = 'A' AND experience > 8 THEN 'Top Performer'
            WHEN experience < 8 THEN 'Mid Performer'
            ELSE 'Mid Performer'
        END

    WHEN salary BETWEEN 50000 AND 70000 THEN
        CASE
            WHEN peraformance_rating = 'A' THEN 'Rising Star'
            ELSE 'Average Performer'
        END

    ELSE 'Low Performer'

END AS Employee_Category

FROM Employee;

    /*
4. Nested CASE for Tax Bracket Based on Salary and Experience

Scenario:
You want to determine the tax bracket of employees based on their salary and experience:

• If salary is above 90,000:
    - If experience is more than 10 years → 35% tax bracket
    - Otherwise → 30% tax bracket

• If salary is between 60,000 and 90,000:
    - If experience is more than 5 years → 25% tax bracket
    - Otherwise → 20% tax bracket

• If salary is below 60,000:
    - 15% tax bracket
*/

SELECT *,
CASE

    WHEN salary > 90000 THEN
        CASE
            WHEN experience > 10 THEN '35% Tax Bracket'
            ELSE '30% Tax Bracket'
        END

    WHEN salary BETWEEN 60000 AND 90000 THEN
        CASE
            WHEN experience > 5 THEN '25% Tax Bracket'
            ELSE '20% Tax Bracket'
        END

    ELSE '15% Tax Bracket'

END AS Tax_Bracket

FROM Employee;

/*
Problem 5: Nested CASE for Promotion Eligibility Based on Performance, Salary, and Experience

Scenario:
You want to determine if employees are eligible for promotion based on their performance rating, salary, and experience:

• If performance_rating is 'A':
    - If salary > 75,000 AND experience > 7 years → 'Eligible for Senior Role'
    - Otherwise → 'Eligible for Junior Role'

• If performance_rating is 'B':
    - If experience > 5 years → 'Eligible for Consideration'
    - Otherwise → 'Not Eligible'

• If performance_rating is 'C':
    - 'Not Eligible'
*/

SELECT *,
CASE

    WHEN performance_rating = 'A' THEN
        CASE
            WHEN salary > 75000 AND experience > 7 THEN 'Eligible for Senior Role'
            ELSE 'Eligible for Junior Role'
        END

    WHEN performance_rating = 'B' THEN
        CASE
            WHEN experience > 5 THEN 'Eligible for Consideration'
            ELSE 'Not Eligible'
        END

    WHEN performance_rating = 'C' THEN 'Not Eligible'

    ELSE 'Not Eligible'

END AS Promotion_Status

FROM Employee;