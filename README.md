## SQL Project 01 📌 Về Bộ Dữ Liệu  
Bộ Dữ Liệu Khách Hàng Rời Bỏ Ngân Hàng Botswana  

### 1️⃣ Tổng Quan Về Dữ Liệu  
Bộ dữ liệu tổng hợp này mô phỏng thông tin khách hàng của một ngân hàng giả lập tại Botswana, được thiết kế đặc biệt để phân tích hành vi rời bỏ ngân hàng (customer churn).  

**Dữ liệu bao gồm:**  
- Thông tin nhân khẩu học của khách hàng  
- Dữ liệu tài chính  
- Mức độ sử dụng sản phẩm ngân hàng  
- Các chỉ số hành vi có thể ảnh hưởng đến quyết định rời bỏ ngân hàng

Bộ dữ liệu này được tạo bằng thư viện **Python Faker**, đảm bảo dữ liệu trông thực tế nhưng hoàn toàn giả lập, phù hợp cho mục đích **giáo dục, kiểm thử và mô hình hóa dữ liệu**.  

### 2️⃣ Đặc Điểm Nổi Bật Của Dữ Liệu  
- **Số lượng bản ghi:** 115,640 khách hàng  
- **Tỷ lệ rời bỏ:** Xác định dựa trên một thang điểm rủi ro churn được tính toán từ nhiều thuộc tính khách hàng  
- **Phạm vi địa lý:** Botswana  
- **Cấu trúc dữ liệu:** Dữ liệu được tổ chức theo dạng bảng, mỗi dòng tương ứng với một khách hàng duy nhất  

### 3️⃣ Ứng Dụng Của Bộ Dữ Liệu  
Bộ dữ liệu này có thể được sử dụng trong nhiều bài toán phân tích và mô hình hóa dữ liệu:  

✅ **Dự đoán khách hàng rời bỏ (Churn Prediction Modeling):** Xây dựng và đánh giá mô hình **machine learning** để dự đoán khả năng khách hàng rời bỏ ngân hàng.  
✅ **Phân khúc khách hàng (Customer Segmentation):** Phân tích **hồ sơ khách hàng** và phân loại theo các tiêu chí nhân khẩu học, tài chính, hành vi sử dụng sản phẩm.  
✅ **Phân tích sản phẩm (Product Analysis):** Tìm hiểu xem sản phẩm/dịch vụ nào có ảnh hưởng đến **việc giữ chân hay làm mất khách hàng**.  

## 📌 Các Truy Vấn SQL Phân Tích Dữ Liệu Botswana Bank

### 🔹 0. Xem tên các cột
```sql
PRAGMA table_info(botswana_bank_customer_churn);
SELECT COUNT(*) AS q1
FROM botswana_bank_customer_churn;
🔹 1. Có bao nhiêu khách hàng trong dataset?
SELECT COUNT(*) AS q1
FROM botswana_bank_customer_churn;

🔹 2. Tỷ lệ nam/nữ trong dataset là bao nhiêu?
SELECT gender, COUNT(*) as q2
FROM botswana_bank_customer_churn
GROUP BY gender;

🔹 3. Độ tuổi trung bình của khách hàng theo giới tính là bao nhiêu?
SELECT gender, AVG(strftime('%Y', 'now') - SUBSTR(date_of_birth, 1, 4)) AS avg_age
FROM botswana_bank_customer_churn 
GROUP BY gender;

🔹 4. Phân bố số dư tài khoản của khách hàng như thế nào?
SELECT
    CASE 
        WHEN balance < 20000 THEN 'Low Balance'
        WHEN balance BETWEEN 20000 AND 220000 THEN 'Medium Balance'
        ELSE 'High Balance' 
    END AS Balance_Category,
    COUNT(*) as Total_Customers
FROM botswana_bank_customer_churn
GROUP BY Balance_Category;

🔹 5. Phân khúc khách hàng nào chiếm tỷ lệ cao nhất?
SELECT customer_segment, COUNT(*) AS Total, 
       ROUND(100 * COUNT(*) / (SELECT COUNT(*) FROM botswana_bank_customer_churn), 2) AS Percentage
FROM botswana_bank_customer_churn 
GROUP BY customer_segment 
ORDER BY Total DESC;

