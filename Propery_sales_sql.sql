-- Q1. Which are the top 10 cities by average purchase price?
SELECT 
          city,
          AVG(purchase_price) AS avg_purchase_price
FROM property_sales
GROUP BY city
ORDER BY avg_purchase_price DESC
LIMIT 10;


-- Q2. What is the average sqm price for each region?
SELECT 
	region,
    AVG(sqm_price) AS avg_sqm_price,
    COUNT(*) AS num_sales
FROM property_sales
GROUP BY region
ORDER BY avg_sqm_price DESC;

-- Q3. How do average purchase prices trend across quarters in each year?
SELECT
	YEAR(date) AS Year,
    quarter AS Quarter,
    AVG(purchase_price) AS avg_price
FROM property_sales
GROUP BY YEAR(date), quarter
ORDER BY Year DESC;

-- Q4. Which quarter consistently shows the highest sales volume?
SELECT
	YEAR(date) AS Year,
    quarter AS Quarter,
    SUM(purchase_price) AS sale_volume,
    COUNT(*) AS total_sale
FROM property_sales
GROUP BY YEAR(date), quarter
ORDER BY sale_volume DESC;


-- Q5. Which house type has the highest average purchase price?

SELECT
	house_type AS House_Type,
    AVG(purchase_price) AS Purchase_Price
FROM property_sales
GROUP BY house_type
ORDER BY Purchase_Price DESC
LIMIT 1;

-- Q6. How does the number of rooms affect the average purchase price?
SELECT
	no_rooms AS Number_of_rooms,
    AVG(purchase_price) AS avg_price
FROM property_sales
GROUP BY no_rooms;

-- Q7. What is the average sqm price for each build_era category?
SELECT
	build_era AS Build_Era,
    AVG(sqm_price) AS avg_sqm_price
FROM property_sales
GROUP BY build_era;

-- Q8. Which city has the highest average sqm for villas?
SELECT
	city,
    AVG(sqm) as avg_sqm
FROM property_sales
WHERE house_type  =  'villa'
GROUP BY city
ORDER BY avg_sqm DESC
LIMIT 1;

-- Q9. How does average sqm_price vary by house type across different build_eras?
SELECT
	build_era,
    house_type,
    AVG(sqm_price) as avg_sqm_price
FROM property_sales
GROUP BY build_era, house_type
ORDER BY build_era, house_type;


-- Q10. How have average purchase prices trended alongside nominal interest rates over quarters?
SELECT
    YEAR(date) AS Year,
    quarter AS Quarter,
    AVG(`nom_interest_rate%`) AS Nominal_interest_rate,
    AVG(purchase_price) AS avg_price
FROM property_sales
GROUP BY YEAR(date), quarter
ORDER BY Year ASC, Quarter ASC;


-- Q11. What is the correlation between real interest rates and average sqm_price per quarter?
SELECT
	Year(date) AS Year,
    quarter AS Quarter,
    AVG(real_interest_rate) AS real_interest_rate,
    AVG(sqm_price) AS avg_sqm_price
FROM property_sales
GROUP BY Year(date), quarter;

-- Q12. How have prices moved during periods of high inflation vs low inflation?
SELECT
	inflation,
    AVG(purchase_price) AS avg_price,
    COUNT(*) AS total_sales
FROM (
    SELECT
	purchase_price,
    house_id,
    CASE
    	WHEN `dk_ann_infl_rate%` < 1.5 THEN 'Lower inflation'
        WHEN `dk_ann_infl_rate%`BETWEEN 1.5 AND 3 THEN 'Moderate inflation'
        ELSE 'Higher inflation'
	END AS inflation
FROM property_sales) AS infl_table
GROUP BY inflation;


-- Q13. What is the average offer-to-purchase discount percentage by region?
SELECT
	region,
    AVG(`%_change_between_offer_and_purchase`) as avg_offer_to_purchase_discount
FROM property_sales
GROUP BY region;

-- Q14. Which 5 cities have the highest average negotiation gap?

SELECT
	city,
    ROUND(negotiation_gap,2) AS negotiation_gap
FROM property_sales
ORDER BY negotiation_gap ASC
LIMIT 5;


-- Q15. How does negotiation gap vary across price segments?
SELECT
	price_segment,
    ROUND(AVG(negotiation_gap),2) AS negotiation_gap
FROM property_sales
GROUP by price_segment
ORDER BY avg_negotiation_gap ASC;

-- Q16. Rank cities by Year-over-Year Growth

SELECT
    city,
    Year,
    current_year_avg,
    next_year_avg,
    ((next_year_avg - current_year_avg) / current_year_avg) * 100 AS percent_price_change_to_next_year
FROM (
    SELECT
        city,
        Year,
        current_year_avg,
        LEAD(current_year_avg) OVER (PARTITION BY city ORDER BY Year) AS next_year_avg
    FROM (
        SELECT
            city,
            YEAR(date) AS Year,
            AVG(purchase_price) AS current_year_avg
        FROM property_sales
        GROUP BY city, YEAR(date)
        HAVING COUNT(*) > 50
    ) AS grouped_prices
) AS final_trends;


-- Q17. List property that sold above their city's average sqm_price and atleast 20% margin
SELECT 
    house_id,
    city,
    sqm_price,
    city_avg_sqm_price
FROM (
    SELECT 
        house_id,
        city,
        sqm_price,
        AVG(sqm_price) OVER(PARTITION BY city) AS city_avg_sqm_price
    FROM property_sales
) AS price_analysis
WHERE sqm_price > (city_avg_sqm_price * 1.20)
ORDER BY city ASC, sqm_price DESC;





-- Q18. Which house type gives best value?

SELECT
	house_type AS House_Type, 
    COUNT(*) AS Total_Sales,
    ROUND(AVG(purchase_price),0) AS avg_price,
    ROUND(AVG(sqm_price),0) AS avg_sqm_price,
    ROUND(AVG(no_rooms),1) AS avg_rooms_count,
    ROUND(AVG(purchase_price)/ AVG(no_rooms),0) AS avg_price_per_room
FROM property_sales
GROUP BY house_type
ORDER BY avg_sqm_price ASC;





