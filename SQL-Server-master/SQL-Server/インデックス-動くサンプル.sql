■ インデックスをつけるパターン

1. クラスター化インデックス

    CREATE CLUSTERED INDEX [インデックス名]
	    ON [テーブル名] ([列名] ASC)
    GO

    テーブル作成時、主キーとクラスター化インデックスを作成する
    CREATE TABLE [テーブル名] (
        [列名1] [データ型] NOT NULL,
        [列名2] [データ型],
        [列名3] [データ型],
        CONSTRAINT [インデックス名] PRIMARY KEY CLUSTERED (
            [列名1]
        )
    )
    GO

2. 非クラスター化インデックス

    CREATE NONCLUSTERED INDEX [インデックス名]
        ON [テーブル名] ([列名])
    GO
    
-- /////////////////////////////////////////////
        2-1. 付加列インデックス
            CREATE NONCLUSTERED INDEX [インデックス名]
                ON [テーブル名] ([列名])
                INCLUDE ([列名1],[列名2])
            GO

        2-2 既存テーブルに、非クラスター化インデックス付き主キーを作成する
            ALTER TABLE [テーブル名]
                ADD CONSTRAINT [インデックス名] PRIMARY KEY NONCLUSTERED (
                    [列名1],
                    [列名2]
                )
            GO

3. インデックスを有効化
    ALTER INDEX [インデックス名] 
    ON [テーブル名] REBUILD

4. インデックスを無効化
    ALTER INDEX [インデックス名]
    ON [テーブル名] DISABLE


5. インデックスを削除
    DROP INDEX [インデックス名] ON [テーブル名]


Seek = ピンポイント検索　1つのデータを読み込むこと
    (例) 100万件のデータから条件に合致するデータを1件のみ読み込む


Scan = 全件検索 全て読み込むこと
    (例) 100万件のデータを全て読み込む
        「Table Scan」テーブル全てのデータを読み込んでいるので、非常に検索処理が遅い
         インデックスを作成して「Seek」にすることが望ましい

    SELECT 
        *
    FROM 
        [dbo].[OldCustomer]
--/////////////////////////////////////////////
-- 非クラスター化インデックスを使用した検索    

-- パターン1
    SELECT 
        [CustomerID]　-- CustomerIDがインデックス項目に該当するので、CustomerIDだけの取得はRID Lookupが発生しない。
    FROM 
        [dbo].[OldCustomer]
    WITH
        (INDEX(customer_idx1))
    WHERE
        CustomerID = 5

-- パターン2

    SELECT 
        * --*(アスタリスク)で全ての列項目を取得しようとしているので、RID Lookupが発生
    FROM 
        [dbo].[OldCustomer]
    WITH
        (INDEX(customer_idx1))
    WHERE
        CustomerID = 5

-- 非クラスター作成
    CREATE NONCLUSTERED INDEX 
        customer_idx1
        ON
        OldCustomer([CustomerID])
    GO

--/////////////////////////////////////////////
-- 非クラスター化インデックスを使用した検索
-- CustomerIDとInvestmentHistoryを取得項目にした場合はリーフノードの読み込みで完結するので、キー参照は発生しません。
    SELECT 
        * -- *(アスタリスク)で全ての列項目を取得しようとしているので、キー参照が発生する。
    FROM 
        OldCustomer
    WITH
        (INDEX(InvestmentHistory_idx1))
    WHERE
        InvestmentHistory = 1

    CREATE NONCLUSTERED INDEX 
        InvestmentHistory_idx1
        ON
        OldCustomer(InvestmentHistory)
    GO

インデックスの作成手順
    Step1. プライマリキーを作成する
        テーブルを作成したら、まずはプライマリキーを作成する。
        自動的にクラスター化インデックスが作成されます。
        意味の無い連番をプライマリキーにするのは絶対にやめましょう。

    Step2. ユニークキーを作成する
        必要の場合、ユニークキーを作成します。
        自動的に非クラスター化インデックスが作成されます。

    Step3. 非クラスター化インデックスの設計をする
        SQLを作成したら、必ず実行プランから「Seek」になっていることを確認すること。

    Step4. 付加列インデックスの設計をする
        どうしてもパフォーマンス改善が見込まれない場合、付加列インデックスを使用する。
        内部構造的にデータの2重持ちになり、データ容量を圧迫するので、あまり安易に多用してはいけません。


SQL Server:インデックスの変更を安全に行う方法

    --まず、新しいインデックスを作成する
    create index IX_Table1_2 on Table1 (
        col1,
        col2,
        col3
    ) with(online=on) --enterprise edition または sql database ならオンライン操作可能

    --次に、同一トランザクション内で、不要インデックスのDROPと、新しいインデックスを同じ名前にrenameする処理を実施
    begin tran
    drop index IX_Table1 on Table1
    exec sp_rename 'Table1.IX_Table1_2', 'IX_Table1'
    commit tran

実装

    -- CREATE TABLE Students (
    -- StudentID INT NOT NULL PRIMARY KEY,
    -- FirstName VARCHAR(50) NULL,
    -- LastName VARCHAR(50) NULL,
    -- Birthday SMALLDATETIME NULL,
    -- Gender CHAR(1) NULL
    -- );

    -- INSERT INTO Students
    -- (StudentID, FirstName, LastName, Birthday, Gender)
    -- VALUES
    -- (1, 'Taro', 'Yamada', '1980-02-15', 'M'),
    -- (2, 'Hanako', 'Tanaka' ,'1979-12-30', 'F'),
    -- (3, 'Yuko', 'Suzuki', '1979-07-07', 'F'),
    -- (4, 'Takao', 'Sato', '1980-03-12', 'M'),
    -- (5, 'Hiroki', 'Takagi', '1979-04-05', 'M');

    --まず、新しいインデックスを作成する
    create index OldIwamotoIndex on Student (
        StudentId,
        FirstName
    ) with(online=on)

    -- カラムを追加したindexを作成する
    create index NewIwamotoIndex on Student (
        StudentId,
        FirstName,
        LastName
    ) with(online=on)

    --次に、同一トランザクション内で、不要インデックスのDROPと、
    --新しいインデックスを同じ名前にrenameする処理を実施。
    -- バグらない為に、昔のindex名にしようね。

    begin tran
    drop index OldiwamotoIndex on Student
    exec sp_rename 'Student.NewIwamotoIndex', 'OldIwamotoIndex'
    commit tran
