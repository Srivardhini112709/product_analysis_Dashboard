with cte as (
SELECT 
a.Product,
a.Category,
a.Brand,
a.Description,
a.sale_Price,
a.Cost_Price,
a.Image_url,
b.Date,
b.Customer_Type,
b.Discount_Band,
b.units_sold,
(sale_price*Units_Sold) as revenue,
(Cost_Price*Units_Sold) as total_cost,
FORMAT(date,'MMMM') as month,
format (date,'yyyy') as year
FROM product_data a
join product_sales b
on a.Product_ID = b.product)


select 
* ,
(1-discount*1.0/100) * revenue as discount_revenue
from cte a
join discount_data b
on a.discount_band = b.Discount_Band  and a.month = b.month
