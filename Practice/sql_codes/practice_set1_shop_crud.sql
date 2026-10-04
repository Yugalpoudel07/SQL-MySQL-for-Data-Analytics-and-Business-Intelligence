-- SQL Practice Set 1 - Shop Database (CRUD)
-- Run in MySQL Workbench (MySQL 8)

-- ------------------------------------------------------------
-- 1. Create the shop database and the products table exactly as shown.
-- Confirm with SHOW TABLES;.
-- ------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS shop;
CREATE DATABASE shop;
USE shop;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    pname VARCHAR(50),
    price INT,
    category VARCHAR(30),
    stock INT
);

SHOW TABLES;

-- ------------------------------------------------------------
-- 2. Insert all 6 products in one single INSERT statement.
-- ------------------------------------------------------------
INSERT INTO products VALUES
(1, 'Rice Bag', 2200, 'Grocery', 50),
(2, 'Laptop', 85000, 'Electronics', 10),
(3, 'Mobile', 30000, 'Electronics', 25),
(4, 'Noodles', 25, 'Grocery', 500),
(5, 'Shampoo', 350, 'Beauty', 80),
(6, 'TV', 55000, 'Electronics', 8);

SELECT * FROM products;

-- ------------------------------------------------------------
-- 3. Insert product 7, giving only product id and pname ('Pen'). Which
-- columns become NULL?
-- ------------------------------------------------------------
INSERT INTO products (product_id, pname) VALUES (7, 'Pen');

SELECT * FROM products WHERE product_id = 7;

-- Answer: price, category and stock become NULL because no value was given for
-- them.

-- ------------------------------------------------------------
-- 4. Try to insert another product with product id = 3. Write down the
-- exact error and explain why it happened.
-- ------------------------------------------------------------
-- This line gives an error on purpose (duplicate primary key).
-- Remove the "-- " to run it.
-- INSERT INTO products VALUES (3, 'Headphones', 2500, 'Electronics', 15);

-- Answer: Error Code: 1062. Duplicate entry '3' for key 'products.PRIMARY'. It
-- happened because product_id is the primary key, so it must be unique.
-- Product id 3 (Mobile) already exists.

-- ------------------------------------------------------------
-- 5. Insert two more products of your choice in one statement: one
-- Grocery item and one Beauty item.
-- ------------------------------------------------------------
INSERT INTO products VALUES
(8, 'Biscuits', 50, 'Grocery', 200),
(9, 'Face Cream', 450, 'Beauty', 60);

SELECT * FROM products;

-- ------------------------------------------------------------
-- 6. Show all columns of all products.
-- ------------------------------------------------------------
SELECT * FROM products;

-- ------------------------------------------------------------
-- 7. Show only pname and price.
-- ------------------------------------------------------------
SELECT pname, price FROM products;

-- ------------------------------------------------------------
-- 8. Show products with price above 1000.
-- ------------------------------------------------------------
SELECT * FROM products WHERE price > 1000;

-- ------------------------------------------------------------
-- 9. Show Electronics products with stock less than 20 (AND).
-- ------------------------------------------------------------
SELECT * FROM products
WHERE category = 'Electronics' AND stock < 20;

-- ------------------------------------------------------------
-- 10. Show products that are Grocery or cost less than 500 (OR).
-- ------------------------------------------------------------
SELECT * FROM products
WHERE category = 'Grocery' OR price < 500;

-- ------------------------------------------------------------
-- 11. Show products in categories Grocery and Beauty, using IN.
-- ------------------------------------------------------------
SELECT * FROM products
WHERE category IN ('Grocery', 'Beauty');

-- ------------------------------------------------------------
-- 12. Show products with price between 300 and 40000. Is 350 included?
-- Why?
-- ------------------------------------------------------------
SELECT * FROM products
WHERE price BETWEEN 300 AND 40000;

-- Answer: Yes, 350 (Shampoo) is included because BETWEEN is inclusive. It counts
-- both end values and everything in between.

-- ------------------------------------------------------------
-- 13. Show products whose name starts with M.
-- ------------------------------------------------------------
SELECT * FROM products WHERE pname LIKE 'M%';

-- ------------------------------------------------------------
-- 14. Show products whose name contains the letter o.
-- ------------------------------------------------------------
SELECT * FROM products WHERE pname LIKE '%o%';

-- ------------------------------------------------------------
-- 15. Show the 2 most expensive products (which two keywords together?).
-- ------------------------------------------------------------
SELECT * FROM products
ORDER BY price DESC
LIMIT 2;

-- Answer: ORDER BY price DESC and LIMIT 2 used together.

-- ------------------------------------------------------------
-- 16. The Laptop price dropped to 79000. Update it using its id.
-- ------------------------------------------------------------
UPDATE products SET price = 79000 WHERE product_id = 2;

SELECT * FROM products WHERE product_id = 2;

-- ------------------------------------------------------------
-- 17. Festival offer: reduce the price of every Electronics product by
-- 10%. Hint: SET price = price * 0.9.
-- ------------------------------------------------------------
UPDATE products
SET price = price * 0.9
WHERE category = 'Electronics';

SELECT * FROM products WHERE category = 'Electronics';

-- ------------------------------------------------------------
-- 18. Ten Rice Bags were sold. Decrease its stock by 10 with one query.
-- ------------------------------------------------------------
UPDATE products SET stock = stock - 10 WHERE product_id = 1;

SELECT * FROM products WHERE product_id = 1;

-- ------------------------------------------------------------
-- 19. Delete the product named Pen. Then delete all products with stock
-- below 10. How many rows did each query remove?
-- ------------------------------------------------------------
DELETE FROM products WHERE pname = 'Pen';
DELETE FROM products WHERE stock < 10;

SELECT * FROM products;

-- Answer: Each query removed 1 row. The first removed Pen (id 7) and the second
-- removed TV, the only product with stock below 10.

-- ------------------------------------------------------------
-- 20. Run SELECT to check the final table. Then answer: which command
-- would empty the table but keep it, and which would remove the table
-- completely?
-- ------------------------------------------------------------
SELECT * FROM products;

-- Answer: TRUNCATE TABLE products; (or DELETE FROM products;) empties the table
-- but keeps it. DROP TABLE products; removes the rows and the table
-- completely.
