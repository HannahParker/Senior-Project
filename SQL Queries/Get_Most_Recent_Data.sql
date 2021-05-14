USE SENIOR_PROJECT;

SELECT * FROM dbo.[Inventory_Noble_Hierarch_2021.April.22] -- returns 34,207

-- EXCEPT returns 0
-- UNION returns 34,169 rows

SELECT  inh.Count -- returns 37,207
       ,inh.Name
       ,inh.Edition
	   ,inh.Card_Number
	   ,inh.Condition
	   ,inh.Language
	   ,inh.Foil
	   ,inh.Signed
	   ,inh.Artist_Proof
	   ,inh.Altered_Art
	   ,inh.Misprint
	   ,inh.Promo
	   ,inh.Textless
	   ,inh.Type
	   ,inh.Rarity
	   ,inh.Price
	   ,inh.Date
  FROM Inventory_Noble_Hierarch inh
       INNER JOIN (
                   SELECT  Name AS [Name]
                          ,MAX(Date) AS [MxDt]
                     FROM Inventory_Noble_Hierarch
                    GROUP BY Name
                   ) sub
          ON inh.Name = sub.Name
         AND inh.Date = sub.MxDt

--EXCEPT returns 0

--SELECT * FROM dbo.[Inventory_Noble_Hierarch_2021.April.22]