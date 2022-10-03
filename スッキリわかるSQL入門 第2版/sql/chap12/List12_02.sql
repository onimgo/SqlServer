/* 利用者と費目別の入出金統計を見るには */
SELECT U.利用者名 , H.費目名 , S.合計金額
  FROM (SELECT K.利用者ID, M.費目ID, SUM(M.金額) AS 合計金額
          FROM 入出金明細 AS M
          JOIN 費目 AS H
            ON M.費目ID = H.費目ID
          JOIN 入出金行為 AS K
            ON M.入出金行為ID = K.入出金行為ID
         GROUP BY K.利用者ID, M.費目ID) AS S
  JOIN 利用者 AS U
    ON S.利用者ID = U.利用者ID
  JOIN 費目 AS H
    ON S.費目ID = H.費目ID
