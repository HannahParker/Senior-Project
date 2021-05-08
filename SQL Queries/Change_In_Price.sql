USE SENIOR_PROJECT;

SELECT *
FROM Inventory_Noble_Hierarch 
WHERE Date >= (SELECT MAX(Date) FROM Inventory_Noble_Hierarch
WHERE Date < (SELECT MAX(Date) FROM Inventory_Noble_Hierarch))

