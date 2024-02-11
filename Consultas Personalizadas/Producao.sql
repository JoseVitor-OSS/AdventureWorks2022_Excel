SELECT [TransactionID]
      ,[ProductID]
      ,[TransactionDate]
	  ,(his.Quantity*his.ActualCost) as TotalProducao
  FROM [AdventureWorks2022].[Production].[TransactionHistory] as his
	UNION ALL
  SELECT arc.TransactionID, arc.ProductID, arc.TransactionDate, (arc.Quantity*arc.ActualCost) as TotalProducao  
  FROM [AdventureWorks2022].[Production].[TransactionHistoryArchive] as arc