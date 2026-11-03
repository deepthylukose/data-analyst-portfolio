# TaskFlow SaaS Usage & Retention Analysis

## Project Overview
This project analyzes user activity and subscription patterns
for a simulated SaaS application.
## Project Objective

The objective of this project is to analyze user engagement and subscription activity for a simulated SaaS product called TaskFlow.
Using SQL and Google BigQuery, I analyzed user activity, feature usage, monthly active users, and engagement differences between Free and Paid subscription plans.
The analysis helps understand how users interact with the product and provides insights that can support product improvement and customer retention.

## Tools & Technologies

- **SQL: Writing queries to analyze user activity, engagement, and subscription data.
- **Google BigQuery: Storing and querying the project datasets.
- **Tableau Public: Creating interactive dashboards and visualizing key business metrics.
- **GitHub:  Managing and documenting the project.

- ## Business Questions

1. How many users are using each product feature?
2. How many monthly active users does TaskFlow have?
3. What is the average number of events per user?
4. How many registered users have recorded activity?
5. How many users are on Free and Paid subscription plans?
6. What is the subscription status distribution?
7. How long does it take users to record their first activity after signing up?
8. How does engagement differ between Free and Paid users?
9. Which product features are most frequently used by Free and Paid users?


## Key Insights

- **User Activity: 499 out of 500 registered users had recorded activity.
- **Feature Usage: Login was the most frequently recorded event, followed by viewing the dashboard and creating tasks.
- **Monthly Active Users: Monthly active users remained relatively consistent, ranging from 424 to 443 during May–October 2026.
- **Subscription Plans: 317 users were on the Free plan, while 183 users were on the Paid plan.
- **User Engagement: Paid users recorded an average of 20.99 events per active user, compared with 19.49 for Free users.
- **Subscription Status: 365 subscriptions were Active, 124 were Cancelled, and 11 were in Trial status.

## Project Limitations

- **Simulated Data: The dataset was created for portfolio purposes and does not represent real customer activity.
- **Activity Tracking Period: Event records cover May to October 2026. Therefore, the recorded first activity date may not represent a user's actual first-ever activity.


## Dashboard

Tableau Public Dashboard

Explore the interactive TaskFlow SaaS Usage & Retention Analytics dashboard:

[View TaskFlow Dashboard on Tableau Public](https://public.tableau.com/app/profile/deepthy.lukose/viz/TaskFlowProductUsageSubscriptionAnalytics/Dashboard1)

## SQL Queries
Please see the file taskflow_saas_analysis.sql for the queries.
