--- Create table & Insert dummy data

CREATE TABLE Distribution (
	ID VARCHAR(2),
	NAME VARCHAR(50),
	PARENT_ID VARCHAR(2) NULL,
	SALES DECIMAL(10,2)
);
--
INSERT INTO distribution (ID, NAME, PARENT_ID, SALES) VALUES
(1, 'GlobalCorp', NULL, 100000.00),
(2, 'AsiaGroup', NULL, 85000.00),
(3, 'VNBranch', 1, 40000.00),
(4, 'JapanBranch', 1, 30000.00),
(5, 'ThaiBranch', 2, 25000.00),
(6, 'SGBranch', 2, 20000.00),
(7, 'HanoiTeam', 3, 15000.00),
(8, 'HCMTeam', 3, 12000.00),
(9, 'TokyoTeam', 4, 11000.00),
(10, 'OsakaTeam', 4, 10000.00),
(11, 'BKKTeam', 5, 8000.00),
(12, 'ChiangmaiTeam', 5, 7000.00);

-- Tính tổng doanh số của đại lý và các đại lý con