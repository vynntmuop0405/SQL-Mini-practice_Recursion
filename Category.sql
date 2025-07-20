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

--- Truy vết nguồn gốc sản phẩm
WITH Category_hierachy AS (
--Anchor: Danh mục gốc
	SELECT *, 0 AS Level
	FROM Category
	WHERE Parent_id IS NULL
	UNION ALL
--Recursive: Nối con
	SELECT a.Category_id, a.Category_name, a.Parent_id, b.Level+1 AS Level
	FROM Category a
	JOIN Category_hierachy b ON a.Parent_id = b.Category_id
)
SELECT * FROM Category_hierachy
ORDER BY Level, Category_id