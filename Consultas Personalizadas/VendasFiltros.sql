SELECT dados2.SalesOrderID
      ,dados2.ProductID
	  ,dados2.ProductCategoryID
	  ,dados2.SalesPersonID
	  ,dados2.TerritoryID
	  ,dados2.CurrencyRateID
	  ,dados2.nomeCategoria
	  ,dados2.nomeProduto
	  ,dados2.nomeTerritorio
	  ,cur2.nomeMoeda
  FROM (SELECT dado.SalesOrderID
      ,dado.ProductID
	  ,dado.ProductCategoryID
	  ,dado.SalesPersonID
	  ,dado.TerritoryID
	  ,dado.CurrencyRateID
	  ,dado.nomeCategoria
	  ,dado.nomeProduto
	  ,ter.Name as nomeTerritorio
  FROM (SELECT cab.SalesOrderID
      ,ordem.ProductID
	  ,ordem.ProductCategoryID
	  ,cab.SalesPersonID
	  ,cab.TerritoryID
	  ,cab.CurrencyRateID
	  ,ordem.nomeCategoria
	  ,ordem.nomeProduto
  FROM (SELECT detalhe.SalesOrderID
      ,detalhe.ProductID
	  ,produto.ProductCategoryID
	  ,produto.nomeCategoria
	  ,produto.nomeProduto
  FROM 
  [AdventureWorks2022].[Sales].SalesOrderDetail as detalhe
      
  INNER JOIN 
  
  (SELECT categoria.[ProductCategoryID],
	   categoria.ProductSubcategoryID,
       categoria.Name as nomeCategoria,
	   produtos.ProductID
	   ,produtos.Name as nomeProduto
	  
	   FROM (SELECT Production.ProductCategory.[ProductCategoryID],
	   [Production].[ProductSubcategory].ProductSubcategoryID,
       Production.ProductCategory.Name
	   FROM [AdventureWorks2022].[Production].[ProductSubcategory]
  RIGHT JOIN Production.ProductCategory
  ON Production.ProductCategory.ProductCategoryID = [AdventureWorks2022].[Production].[ProductSubcategory].ProductCategoryID) as categoria
  RIGHT JOIN Production.Product as produtos
  ON produtos.ProductSubcategoryID = categoria.ProductSubcategoryID
  WHERE produtos.ProductSubcategoryID is not null) as produto
  ON produto.ProductID = detalhe.ProductID
) as ordem -- aquiiiii

  LEFT JOIN AdventureWorks2022.Sales.SalesOrderHeader as cab
  ON cab.SalesOrderID = ordem.SalesOrderID) as dado
  INNER JOIN AdventureWorks2022.Sales.SalesTerritory as ter
  ON ter.TerritoryID = dado.TerritoryID) as dados2
  INNER JOIN 
 ( SELECT rate.ToCurrencyCode, rate.AverageRate, rate.CurrencyRateDate,rate.CurrencyRateID,rate.EndOfDayRate,rate.FromCurrencyCode, cur.Name as nomeMoeda FROM AdventureWorks2022.Sales.CurrencyRate as rate
  Left JOIN AdventureWorks2022.Sales.Currency as cur
  ON cur.CurrencyCode = rate.ToCurrencyCode) as cur2
  ON dados2.CurrencyRateID = cur2.CurrencyRateID