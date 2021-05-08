USE SENIOR_PROJECT;

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
         AND inh.Date = sub.MxDt