USE SENIOR_PROJECT;
-- server name LAPTOP-AC3LNAA4\SQLEXPRESS
SELECT t1.* 
FROM dbo.Inventory_Noble_Hierarch t1
WHERE t1.[Date] = (SELECT MAX(t2.Date)
                 FROM dbo.Inventory_Noble_Hierarch t2)
