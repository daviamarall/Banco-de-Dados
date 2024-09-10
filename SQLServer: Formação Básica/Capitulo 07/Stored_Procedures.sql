-- Altera para a base de dados WideWorldImporters
USE WideWorldImporters;
GO

-- Visualiza todas as procedures em um Schema específico
SELECT SCHEMA_NAME(schema_id) AS NomeSchema,
    name AS NomeProcedure
FROM sys.procedures
ORDER BY NomeSchema;
GO

-- criar uma procedure para identificar inventário
CREATE PROCEDURE Warehouse.usp_BaixoEstoque
AS
SELECT	Warehouse.StockItems.StockItemID AS ID,
		Warehouse.StockItems.StockItemName AS 'Nome Item',
		Warehouse.StockItemHoldings.QuantityOnHand AS 'Em mãos',
		Warehouse.StockItemHoldings.ReorderLevel AS 'Nivel'
FROM	Warehouse.StockItems INNER JOIN
		Warehouse.StockItemHoldings ON Warehouse.StockItems.StockItemID = Warehouse.StockItemHoldings.StockItemID
ORDER BY 'Em mãos';
GO

-- Executar a procedure
EXECUTE Warehouse.usp_BaixoEstoque

-- Altera a procedure para encontrar itens com estoque baixo
ALTER PROCEDURE Warehouse.usp_BaixoEstoque
AS
SELECT	Warehouse.StockItems.StockItemID AS ID,
		Warehouse.StockItems.StockItemName AS 'Nome Item',
		Warehouse.StockItemHoldings.QuantityOnHand AS 'Em Mãos',
		Warehouse.StockItemHoldings.ReorderLevel AS 'Nivel'
  FROM	Warehouse.StockItems 
   	   INNER JOIN Warehouse.StockItemHoldings ON Warehouse.StockItems.StockItemID = Warehouse.StockItemHoldings.StockItemID
 WHERE	ReorderLevel > QuantityOnHand
 ORDER BY 'Em Mãos';
GO

-- Executar a procedure
EXECUTE Warehouse.usp_BaixoEstoque

-- Apagar a procedures do banco de dados
DROP PROCEDURE Warehouse.usp_BaixoEstoque;
GO