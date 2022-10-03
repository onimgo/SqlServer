[ディレクトリ構成]
sqlディレクトリ  : 書籍掲載のSQL文
setupディレクトリ: 書籍掲載のSQL文を実行する前提となるテーブルやデータを作成するSQL文

[ファイル名の規則]
ListXX〜     : 第XX章 本編に掲載のSQL文
CanXX〜      : 第XX章 「できるようになったこと」に掲載のSQL文
ColXX〜      : 第XX章 コラムに掲載にSQL文
QXX〜        : 第XX章 練習問題/解答に掲載のSQL文
QA〜,QB〜,QC〜: ドリルA,B,Cの解答に前提となるテーブルやデータを作成するSQL文（setupディレクトリのみ）
※setupのSQL文には先頭に「pre_ssql2-」が付与されています。

[前提とするDBMS]
PostgreSQL
（MySQL、OracleなどのDBMSでは一部のSQL文は動作しないことがあります。適宜改変してご利用ください。）
