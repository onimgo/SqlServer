8文字以上の数字があり、4文字以降は...にしたい
  文字数を取ってきて、4文字だけとり、....を結合
未来の日付のデータを取ってくるには
  現在の日付 < 未来の日付
メールアドレス jp など下2桁を取ってくるにわ
  TRIM(メールアドレス) ,
  SUBSTRING(TRIM(メールアドレス) , -1 ,2),
  LEN(TRIM(メールアドレス)),
  SUBSTRING(TRIM(メールアドレス) , LEN(TRIM(メールアドレス)) - 1 , 2) --これ
年齢を〇年代を求めたい
  SELECT
    TRIM(メールアドレス) ,
    CASE
      WHEN 年齢 >= 20 AND 年齢 < 30 THEN '20代'
      WHEN 年齢 >= 30 AND 年齢 < 40 THEN '30代'
      WHEN 年齢 >= 40 AND 年齢 < 50 THEN '40代'
      WHEN 年齢 >= 50 AND 年齢 < 60 THEN '40代'
    ELSE 'NULL'
    END
    + ' : ' +
    CASE WHEN 性別 = 'M' THEN '男性' ELSE '女性' END
  FROM
    回答者
重複した値を取り除いた集計
  SELECT
    COUNT(DISTINCT 費目),
    SUM(DISTINCT 費目).
    AVG(DISTINCT 費目)
  FROM
    家計簿
NULL があったら COALESCE() を使え

COALESCE() 計算したい時は 0 。 nullを別の値にする。

すべての値と一致しない事を判定
  NOT IN と <>ALL
いずれかの値と一致する事を判定
  IN と =ANY

副問い合わせ NULLを除外
  絞り込み条件に IS NOT NULL --NULLじゃない値
  COALESCE() を使え
