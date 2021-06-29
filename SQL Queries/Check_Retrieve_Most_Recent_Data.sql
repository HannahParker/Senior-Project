USE SENIOR_PROJECT;

(SELECT * FROM dbo.[Inventory_Noble_Hierarch_2021.April.29] 
EXCEPT
SELECT  inh.Count 
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
         AND inh.Date = sub.MxDt)
UNION ALL
(SELECT  inh.Count 
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
EXCEPT
SELECT * FROM dbo.[Inventory_Noble_Hierarch_2021.April.29])
