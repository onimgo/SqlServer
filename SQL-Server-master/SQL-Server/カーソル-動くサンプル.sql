/* 
SELECTで取得するだけの関数
Studentテーブルが必須　
CREATE TABLE Students (
   StudentID INT NOT NULL PRIMARY KEY,
   FirstName VARCHAR(50) NULL,
   LastName VARCHAR(50) NULL,
   Birthday SMALLDATETIME NULL,
   Gender CHAR(1) NULL
);

INSERT INTO Student
  (StudentID, FirstName, LastName, Birthday, Gender)
 VALUES
  (1, 'Taro', 'Yamada', '1980-02-15', 'M'),
  (2, 'Hanako', 'Tanaka' ,'1979-12-30', 'F'),
  (3, 'Yuko', 'Suzuki', '1979-07-07', 'F'),
  (4, 'Takao', 'Sato', '1980-03-12', 'M'),
  (5, 'Hiroki', 'Takagi', '1979-04-05', 'M');
*/

DECLARE @STR nvarchar(100)

-- FETCHで使用
DECLARE @StudentID NVARCHAR(3),
        @FirstName NVARCHAR(50),
        @LastName NVARCHAR(50)

-- カーソル宣言
DECLARE iwamoto CURSOR LOCAL FAST_FORWARD FOR
    SELECT 
        StudentID,
        FirstName,
        LastName
    FROM 
        Student
    ORDER BY 
        StudentID

OPEN iwamoto
    while 1=1
    BEGIN
        FETCH NEXT FROM iwamoto INTO @StudentID,@FirstName,@LastName
        -- FETCHの状態を知る事ができる。
        IF @@FETCH_STATUS != 0
        BEGIN
            BREAK;
        END
        -- ここで編集やテーブル操作を行う
        SET @STR = @StudentID + '.' + @FirstName + '.' + @LastName;
        
        PRINT @STR; 
        PRINT @StudentID; 
        PRINT @FirstName; 
        PRINT @LastName; 
    END

CLOSE iwamoto;
DEALLOCATE iwamoto;