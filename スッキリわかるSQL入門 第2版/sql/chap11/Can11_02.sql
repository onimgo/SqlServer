CREATE VIEW 費目名付き家計簿 AS
SELECT * FROM 家計簿
  JOIN 費目
    ON 家計簿.費目ID = 費目.ID