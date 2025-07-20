--- Create table & Insert dummy data

CREATE TABLE Category (
	Category_id VARCHAR(2),
	Category_name VARCHAR(100),
	Parent_id VARCHAR(2)
);
---
INSERT INTO Category (Category_id, Category_name, Parent_id) VALUES
(1, 'Electronics', NULL),
(2, 'Clothing', NULL),
(3, 'Phones', 1),
(4, 'Laptops', 1),
(5, 'Men', 2),
(6, 'Women', 2),
(7, 'Smartphones', 3),
(8, 'Feature Phones', 3),
(9, 'Gaming Laptops', 4),
(10, 'Ultrabooks', 4),
(11, 'Shirts', 5),
(12, 'Dresses', 6);