条件式
  出金額>0
計算式
  出金額 + 100

選択列リスト
SELECT  ---選択列リストはここのこと


DBMDの処理の原則
注目している行の上から1行ずつ順番に処理している

ユーザ定義関数
  関数を自分で作り、SQL文からのその関数を呼ぶ出す。

ストアドプロシージャ
  実行する複数のSQL文をまとめ、DBMSに保存し、データベースの外部から呼び出すもの。

演算子 文字列、数字、日付
+
-
*
/

IN ある数が複数の値のどれかと等しいか
ANY 複数の値の大小を比較 ANY(1000,2000,3000) --OR
ALL 複数の値の大小を比較 ALL(1000,2000,3000) --AND

LIKE は WHERE の中でしか使えない。
集計関数は SELECT, HAVING, ORDER BY の中で使用可


5-1
-- 出金額カラムの値を+100する。
UPDATE 家計簿
SET 出金額 = 出金額+100

SELECT
  *
  FROM
    家計簿

-- カラムの文字の値から、カラムを分類したい時
SELECT
  費目,
  出金額,
  CASE 費目 WHEN '移住費' THEN '固定費'
            WHEN '水道光熱費' THEN '固定費'
    ELSE '変動費'
    END AS '出費の分類'
FROM 家計簿
WHERE
  出金額 > 0
-- 数字を見て金額を分類したい時
SELECT
  費目,
  入金額,
  CASE WHEN 入金額 < 5000 THEN 'お小遣い'
      WHEN 入金額 < 1000000 THEN '一時収入'
      WHEN 入金額 < 300000 THEN '給料出たー!'
    ELSE '想定外の収入です!'
    END AS '収入の分類'
FROM 家計簿
WHERE
  入金額 > 0

SELECT
  メモ,
  -- 文字列に関わる関数
  LEN(メモ) AS 'メモLEN',
  TRIM(メモ) AS 'メモTRIM',
  RTRIM(メモ) AS 'メモRTRIM',
  LTRIM(メモ) AS 'メモLTRIM',
  REPLACE(メモ,'購入','買った') AS 'メモREPLACE', -- 文字列置換 購入 を 買った　に置換
  SUBSTRING(メモ,1,3) AS 'メモSUBSTRING',-- 1から3文字目の文字を取得
  CONCAT(メモ,' : ',費目) AS 'メモCONCAT', --メモカラムと費目カラムの値を連結
  --数字にまつわる関数
  ROUND(出金額,-2) AS '百円単位の出金額', --下2桁から四捨五入
  POWER(出金額,2) AS 'べき乗', -- 2乗
  -- 日付にまつわる関数
  GETDATE() AS '現在のシステム日付', -- 現在のシステム日付を取得
  -- 変換にまつわる関数
  CAST(出金額 AS VARCHAR(10)) + '円' AS 'データ型変換と文字列連結',
  -- カラムでNULL(未登録)の時はこの値をさらにこの値を返してね。
  COALESCE(メモ,'NULLの時に置き換えたい文字です') AS 'COALESCE'
FROM
  家計簿

SELECT
  *
FROM
  家計簿
WHERE
  SUBSTRING(費目,1,3) LIKE '%費%'



SELECT
  *
FROM
  試験結果


SELECT
  受験者ID
FROM
  試験結果
WHERE
  午前 >= 60
 AND
  午後1 + 午後2 >= 120
 AND
  論述 >= (午前+午後1+午後2+論述) * 0.3


SELECT
  受験者ID,
  CASE WHEN
      午前 >= 60
 AND
  午後1 + 午後2 >= 120
 AND
  論述 >= (午前+午後1+午後2+論述) * 0.3
  THEN
    受験者ID
  ELSE
    '不合格'
  END AS '合格者'
FROM
  試験結果


SELECT
  *
FROM
  回答者

SELECT
  TRIM(メールアドレス) ,
  SUBSTRING(TRIM(メールアドレス) , -1 ,2),
  LEN(TRIM(メールアドレス)),
  SUBSTRING(TRIM(メールアドレス) , LEN(TRIM(メールアドレス))-1 ,2)
FROM
  回答者

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


SELECT
  *
FROM
  受注

SELECT
  LEN(TRIM(文字)),
  LEN(REPLACE(文字,'',''))
FROM
  受注


SELECT
    受注日,
    受注ID,
    文字数,
    CASE COALESCE(書体コード, '1')
        WHEN '1' THEN 'ブロック体'
        WHEN '2' THEN '筆記体'
        WHEN '3' THEN '草書体'
    END AS 書体名,
    CASE COALESCE(書体コード, '1')
        WHEN '1' THEN 100
        WHEN '2' THEN 150
        WHEN '3' THEN 200
    END AS 単価,
    CASE
        WHEN 文字数 > 10 THEN 500
        ELSE 0
    END AS 特別加工料
FROM
    受注
ORDER BY
    受注日,
    受注ID


集計関数 SUM,MIN,MAX,AVG
  使用したら結果表は必ず1行になるよ。

COUNT (*) --検索結果の行数　NULLの行を含める
COUNT (列) --検索結果の指定列に関する行数 NULLの行を無視する



SELECT
  SUM(降水量) AS '年間降水量',
  AVG(最高気温) AS '最高気温',
  AVG(最低気温) AS '最低既婚'
FROM
  都市別気象観測
WHERE
  都市名 = '東京'


SELECT 月
  FROM 都市別気象観測
 GROUP BY 月
 HAVING 最高気温 >= 38


サブクエリ　スカラ
SELECT サブクエリ WHERE サブクエリ
UPDATE SET サブクエリ

サブクエリ　ベクター 一次元
SELECT
WHERE カラム名  IN サブクエリ
WHERE カラム名  [ANY,ALL] サブクエリ

サブクエリ　マトリックス 二次元
FROM
INSERT




SELECT * FROM 家計簿
 WHERE 費目 = '食費'
   AND 出金額 < ANY (SELECT 出金額 FROM 家計簿アーカイブ
                     WHERE 費目 = '食費')

SELECT
  費目,合計
FROM
  家計簿集計
WHERE
  EXISTS
    (SELECT
      *
      FROM
        家計簿
        WHERE
          家計簿.費目 = 家計簿集計.費目
    )
