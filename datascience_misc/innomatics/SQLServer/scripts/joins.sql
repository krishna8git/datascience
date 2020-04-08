SELECT * FROM production.categories

SELECT * FROM production.products

-- Inner Join
SELECT t1.product_name, t2.category_name, t1.model_year, t1.list_price 
FROM production.products as t1 INNER JOIN production.categories as t2
ON t1.category_id = t2.category_id
ORDER BY t1.model_year

-- LEFT (Preference given to the left table)
SELECT * FROM sales.order_items

SELECT COUNT(*) from sales.order_items

SELECT COUNT(*) FROM production.products

SELECT * from sales.order_items as t1 LEFT JOIN production.products as t2
ON t1.product_id = t2.product_id
ORDER BY T2.PRODUCT_ID

-- RIGHT (Preference given to the right table)
SELECT * from sales.order_items as t1 RIGHT JOIN production.products as t2
ON t1.product_id = t2.product_id
ORDER BY T1.PRODUCT_ID

-- Outer Join (entries from both the tables are brought)
SELECT * FROM SALES.orders

SELECT * FROM SALES.order_items

SELECT 
	c.customer_id as CustomerID, 
    CONCAT(first_name , ' ', last_name) as CustomerName,
	YEAR(o.order_date) as Year
FROM
	sales.orders AS o LEFT JOIN sales.customers as c 
ON c.customer_id = o.customer_id


SELECT *, YEAR(order_date) as order_year FROM Sales.orders

-- No of orders by a customer
SELECT 
	count(order_id) as [No. of Orders],
	YEAR(order_date) as Order_Year
FROM sales.orders
GROUP BY YEAR(order_date)

-- No Of Order for the customer
SELECT 
	count(o.order_id) as [No. of Orders],
	c.first_name + ' ' + c.last_name as fullname
FROM
	sales.orders as o
LEFT JOIN
	sales.customers as c
ON
	c.customer_id = o.customer_id
GROUP BY c.first_name + ' ' + c.last_name

-- No of orders for the customer in a particular year
SELECT 
	count(o.order_id) as [No. of Orders],
	c.first_name + ' ' + c.last_name as fullname,
	YEAR(o.order_date) as Order_Year
FROM
	sales.orders as o
LEFT JOIN
	sales.customers as c
ON
	c.customer_id = o.customer_id
GROUP BY c.first_name + ' ' + c.last_name, YEAR(o.order_date)

SELECT * FROM
(SELECT 
	c.first_name + ' ' + c.last_name as fullname,
	YEAR(o.order_date) as Order_Year,
	count(o.order_id) as [No. of Orders]
FROM
	sales.orders as o
LEFT JOIN
	sales.customers as c
ON
	c.customer_id = o.customer_id
GROUP BY c.first_name + ' ' + c.last_name, YEAR(o.order_date)) as sql
WHERE [No. of Orders] > 1


SELECT 
	c.first_name + ' ' + c.last_name as fullname,
	YEAR(o.order_date) as Order_Year,
	count(o.order_id) as [No. of Orders]
INTO #temp
FROM
	sales.orders as o
LEFT JOIN
	sales.customers as c
ON
	c.customer_id = o.customer_id
GROUP BY c.first_name + ' ' + c.last_name, YEAR(o.order_date)

SELECT * FROM #temp WHERE [No. of Orders] > 1


