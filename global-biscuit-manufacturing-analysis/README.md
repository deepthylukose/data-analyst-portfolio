# Global Biscuit Manufacturing – Machine Inspection Analysis

## Project Overview

This project analyzes machine inspections, machine conditions, maintenance activities, maintenance costs, downtime, branches, and employee shift activity for a simulated global biscuit manufacturing company.

The goal is to use SQL in Google BigQuery to identify operational issues and turn the results into practical business insights that can help the company monitor machine health, reduce downtime, and understand maintenance performance across branches.

## Business Objectives

- Compare machine and maintenance performance across branches.
- Understand machine conditions based on inspection records.
- Identify common inspection issues and machines that may need attention.
- Analyze maintenance frequency, costs, and downtime.
- Compare maintenance types and their operational impact.
- Understand employee participation in inspections by branch and shift.

## Tools Used

- **Google BigQuery** – data storage and SQL analysis.
- **SQL** – data exploration, joins, aggregations, filtering, and business analysis.
- **Tableau** – interactive dashboard and data visualization.
- **GitHub** – project documentation and SQL portfolio.

## Dataset

- 9 branches
- 180 machines
- 32,400 machine inspection records

Tables used:

- branches
- machines
- shifts
- employees
- machine_inspections
- maintenance_records

## SQL Analysis

A total of **22 business questions** were explored using SQL, covering:

1. Machine counts by branch.
2. Machine types used across the company.
3. Machine status distribution.
4. Machines under maintenance by branch.
5. Machine condition based on inspection records.
6. Machines with the most poor-condition inspections.
7. Machine types with the most poor-condition inspections.
8. Frequency of issues found during inspections.
9. Branches reporting the most inspection issues.
10. Most common inspection issues.
11. Machines with the highest maintenance costs.
12. Maintenance type comparison by frequency, cost, and downtime.
13. Maintenance costs by branch.
14. Total downtime by branch.
15. Machines with the highest total downtime.
16. Maintenance record counts by branch.
17. Machines with the most maintenance activities.
18. Average downtime per maintenance activity by branch.
19. Machines with the highest average downtime per activity.
20. Maintenance cost analysis by machine.
21. Employee count by branch.
22. Employees who performed inspections in each shift.

## Key Business Insights

- The dataset contains **180 machines across 9 branches**, with 20 machines in each branch.
- **170 machines (94.44%)** are Active, while **10 machines (5.56%)** are Under Maintenance.
- Inspection results show **90.07% Good**, **7.88% Fair**, and **2.05% Poor** machine conditions.
- **2,352 out of 32,400 inspection records (7.26%)** reported an issue.
- Los Angeles recorded the highest number of inspection issues, with 277.
- Roller alignment was the most frequently reported issue, with 91 occurrences.
- Preventive maintenance had the highest number of records, with 324.
- Corrective maintenance had the highest total maintenance cost (**$118,087.86**) and recorded **922.74 hours** of downtime.
- Chicago recorded the highest branch maintenance cost (**$27,136.38**).
- Chicago also recorded the highest total downtime by branch (**210.49 hours**).
- Each branch had 80 maintenance records.
- The employee table contains 225 employees, with 25 assigned to each branch.
- The shift analysis found 153 distinct employees with inspection records in each shift

## Dashboard Plan

Planned dashboard elements:

- KPI cards and interactive visualizations
- Branch-level comparison of Inspection analysis
- Machine-level analysis of inspection results and downtime.
- Maintenance type analysis
- Employee and shift analysis
- Interactive date-range filter


## Project Files

- `global_biscuit_manufacturing_analysis.sql` – SQL queries for the 22 business questions.
- Tableau dashboard – to be added after dashboard development and publication.


