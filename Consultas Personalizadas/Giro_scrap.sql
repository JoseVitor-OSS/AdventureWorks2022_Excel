SELECT ponte.[WorkOrderID]
      ,ponte.[ProductID]
      ,ponte.[ScrappedQty]
      ,ponte.[DueDate]
      ,ponte.Name
	  ,ord.ActualCost
	  ,ponte.StockedQty
  FROM (SELECT [WorkOrderID]
      ,prod.[ProductID]
      ,[ScrappedQty]
      ,[DueDate]
      ,Scrap.Name
	  ,Scrap.StockedQty
  FROM (SELECT [WorkOrderID]
      ,[ProductID]
      ,[OrderQty]
      ,[ScrappedQty]
      ,[DueDate]
      ,razao.Name
      ,work.[ModifiedDate]
	  ,work.StockedQty
  FROM [AdventureWorks2022].[Production].[WorkOrder] as work
  LEFT JOIN AdventureWorks2022.Production.ScrapReason as razao
  ON work.ScrapReasonID = razao.ScrapReasonID
  WHERE razao.Name is not null) as Scrap
  RIGHT JOIN Production.Product as prod
  ON prod.ProductID = Scrap.ProductID) as ponte
  LEFT JOIN AdventureWorks2022.Production.TransactionHistory as ord
  ON ord.ProductID = ponte.ProductID
  WHERE WorkOrderID is not null
  ORDER BY WorkOrderID


