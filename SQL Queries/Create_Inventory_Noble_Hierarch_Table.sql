USE SENIOR_PROJECT;

DROP TABLE dbo.Inventory_Noble_Hierarch;

SELECT * INTO dbo.Inventory_Noble_Hierarch FROM(
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.February.16]
	UNION ALL 
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.February.28]
	UNION ALL 
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.March.03]
	UNION ALL 
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.March.11]
	UNION ALL 
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.March.18]
	UNION ALL 
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.March.25]
	UNION ALL
	SELECT *
	FROM dbo.[Inventory_Noble_Hierarch_2021.May.07]	
	UNION ALL 
	SELECT *
	FROM dbo.[Inventory_Noble_Hierarch_2021.May.13]	
	UNION ALL 
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.April.02]
	UNION ALL
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.April.09]
	UNION ALL
	SELECT * 
	FROM dbo.[Inventory_Noble_Hierarch_2021.April.15]
	UNION ALL
	SELECT *
	FROM dbo.[Inventory_Noble_Hierarch_2021.April.22]
	UNION ALL
	SELECT *
	FROM dbo.[Inventory_Noble_Hierarch_2021.April.29]	
	) as tmp