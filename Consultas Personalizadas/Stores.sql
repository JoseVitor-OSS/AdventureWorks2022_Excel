SELECT [BusinessEntityID] as StoreID
      ,[Name]
      ,[SalesPersonID]
	  ,loja.Name as nomeLojas
	  ,cur.CustomerID
	  ,cur.PersonID
	  ,cur.TerritoryID
  FROM [AdventureWorks2022].[Sales].[Store] as loja
  INNER JOIN AdventureWorks2022.Sales.Customer as cur
  ON cur.StoreID = loja.BusinessEntityID
  ORDER BY CustomerID