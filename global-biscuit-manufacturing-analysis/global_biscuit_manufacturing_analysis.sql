-- Global Biscuit Manufacturing
-- Machine Inspection & Maintenance Analysis
-- BigQuery SQL Portfolio
-- Source: machine_Inspection_queries.docx
--
-- Note: The queries below preserve the analysis and table references from
-- the supplied document, with formatting and minor syntax cleanup.
-- Review the notes after the queries before publishing.

-- =========================================================
-- BUSINESS QUESTION 1
-- Which branches have the highest number of machines?
-- =========================================================
SELECT
    b.branch_name,
    COUNT(m.machine_id) AS total_machines
FROM `mycoursera-508117.Machine_Inspection_Data.branches` AS b
LEFT JOIN `mycoursera-508117.Machine_Inspection_Data.machines` AS m
    ON b.branch_id = m.branch_id
GROUP BY b.branch_name
ORDER BY total_machines DESC;


-- =========================================================
-- BUSINESS QUESTION 2
-- Which machine types are used most frequently?
-- =========================================================
SELECT
    machine_type,
    COUNT(machine_id) AS total_machines
FROM `mycoursera-508117.Machine_Inspection_Data.machines`
GROUP BY machine_type
ORDER BY total_machines DESC;


-- =========================================================
-- BUSINESS QUESTION 3
-- What is the current status of machines?
-- =========================================================
SELECT
    machine_status,
    COUNT(*) AS total_machines
FROM `mycoursera-508117.Machine_Inspection_Data.machines`
GROUP BY machine_status
ORDER BY total_machines DESC;


-- =========================================================
-- BUSINESS QUESTION 4
-- Which branches have machines under maintenance?
-- =========================================================
SELECT
    b.branch_name,
    COUNT(*) AS total_machines_under_maintenance
FROM `mycoursera-508117.Machine_Inspection_Data.machines` AS m
JOIN `mycoursera-508117.Machine_Inspection_Data.branches` AS b
    ON m.branch_id = b.branch_id
WHERE m.machine_status = 'Under Maintenance'
GROUP BY b.branch_name
ORDER BY total_machines_under_maintenance DESC;


-- =========================================================
-- BUSINESS QUESTION 5
-- What is the overall machine condition based on inspections?
-- =========================================================
SELECT
    machine_condition,
    COUNT(machine_id) AS inspectioned_machines_count
FROM `mycoursera-508117.Machine_Inspection_Data.machine_inspections`
GROUP BY machine_condition
ORDER BY inspectioned_machines_count DESC;


-- =========================================================
-- BUSINESS QUESTION 6
-- Which machines have the highest number of Poor-condition inspections?
-- =========================================================
SELECT
    machine_id,
    COUNT(machine_id) AS poor_machines
FROM `mycoursera-508117.Machine_Inspection_Data.machine_inspections`
WHERE machine_condition = 'Poor'
GROUP BY machine_id
ORDER BY poor_machines DESC;


-- =========================================================
-- BUSINESS QUESTION 7
-- Which machine types have the most Poor-condition inspections?
-- =========================================================
SELECT
    m.machine_type,
    COUNT(*) AS poor_inspections
FROM `mycoursera-508117.Machine_Inspection_Data.machine_inspections` AS i
JOIN `mycoursera-508117.Machine_Inspection_Data.machines` AS m
    ON i.machine_id = m.machine_id
WHERE i.machine_condition = 'Poor'
GROUP BY m.machine_type
ORDER BY poor_inspections DESC;


-- =========================================================
-- BUSINESS QUESTION 8
-- How many inspections found an issue?
-- =========================================================
SELECT
    issue_found,
    COUNT(inspection_id) AS inspection_count
FROM `mycoursera-508117.Machine_Inspection_Data.machine_inspections`
GROUP BY issue_found
ORDER BY issue_found DESC;


-- =========================================================
-- BUSINESS QUESTION 9
-- Which branches report the most inspection issues?
-- =========================================================
SELECT
    b.branch_name,
    COUNT(*) AS reported_issue_count
FROM `mycoursera-508117.Machine_Inspection_Data.machine_inspections` AS i
JOIN `mycoursera-508117.Machine_Inspection_Data.branches` AS b
    ON i.branch_id = b.branch_id
WHERE i.issue_found = TRUE
GROUP BY b.branch_name
ORDER BY reported_issue_count DESC;


-- =========================================================
-- BUSINESS QUESTION 10
-- What are the most common machine issues?
-- =========================================================
SELECT
    issue_description,
    COUNT(*) AS issue_occurrence_count
FROM `mycoursera-508117.Machine_Inspection_Data.machine_inspections`
WHERE issue_found = TRUE
GROUP BY issue_description
ORDER BY issue_occurrence_count DESC;


-- =========================================================
-- BUSINESS QUESTION 11
-- Which machines have the highest maintenance costs?
-- =========================================================
SELECT
    machine_id,
    COUNT(*) AS total_maintenance_records,
    ROUND(SUM(maintenance_cost), 2) AS total_cost
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records`
GROUP BY machine_id
ORDER BY total_cost DESC;


-- =========================================================
-- BUSINESS QUESTION 12
-- Which maintenance types are most common?
-- =========================================================
SELECT
    maintenance_type,
    COUNT(*) AS total_records,
    ROUND(SUM(maintenance_cost), 2) AS total_cost,
    ROUND(SUM(downtime_hours), 2) AS total_downtime
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records`
GROUP BY maintenance_type
ORDER BY total_records DESC;


-- =========================================================
-- BUSINESS QUESTION 13
-- Which branches have the highest maintenance costs?
-- =========================================================
SELECT
    b.branch_name,
    ROUND(SUM(m.maintenance_cost), 2) AS total_cost,
    COUNT(*) AS total_records
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records` AS m
JOIN `mycoursera-508117.Machine_Inspection_Data.branches` AS b
    ON m.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_cost DESC;


-- =========================================================
-- BUSINESS QUESTION 14
-- Which branches experience the highest machine downtime?
-- =========================================================
SELECT
    b.branch_name,
    ROUND(SUM(m.downtime_hours), 2) AS total_downtime
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records` AS m
JOIN `mycoursera-508117.Machine_Inspection_Data.branches` AS b
    ON m.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_downtime DESC;


-- =========================================================
-- BUSINESS QUESTION 15
-- Which machines have the highest total maintenance downtime?
-- =========================================================
SELECT
    machine_id,
    ROUND(SUM(downtime_hours), 2) AS total_downtime
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records`
GROUP BY machine_id
ORDER BY total_downtime DESC;


-- =========================================================
-- BUSINESS QUESTION 16
-- Which branches have the highest number of maintenance records?
-- =========================================================
SELECT
    b.branch_name,
    COUNT(*) AS total_maintenance_records
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records` AS m
JOIN `mycoursera-508117.Machine_Inspection_Data.branches` AS b
    ON m.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_maintenance_records DESC;


-- =========================================================
-- BUSINESS QUESTION 17
-- Which machines have the highest number of maintenance activities?
-- =========================================================
SELECT
    machine_id,
    COUNT(*) AS total_maintenance_activities
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records`
GROUP BY machine_id
ORDER BY total_maintenance_activities DESC;


-- =========================================================
-- BUSINESS QUESTION 18
-- Which branches have the highest average downtime per maintenance activity?
-- =========================================================
SELECT
    b.branch_name,
    COUNT(*) AS total_maintenance_records,
    ROUND(AVG(m.downtime_hours), 2) AS avg_downtime
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records` AS m
JOIN `mycoursera-508117.Machine_Inspection_Data.branches` AS b
    ON m.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY avg_downtime DESC;


-- =========================================================
-- BUSINESS QUESTION 19
-- Which machines have the highest average downtime per maintenance activity?
-- =========================================================
SELECT
    machine_id,
    COUNT(*) AS total_maintenance_activities,
    ROUND(AVG(downtime_hours), 2) AS avg_downtime
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records`
GROUP BY machine_id
ORDER BY avg_downtime DESC;


-- =========================================================
-- BUSINESS QUESTION 20
-- Which machines have the highest total maintenance costs?
-- =========================================================
SELECT
    machine_id,
    COUNT(*) AS total_maintenance_activities,
    ROUND(SUM(maintenance_cost), 2) AS total_maintenance_cost
FROM `mycoursera-508117.Machine_Inspection_Data.maintenance_records`
GROUP BY machine_id
ORDER BY total_maintenance_cost DESC;


-- =========================================================
-- BUSINESS QUESTION 21
-- How many employees work in each branch?
-- =========================================================
SELECT
    b.branch_name,
    COUNT(e.employee_id) AS total_employees
FROM `mycoursera-508117.Machine_Inspection_Data.employees` AS e
JOIN `mycoursera-508117.Machine_Inspection_Data.branches` AS b
    ON e.branch_id = b.branch_id
GROUP BY b.branch_name
ORDER BY total_employees DESC;


-- =========================================================
-- BUSINESS QUESTION 22
-- How many employees performed machine inspections during each shift?
-- Note: This counts distinct employees who appear in inspection records
-- for each shift. It does not necessarily count employees assigned to shifts.
-- =========================================================
SELECT
    s.shift_name,
    COUNT(DISTINCT i.employee_id) AS total_employees
FROM `mycoursera-508117.Machine_Inspection_Data.machine_inspections` AS i
JOIN `mycoursera-508117.Machine_Inspection_Data.shifts` AS s
    ON i.shift_id = s.shift_id
GROUP BY s.shift_name
ORDER BY total_employees DESC;

-- REVIEW NOTES BEFORE PUBLISHING
--
-- 1. Questions 11 and 20 are duplicates in business intent:
--    both identify machines with the highest total maintenance cost.
--    Consider replacing one with a different question if you want 22
--    distinct business questions.
--
-- 2. Question 5 uses the alias "inspectioned_machines_count". The count
--    is inspection records grouped by condition, not necessarily distinct
--    machines. Consider renaming it to total_inspections for clarity.
--
-- 3. Question 22 counts distinct employees who performed inspections
--    in each shift. It does not establish the number of employees assigned
--    to each shift unless the data model defines shift assignment that way.
--
-- 4. Question 13's saved insight values should be checked against the
--    latest BigQuery output before publishing. The written document's
--    Montreal value may not match later results.
--
-- 5. The source document uses the term "inspectioned_machines_count";
--    this cleaned SQL keeps the underlying counting logic unchanged.
