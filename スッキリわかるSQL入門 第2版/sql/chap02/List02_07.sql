SELECT 費目 AS ITEM, 入金額 AS RECEIVE, 出金額 AS PAY
  FROM 家計簿 AS MONEYBOOK
 WHERE 費目 = '給料'
