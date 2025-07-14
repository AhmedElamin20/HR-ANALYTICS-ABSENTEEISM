-- Create a join table 
SELECT *
FROM Absenteeism_at_work a
Left join Compensation b
on a.ID = b.ID
left join  Reasons r
on a.Reason_for_absence = r.Number;

--find the healthiest employees for bounes
SELECT *
FROM Absenteeism_at_work 
WHERE Social_drinker = 0 and Social_smoker = 0
and Body_mass_index <25 and
Absenteeism_time_in_hours < (SELECT AVG(Absenteeism_time_in_hours) FROM Absenteeism_at_work) 

--- compensation rate increase for non-smokers / budget $983,221 so 0.68 increasev per hours / 1414.4 per year

SELECT count(*)as NonSmoker FROM Absenteeism_at_work
where Social_smoker = 0

-- optimize this query
-- Create a join table 
SELECT 
a.ID,
r.Reason,
month_of_absence,
body_mass_index,
CASE WHEN body_mass_index <18.5 then 'underwight'
     WHEN body_mass_index between 18.5 and 25 then 'Healthy weight'
     WHEN body_mass_index between 25 and 30 then 'Overwight'
     WHEN body_mass_index >18.5 then 'Obese'
     ELSE 'unkown' end as BMI_Category,
CASE when month_of_absence in(12,1,2) then 'Winter'
     when month_of_absence in(3,4,5) then 'Spring'
     when month_of_absence in(6,7,8) then 'Summer'
     when month_of_absence in(9,10,11) then 'Fall'
	 ELSE 'unkown' end as Season_Name,
	 Month_of_absence,
	 Day_of_the_week,
	 Transportation_expense,
	 Education,
	 Son,
	 Social_drinker,
	 Social_smoker,
	 Pet,
	 Disciplinary_failure,
	 Age,
	 Work_load_Average_day,
	 Absenteeism_time_in_hours
FROM Absenteeism_at_work a
Left join Compensation b
on a.ID = b.ID
left join  Reasons r
on a.Reason_for_absence = r.Number