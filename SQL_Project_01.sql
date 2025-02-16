--0. Xem tên các cột
PRAGMA table_info(botswana_bank_customer_churn);
--1. Có bao nhiêu khách hàng trong dataset?
SELECT COUNT(*) AS q1
FROM botswana_bank_customer_churn
--2. Tỷ lệ nam/nữ trong dataset là bao nhiêu?
SELECT gender,COUNT(*) as q2
FROM botswana_bank_customer_churn
GROUP BY gender
--3  Độ tuổi trung bình của khách hàng theo giới tính là bao nhiêu?
SELECT AVG(strftime('%Y','now') - SUBSTR(date_of_birth,1,4)) AS avg_age
FROM botswana_bank_customer_churn 
GROUP BY gender
--4 Phân bố số dư tài khoản của khách hàng như thế nào?
SELECT
	CASE 
    	WHEN balance < 20000 THEN 'Low Balance'
    	WHEN balance BETWEEN 20000 and 220000 Then 'Medium Balance'
    ELSE 'High Balance' 
    END AS Balance_Category,
    COUNT (*) as Total_Customers
FROM botswana_bank_customer_churn
GROUP BY Balance_Category
--5 Phân khúc khách hàng nào chiếm tỷ lệ cao nhất?
SELECT customer_segment, COUNT(*) AS Total, 
       ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM botswana_bank_customer_churn), 2) AS Percentage
FROM botswana_bank_customer_churn 
GROUP BY customer_segment 
ORDER BY Total DESC;
