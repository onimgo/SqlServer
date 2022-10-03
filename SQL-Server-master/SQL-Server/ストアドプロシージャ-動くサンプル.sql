■ クロージャ生成
    CREATE PROCEDURE [dbo].[CommonName]
        -- 引数を設定する
        @Name      NVARCHAR(10),
        @Age  INT,
        @ErrorMessage   NVARCHAR(100) OUT
    AS
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION; -- トランザクションを開始。
            -- OKの処理
            PRINT @Name + 'さん';
            PRINT CAST(@Age AS NVARCHAR) + '歳ですね';
            PRINT 'OK処理に入りました';

            COMMIT TRANSACTION; -- トランザクションを終了し、データの変更をコミットし、リソースを解放
        END TRY
        BEGIN CATCH
            -- NGの処理
            PRINT @Name + 'さん';
            PRINT @Age + '歳ですね';
            PRINT 'NG処理に入りました';
            ROLLBACK TRANSACTION;-- ロールバック処理　トランザクション処理実行前の状態に戻す。
        END CATCH
    END;


■ 使い方
    -- 変数を宣言
    DECLARE @ErrorMessage NVARCHAR(100);

    -- 実行
    EXEC CommonName 
            iwamoto, 
			30,
            @ErrorMessage OUTPUT;



■ クロージャ生成
    CREATE PROCEDURE SelectDbStudens
        -- 引数を設定する
    AS
    BEGIN
        BEGIN TRY
            BEGIN TRANSACTION; -- トランザクションを開始。
            SELECT *
            FROM    Students;
            COMMIT TRANSACTION; -- トランザクションを終了し、データの変更をコミットし、リソースを解放
        END TRY
        BEGIN CATCH
            -- NGの処理
            PRINT '処理に失敗しました';
            ROLLBACK TRANSACTION;-- ロールバック処理　トランザクション処理実行前の状態に戻す。
        END CATCH
    END;


■ 使い方
    EXEC SelectDbStudens;



