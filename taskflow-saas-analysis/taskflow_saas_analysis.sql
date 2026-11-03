
-- 1. Event Distribution
/*Objective: Identify how many times each event occurred and how many unique users performed each event.*/

SELECT
    event_name,
    COUNT(*) AS total_events,
    COUNT(DISTINCT user_id) AS unique_users
FROM
    `mycoursera-508117.product_analysis.events`
GROUP BY
    event_name
ORDER BY
    total_events DESC;


/*2. How Many Users Are Using Each Product Feature?

Objective: Find the number of unique users who performed each type of activity and the total number of events.*/

SELECT
    event_name,
    COUNT(DISTINCT user_id) AS unique_users,
    COUNT(*) AS total_events
FROM
    `mycoursera-508117.product_analysis.events`
GROUP BY
    event_name
ORDER BY
    unique_users DESC;

/* 3. Monthly Active Users (MAU)

Objective: Measure the number of unique users who performed an activity each month.*/

SELECT
    DATE_TRUNC(event_date, MONTH) AS activity_month,
    COUNT(DISTINCT user_id) AS monthly_active_users
FROM
    `mycoursera-508117.product_analysis.events`
GROUP BY
    activity_month
ORDER BY
    activity_month DESC;

/* 4. Average Events Per User

Objective: Calculate how many events users perform on average. This helps understand user engagement with the application.*/

SELECT
    ROUND(AVG(total_events_per_user), 2) AS avg_events_per_user
FROM (
    SELECT
        user_id,
        COUNT(*) AS total_events_per_user
    FROM
        `mycoursera-508117.product_analysis.events`
    GROUP BY
        user_id
);

/*5. How Many Registered Users Have Recorded Activity?

Objective: Identify registered users who have at least one recorded event and users who have no recorded activity.*/

SELECT
    CASE
        WHEN e.user_id IS NOT NULL THEN 'Active'
        ELSE 'No Recorded Activity'
    END AS user_activity_status,
    COUNT(*) AS total_users
FROM
    `mycoursera-508117.product_analysis.users` AS u
LEFT JOIN (
    SELECT DISTINCT
        user_id
    FROM
        `mycoursera-508117.product_analysis.events`
) AS e
    ON u.user_id = e.user_id
GROUP BY
    user_activity_status
ORDER BY
    total_users DESC;

/*6. How Many Users Have Each Subscription Plan?

Objective: Understand how many unique users are subscribed to each plan, such as Free and Paid.*/

SELECT
    subscription_plan,
    COUNT(DISTINCT user_id) AS total_users
FROM
    `mycoursera-508117.product_analysis.subscriptions`
GROUP BY
    subscription_plan
ORDER BY
    total_users DESC;

/*Subscription Status
Objective: Find the number of users in each subscription status, such as Active, Cancelled, and Trial.*/
SELECT
    subscription_status,
    COUNT(DISTINCT user_id) AS total_users
FROM
    `mycoursera-508117.product_analysis.subscriptions`
GROUP BY
    subscription_status
ORDER BY
    total_users DESC;

/* 7. How Quickly Do Users Start Using the Product?

Objective: Calculate the average number of days between user signup and their first recorded activity.*/

WITH first_activity AS (
    SELECT
        user_id,
        MIN(event_date) AS first_event_date
    FROM
        `mycoursera-508117.product_analysis.events`
    GROUP BY
        user_id
)

SELECT
    COUNT(*) AS users_with_events,
    ROUND(
        AVG(DATE_DIFF(f.first_event_date, u.signup_date, DAY)),
        1
    ) AS avg_days_from_signup_to_first_recorded_event
FROM
    `mycoursera-508117.product_analysis.users` AS u
INNER JOIN
    first_activity AS f
    ON u.user_id = f.user_id;



/* 8. Do Paid Users Use the Product Differently from Free Users?

Objective: Compare user activity and engagement between Free and Paid subscription plans.*/

SELECT
    s.subscription_plan,
    COUNT(DISTINCT s.user_id) AS total_users,
    COUNT(e.user_id) AS total_events,
    COUNT(DISTINCT e.user_id) AS active_users,
    ROUND(
        SAFE_DIVIDE(
            COUNT(e.user_id),
            COUNT(DISTINCT e.user_id)
        ),
        2
    ) AS avg_events_per_active_user
FROM
    `mycoursera-508117.product_analysis.subscriptions` AS s
LEFT JOIN
    `mycoursera-508117.product_analysis.events` AS e
    ON s.user_id = e.user_id
GROUP BY
    s.subscription_plan
ORDER BY
    avg_events_per_active_user DESC;

/* 9. Which Features Are Used by Free and Paid Users?

Objective: Compare how users on Free and Paid plans interact with different TaskFlow features.*/

SELECT
    s.subscription_plan,
    e.event_name,
    COUNT(DISTINCT e.user_id) AS unique_users,
    COUNT(*) AS total_events
FROM
    `mycoursera-508117.product_analysis.subscriptions` AS s
INNER JOIN
    `mycoursera-508117.product_analysis.events` AS e
    ON s.user_id = e.user_id
GROUP BY
    s.subscription_plan,
    e.event_name
ORDER BY
    e.event_name,
    s.subscription_plan;


