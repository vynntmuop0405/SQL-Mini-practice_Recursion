    -- Cộng dồn Sales toàn bộ nhánh (bao gồm con cháu)

With distribution_hierachy AS 
( SELECT id, name, parent_id, sales, id as root_id
  FROM distribution
  WHERE parent_id IS NULL
  UNION ALL
  SELECT a.id, a.name, a.parent_id, a.sales, b.root_id
  FROM distribution a
  INNER JOIN distribution_hierachy b ON a.parent_id = b.id
)
--SELECT * FROM distribution_hierachy
-- Đoạn này em đang chưa hiểu chỗ nếu lấy phần bảng trước UNION ALL
-- thì nó chỉ có 2 ID 1,2 thì sao bảng con có parent lên tới 3,4,5 JOIN được, em chưa tưởng tượng được
SELECT a.root_id AS distribution_id, b.name Distribution_name,
	   SUM(a.sales) Total_sales_include_children
FROM distribution_hierachy a
JOIN distribution b ON a.root_id = b.id
GROUP BY a.root_id, b.name

    -- Đếm số lượng con cháu mỗi Distributor (tương tự bài trên)
    
With distribution_hierachy AS 
( SELECT id, name, parent_id, sales, id AS root_id
  FROM distribution
  WHERE parent_id IS NULL
  UNION ALL
  SELECT a.id, a.name, a.parent_id, a.sales, b.root_id
  FROM distribution a
  INNER JOIN distribution_hierachy b ON a.parent_id = b.id
)
--SELECT * FROM distribution_hierachy
SELECT a.root_id, b.name Distribution_name, 
	   COUNT(a.root_id)-1 AS count_children
FROM distribution_hierachy a
JOIN distribution b ON a.root_id = b.id
GROUP BY a.root_id, b.name
