CREATE TABLE パーティー (  ID CHAR(3), 名称 VARCHAR(20), 職業コード CHAR(2), HP INTEGER, MP INTEGER, 状態コード CHAR(2)  ); CREATE TABLE イベント (  イベント番号 INTEGER, イベント名称 VARCHAR(50), タイプ CHAR(1), 前提イベント番号 INTEGER, 後続イベント番号 INTEGER  ); CREATE TABLE 経験イベント (  イベント番号 INTEGER, クリア区分 CHAR(1), クリア結果 CHAR(1), ルート番号 INTEGER  ); CREATE TABLE コード (  コード種別 INTEGER, コード値 CHAR(2), コード名称 VARCHAR(100)  ); INSERT INTO パーティー ( ID,名称,職業コード,HP,MP,状態コード ) VALUES ( 'C01','ミナト','01',89,35,'00' );INSERT INTO パーティー ( ID,名称,職業コード,HP,MP,状態コード ) VALUES ( 'C02','アサカ','11',74,66,'00' );INSERT INTO パーティー ( ID,名称,職業コード,HP,MP,状態コード ) VALUES ( 'A01','スガワラ','21',131,232,'03' );INSERT INTO パーティー ( ID,名称,職業コード,HP,MP,状態コード ) VALUES ( 'A02','オーエ','10',156,84,'00' );INSERT INTO パーティー ( ID,名称,職業コード,HP,MP,状態コード ) VALUES ( 'A03','イズミ','20',84,190,'00' );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 1,'オープニング','1',NULL,3 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 2,'オープニング（2週目以降）',3,NULL,3 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 3,'勇者の旅立ち',1,NULL,4 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 4,'初めての仲間',1,3,5 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 5,'盗賊ダンシーを追え！',1,4,7 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 6,'宝石の洞窟',2,NULL,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 7,'イガヤの町の秘密','1',5,9 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 8,'妖精の森の下で','2',NULL,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 9,'潜入！バクロック城','1',7,10 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 10,'師との出会い','1',9,12 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 11,'隠れ里ボウジーン','2',NULL,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 12,'ドウンブリッジの戦い','1',10,15 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 13,'名誉を賭して','2',NULL,18 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 14,'ナボーリ火山と三つの島','2',NULL,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 15,'水の洞窟に潜むもの','1',12,17 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 16,'盗賊ダンシーの依頼','2',5,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 17,'封印の町ノザ','1',15,22 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 18,'聖騎士の涙','2',13,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 19,'賢者の婚姻','2',17,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 20,'王位継承者の帰郷','2',17,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 21,'新大陸の魔女','2',17,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 22,'それぞれの願いのために','1',17,23 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 23,'最終決戦','1',22,24 );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 24,'そして世界のはじまりに','1',23,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 25,'エンディング','1',24,NULL );INSERT INTO イベント ( イベント番号,イベント名称,タイプ,前提イベント番号,後続イベント番号 ) VALUES ( 26,'エンディング（2週目以降）','3',24,NULL );INSERT INTO 経験イベント ( イベント番号,クリア区分,クリア結果,ルート番号 ) VALUES ( 1,1,'A',1 );INSERT INTO 経験イベント ( イベント番号,クリア区分,クリア結果,ルート番号 ) VALUES ( 3,'1','B',2 );INSERT INTO 経験イベント ( イベント番号,クリア区分,クリア結果,ルート番号 ) VALUES ( 4,1,'A',3 );INSERT INTO 経験イベント ( イベント番号,クリア区分,クリア結果,ルート番号 ) VALUES ( 5,1,'B',4 );INSERT INTO 経験イベント ( イベント番号,クリア区分,クリア結果,ルート番号 ) VALUES ( 6,'1','C',5 );INSERT INTO 経験イベント ( イベント番号,クリア区分,クリア結果,ルート番号 ) VALUES ( 7,'1','B',6 );INSERT INTO 経験イベント ( イベント番号,クリア区分,クリア結果,ルート番号 ) VALUES ( 9,'0',NULL,NULL );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'01','勇者' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'10','戦士' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'11','武道家' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'12','忍者' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'13','聖騎士' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'14','竜騎士' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'14','魔剣士' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'20','魔法使い' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'21','学者' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'22','僧侶' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'23','賢者' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'24','踊り子' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 1,'25','吟遊詩人' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 2,'00','異常なし' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 2,'01','眠り' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 2,'02','毒' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 2,'03','沈黙' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 2,'04','混乱' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 2,'09','気絶' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 3,'01','強制' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 3,'02','フリー' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 3,'03','特殊' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 4,'A','たいへんよくできました' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 4,'B','よくできました' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 4,'C','もう少し頑張りましょう' );INSERT INTO コード ( コード種別,コード値,コード名称 ) VALUES ( 4,'X','判定不能' );DELETE FROM パーティー WHERE ID LIKE 'A%'
