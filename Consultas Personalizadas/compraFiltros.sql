USE AdventureWorks2022
SELECT subsub.PurchaseOrderID,
	   subsub.PurchaseOrderDetailID,
	   subsub.DueDate,
	   subsub.ProductIDCompra,
	   subsub.nomeProduto,
	   subsub.ProductIDProd,
	   subsub.Subnome,
	   cat.Name as NomeCat,
	   cat.ProductCategoryID
	   FROM (SELECT produto.PurchaseOrderID,
	   produto.PurchaseOrderDetailID,
	   produto.DueDate,
	   produto.ProductIDCompra,
	   produto.nomeProduto,
	   produto.ProductIDProd,
	   sub.Name as Subnome,
	   sub.ProductCategoryID
	   FROM (SELECT pur.PurchaseOrderID,
	   pur.PurchaseOrderDetailID,
	   pur.DueDate,
	   prod.ProductSubcategoryID,
	   pur.ProductID as ProductIDCompra,
	   prod.Name as nomeProduto,
	   prod.ProductID as ProductIDProd
	   FROM AdventureWorks2022.Purchasing.PurchaseOrderDetail as pur
INNER JOIN AdventureWorks2022.Production.Product as prod
ON pur.ProductID = prod.ProductID) as produto
INNER JOIN AdventureWorks2022.Production.ProductSubcategory as sub
ON sub.ProductSubcategoryID = produto.ProductSubcategoryID) as subsub
INNER JOIN AdventureWorks2022.Production.ProductCategory as cat
ON cat.ProductCategoryID = subsub.ProductCategoryID
ORDER BY nomeProduto
