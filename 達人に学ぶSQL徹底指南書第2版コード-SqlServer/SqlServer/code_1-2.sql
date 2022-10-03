
CREATE TABLE Shohin
(shohin_id     CHAR(4) NOT NULL,
 shohin_mei    VARCHAR(100) NOT NULL,
 shohin_bunrui VARCHAR(32) NOT NULL,
 hanbai_tanka  INTEGER ,
 shiire_tanka  INTEGER ,
 torokubi      DATE ,
     PRIMARY KEY (shohin_id));

INSERT INTO Shohin VALUES ('0001', 'Tシャツ' ,'衣服', 1000, 500, '2009-09-20');
INSERT INTO Shohin VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');
INSERT INTO Shohin VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);
INSERT INTO Shohin VALUES ('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20');
INSERT INTO Shohin VALUES ('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');
INSERT INTO Shohin VALUES ('0006', 'フォーク', 'キッチン用品', 500, NULL, '2009-09-20');
INSERT INTO Shohin VALUES ('0007', 'おろしがね', 'キッチン用品', 880, 790, '2008-04-28');
INSERT INTO Shohin VALUES ('0008', 'ボールペン', '事務用品', 100, NULL, '2009-11-11');


SELECT shohin_id, shohin_mei, hanbai_tanka,
       AVG (hanbai_tanka) OVER (ORDER BY shohin_id
                                ROWS BETWEEN 2 PRECEDING
                                         AND CURRENT ROW) AS moving_avg
  FROM Shohin;


CREATE TABLE LoadSample
(sample_date   DATE PRIMARY KEY,
 load_val      INTEGER NOT NULL);

INSERT INTO LoadSample VALUES('2018-02-01',   1024);
INSERT INTO LoadSample VALUES('2018-02-02',   2366);
INSERT INTO LoadSample VALUES('2018-02-05',   2366);
INSERT INTO LoadSample VALUES('2018-02-07',    985);
INSERT INTO LoadSample VALUES('2018-02-08',    780);
INSERT INTO LoadSample VALUES('2018-02-12',   1000);


SELECT sample_date AS cur_date,
       MIN(sample_date)
          OVER (ORDER BY sample_date ASC
                 ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS latest_date
  FROM LoadSample;


SELECT sample_date AS cur_date,
       MIN(sample_date)
          OVER (ORDER BY sample_date ASC
                 ROWS BETWEEN 1 PRECEDING AND 1 PRECEDING) AS latest_1,
       MIN(sample_date)
          OVER (ORDER BY sample_date ASC
                 ROWS BETWEEN 2 PRECEDING AND 2 PRECEDING) AS latest_2,
       MIN(sample_date)
          OVER (ORDER BY sample_date ASC
                 ROWS BETWEEN 3 PRECEDING AND 3 PRECEDING) AS latest_3
  FROM LoadSample;


演習問題2-①：ウィンドウ関数の結果予想　その1

CREATE TABLE ServerLoadSample
(server       CHAR(4) NOT NULL,
 sample_date  DATE    NOT NULL,
 load_val      INTEGER NOT NULL,
    PRIMARY KEY (server, sample_date));

INSERT INTO ServerLoadSample VALUES('A' , '2018-02-01',  1024);
INSERT INTO ServerLoadSample VALUES('A' , '2018-02-02',  2366);
INSERT INTO ServerLoadSample VALUES('A' , '2018-02-05',  2366);
INSERT INTO ServerLoadSample VALUES('A' , '2018-02-07',   985);
INSERT INTO ServerLoadSample VALUES('A' , '2018-02-08',   780);
INSERT INTO ServerLoadSample VALUES('A' , '2018-02-12',  1000);
INSERT INTO ServerLoadSample VALUES('B' , '2018-02-01',    54);
INSERT INTO ServerLoadSample VALUES('B' , '2018-02-02', 39008);
INSERT INTO ServerLoadSample VALUES('B' , '2018-02-03',  2900);
INSERT INTO ServerLoadSample VALUES('B' , '2018-02-04',   556);
INSERT INTO ServerLoadSample VALUES('B' , '2018-02-05', 12600);
INSERT INTO ServerLoadSample VALUES('B' , '2018-02-06',  7309);
INSERT INTO ServerLoadSample VALUES('C' , '2018-02-01',  1000);
INSERT INTO ServerLoadSample VALUES('C' , '2018-02-07',  2000);
INSERT INTO ServerLoadSample VALUES('C' , '2018-02-16',   500);

SELECT server, sample_date,
       SUM(load_val) OVER () AS sum_load
  FROM ServerLoadSample;


演習問題2-②：ウィンドウ関数の結果予想 その2

SELECT server, sample_date,
       SUM(load_val) OVER (PARTITION BY server) AS sum_load
  FROM ServerLoadSample;
