USE SENIOR_PROJECT;

SELECT 
	[Count]
	, [Name]
	, Edition
	, Card_Number
	, Condition
	, [Language]
	, Foil
	, Signed
	, Artist_Proof
	, Altered_Art
	, Misprint
	, Promo
	, Textless
	, [Type]
	, Rarity
	, CAST(Price AS money) AS Price
	, [Date]
INTO #PRICE_PVT
FROM Inventory_Noble_Hierarch 
WHERE Date >= (SELECT MAX(Date) FROM Inventory_Noble_Hierarch
WHERE Date < (SELECT MAX(Date) FROM Inventory_Noble_Hierarch))

TRUNCATE TABLE dbo.stg_ChangeInPricing;
DECLARE @cols NVARCHAR (MAX)

SELECT @cols = COALESCE (@cols + ',[' + CONVERT(NVARCHAR, [DATE], 106) + ']', 
               '[' + CONVERT(NVARCHAR, [DATE], 106) + ']') 
               FROM    (SELECT DISTINCT [Date] FROM #PRICE_PVT) PV  
               ORDER BY [DATE]

DECLARE @query NVARCHAR(MAX)
SET @query = 'WITH cteTest AS 
				(
              SELECT * FROM 
             (
                 SELECT * FROM #PRICE_PVT
             ) x
             PIVOT 
             (
                 SUM(Price)
                 FOR [Date] IN (' + @cols + ') 
            ) p      
			) 
			INSERT INTO dbo.stg_ChangeInPricing
			SELECT * FROM cteTest
            '     
EXEC SP_EXECUTESQL @query

DECLARE @ColName nvarchar(128)

SELECT @ColName = COLUMN_NAME FROM Information_Schema.Columns
WHERE TABLE_NAME = 'stg_ChangeInPricing' AND ORDINAL_POSITION = 16

SET @ColName = 'dbo.stg_ChangeInPricing.[' + @ColName + ']]'

EXEC sp_RENAME @ColName , '[Last_Week_Price]', 'COLUMN'

DECLARE @ColName2 nvarchar(128)

SELECT @ColName2 = COLUMN_NAME FROM Information_Schema.Columns
WHERE TABLE_NAME = 'stg_ChangeInPricing' AND ORDINAL_POSITION = 17

SET @ColName2 = 'dbo.stg_ChangeInPricing.[' + @ColName2 + ']]'

EXEC sp_RENAME @ColName2 , '[Current_Price]', 'COLUMN'

SELECT * FROM stg_ChangeInPricing