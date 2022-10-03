-- 第3章 操作する行の絞り込み
SELECT
FROM
WHERE 列名 IS NULL
WHERE 列名 IS NOT NULL
WHERE 列名 LIKE '%1月%'
WHERE 列名 BETWEEN 100 AND 300 --100~3000円の出費
WHERE 列名 BETWEEN '2018-03-01' AND '2018-03-31' -- 3月の行
WHERE 費目 IN ('食費','交際費') -- 費目から 食費・交際費が合致する行を取得
WHERE 費目 NOT IN ('食費','交際費') -- 費目から 食費・交際費が合致する行を取得
WHERE 2500 < ANY (1000,2000,3000) -- 3000は true
WHERE 1000 < ALL (1000,2000,3000) -- 全てなので false
NOT
AND
OR
(where) --カッコによる優先順位の引き上げ

-- 第4章 検索結果の加工
SELECT DISTINCT 列名 --重複業を削除
ORDER  BY 列名 DESC ,列名 DESC

SELECT TOP(3) -- 3行を取得
OFFSET 先頭から除外する行数 ROWS FETCH NEXT 取得行数 ROWS ONLY
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY --0-3件のデータを取得
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY --3番目のデータを取得

-- 第4章 集合演算子　※ 検索結果の列数、データ型がバラバラだとエラーになるので注意
-- 和集合 2つの検索結果を足し合わせたもの
SELECT 文
UNION (ALL) --ALL 重複を削除しない　
SELECT 文
-- 差集合 2つの検索結果から次の検索結果と重複する部分を取り除いたもの
SELECT 文
EXCEPT(ALL) --ALL 重複を削除しない　
SELECT 文
-- 積集合 2つの検索結果で重複するもの
SELECT 文
EXCEPT(ALL) --ALL 重複を削除しない　
SELECT 文


-- 第5章 式と関数
SELECT
  出金額, --列名での指定 : 列の内容がそのまま出力される
  出金額 + 100, -- 計算式での指定 : 計算式の評価結果が出力される
  'SQL' -- 固定値での指定 : 固定値がそのまま出力される
  お小遣い + 30000 AS 貯金 -- 別名
---------
INSERT INTO 家計簿 (出金額)
VALUES (1000 + 105) --INSERT文での計算式の利用
---------
UPDATE 家計簿
SET 出金額 = 出金額 + 100 -- UPDATE文での計算式の使用

-- 値を変換する
-- CASE1
SELECT
  CASE 評価する列や式 WHEN 値1 THEN 値1の時に返す値
  ELSE デフォルト値
  END AS 別名

-- CASE2
SELECT
  CASE WHEN 条件1 THEN 条件1のときに返す値
      WHEN 条件2 THEN 条件2のときに返す値
  ELSE デフォルト値
  END AS 別名

-- 文字列にまつわる関数
SELECT
LEN(カラム名) -- 文字の長さ
TRIM(カラム名) -- 左右から空白を除去した文字列
LTRIM(カラム名) -- 左側の空白を除去した文字列
RTRIM(カラム名) -- 右側の空白を除去した文字列

REPLACE(検索対象の文字列、置換前の部分文字列、置換後の部分文字列) -- 文字列を置換する関数
UPDATE 家計簿
SET メモ = REPLACE(メモ, '購入','買った') -- メモ列に入っている「購入」という文字列をすべて「買った」

SUBSTRING(文字列を表す列,抽出を開始する位置,抽出する文字の数) -- 文字列の一部を抽出する関数
SUBSTR(文字列を表す列,抽出を開始する位置,抽出する文字の数) -- 文字列の一部を抽出する関数
SELECT * FROM 家計簿
WHERE SUBSTRING(費目,1,3) LIKE '%費%' -- 費目列の1~3文字目に「費」があるものだけを抽出する

CONCAT(文字列1,文字列2) --文字列を連結する
