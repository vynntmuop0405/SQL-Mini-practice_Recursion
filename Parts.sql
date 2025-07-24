--- Create table & Insert dummy data

CREATE TABLE Parts (
	Part_id VARCHAR(2),
	Part_name VARCHAR(50),
	Parent_part_id VARCHAR(2)
);

INSERT INTO Parts (Part_id, Part_name, Parent_part_id) VALUES
(1, 'ProductA', NULL),
(2, 'Assembly1', 1),
(3, 'Assembly2', 1),
(4, 'Part1', 2),
(5, 'Part2', 2),
(6, 'Part3', 3),
(7, 'SubAssembly1', 3),
(8, 'Part4', 7);

--- Truy vết nguồn gốc sản phẩm
WITH Part_hierachy AS (
	SELECT part_id, part_name, parent_part_id, 0 LEVEL
	FROM Parts
	WHERE parent_part_id IS NULL
	UNION ALL
	SELECT a.part_id, a.part_name, a.parent_part_id, b.level+1
	FROM Parts a
	JOIN Part_hierachy b ON a.parent_part_id = b.part_id
)
SELECT * FROM Part_hierachy
ORDER BY 1