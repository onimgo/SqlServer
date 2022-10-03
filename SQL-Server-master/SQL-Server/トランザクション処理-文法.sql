    BEGIN TRY
        BEGIN TRANSACTION; -- トランザクションを開始。
        -- OKの処理
        COMMIT TRANSACTION; -- トランザクションを終了し、データの変更をコミットし、リソースを解放
    END TRY
    BEGIN CATCH
        -- NGの処理
        ROLLBACK TRANSACTION;-- ロールバック処理　トランザクション処理実行前の状態に戻す。
    END CATCH