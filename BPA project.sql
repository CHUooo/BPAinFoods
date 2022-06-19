USE Projects
GO


SELECT *
FROM BPAset

SELECT COUNT(*) as Row_Count
FROM BPAset

SELECT unit, mean_conta_ub, food_group, type_foods
FROM BPAset 
WHERE Type_foods LIKE '%Soy%'
ORDER BY mean_conta_ub DESC

SELECT food_group

SELECT food_group, unit, ROUND(MAX(mean_conta_ub), 2) as PCT_Amount
FROM BPAset
GROUP BY Food_group, unit
ORDER BY PCT_Amount DESC

SELECT COUNT(DISTINCT Food_group) as Unique_Foods
FROM BPAset

SELECT food_group, COUNT(*)
FROM BPAset
GROUP BY Food_group
ORDER BY COUNT(*) DESC

SELECT type_foods, ROUND((mean_conta_UB), 2)
FROM BPAset
WHERE Food_group = 'Vegetables (excluding potatoes)'

SELECT type_foods, ROUND((mean_conta_UB), 2)
FROM BPAset
WHERE Food_group = 'Alcoholic beverages'

SELECT type_foods, ROUND((mean_conta_UB), 2)
FROM BPAset
WHERE Food_group = 'Fruit' 

SELECT food_Group, unit, ROUND(AVG(mean_conta_ub),2) as AVERAGE, COUNT(type_foods) as Food_Count,
CASE WHEN unit = 'Microgram/kilogram' THEN 'Food'
	 WHEN unit = 'Microgram/liter' THEN 'Drink' 
END AS Food_Or_Drink
FROM BPAset
GROUP BY food_Group, unit
ORDER BY AVERAGE DESC

SELECT food_Group, ROUND(AVG(mean_conta_ub),2) as AVERAGE, COUNT(type_foods) as Food_Count
FROM BPAset
GROUP BY Food_group
HAVING COUNT(type_foods) > 2 
ORDER BY Food_Count DESC

SELECT food_Group, type_foods, mean_conta_ub,
AVG(mean_conta_ub) OVER (PARTITION BY food_Group ORDER BY mean_conta_ub DESC) AS AVG_By_Group
FROM BPAset