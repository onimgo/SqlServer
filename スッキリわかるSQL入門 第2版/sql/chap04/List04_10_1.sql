-- LIMITの利用
--（Db2、MySQL、PostgreSQL、SQLite、H2 Database）
SELECT 費目, 出金額
  FROM 家計簿
 ORDER BY 出金額 DESC LIMIT 3
