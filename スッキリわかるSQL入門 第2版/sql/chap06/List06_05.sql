/* NULL をゼロに変換した上で平均するサンプル */
SELECT AVG(COALESCE(出金額, 0)) AS 出金額の平均
  FROM 家計簿