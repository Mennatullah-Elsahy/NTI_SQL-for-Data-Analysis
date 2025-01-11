-- If you want to "store" the query permanently for use in other queries, you can create a VIEW.
-- A VIEW is a reusable query definition that can be referenced like a table in subsequent queries.
-- It does not store the data physically; instead, it dynamically retrieves data from the underlying tables whenever the VIEW is queried.
-- Creating a VIEW allows you to reuse complex queries and simplify the code.


-- Define a VIEW named 'hotels' that combines data from three tables (2018, 2019, 2020):
CREATE VIEW dbo.Hotels AS
SELECT * FROM dbo.['2018']
UNION
SELECT * FROM dbo.['2019']
UNION
SELECT * FROM dbo.['2020'];

-- Now, we can query the 'Hotels' view as if it's a table.
SELECT * FROM Hotels;

-- Q1: What is the total number of nights stayed by guests?
SELECT stays_in_weekend_nights + stays_in_week_nights
FROM Hotels

-- Renames the result as 'TotalStays' using the 'AS' keyword for better clarity.
SELECT stays_in_weekend_nights + stays_in_week_nights AS TotalStays
FROM Hotels

--Q2: How much revenue did each stay generate?
SELECT(stays_in_weekend_nights + stays_in_week_nights)*adr AS Revenue
FROM Hotels

--Q3: What was the yearly total revenue from both weekend and weekday stays?
SELECT arrival_date_year,arrival_date_month,
(stays_in_weekend_nights + stays_in_week_nights)*adr AS Revenue
FROM Hotels

--Q5: What is the total revenue generated for all stays in the data(years--> 2018, 2019, and 2020)?
SELECT SUM((stays_in_weekend_nights + stays_in_week_nights)*adr) AS Revenue
FROM Hotels

--Round the total revenue to the nearest integer for easier reporting
SELECT ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),0) AS Revenue
FROM Hotels

--Q6: What was the total revenue per year?
SELECT arrival_date_year,
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),0) AS Revenue -- rounded to the nearest integer
FROM Hotels
GROUP BY arrival_date_year

-- Total Revenue per year, broken down by hotel type
SELECT arrival_date_year,hotel,
ROUND(SUM((stays_in_weekend_nights + stays_in_week_nights)*adr),0) AS Revenue
FROM Hotels
GROUP BY arrival_date_year,hotel

-- Adding meal cost and market segment information using JOIN
SELECT *
FROM Hotels 
LEFT JOIN dbo.meal_cost
ON Hotels.meal = dbo.meal_cost.meal
LEFT JOIN dbo.market_segment
ON Hotels.market_segment = dbo.market_segment.market_segment

-- Answer the following with queries, and create 5 additional questions of your own, answering them with queries as well.

-- Q1: What is the profit percentage for each month across all years?

-- Q2: Which meals and market segments (e.g., families, corporate clients, etc.) contribute the most to the total revenue for each hotel annually?

-- Q3: How does revenue compare between public holidays and regular days each year?

-- Q4: What are the key factors (e.g., hotel type, market type, meals offered, number of nights booked) significantly impact hotel revenue annually?

-- Q5: Based on stay data, what are the yearly trends in customer preferences for room types (e.g., family rooms vs. single rooms), and how do these preferences influence revenue?


