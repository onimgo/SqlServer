SELECT 費目,
       SUM(出金額) AS 合計額,
       COUNT(出金額) AS 回数
  FROM 家計簿
 WHERE 出金額 > 0
 GROUP BY 費目
HAVING COUNT(出金額) >= 5
   AND 費目 IN ('食費', '居住費')  -- データ絞り込み条件
