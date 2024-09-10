-- Altera o banco de dados
USE WideWorldImporters;
GO

-- Criar procedure com uso de parâmetro
CREATE PROCEDURE Warehouse.usp_SelecionarProdutosPorCor
    @paramColor char(20)
AS
SELECT	Warehouse.StockItems.StockItemID,
		Warehouse.StockItems.StockItemName,
		Warehouse.StockItemHoldings.QuantityOnHand,
		Warehouse.StockItems.RecommendedRetailPrice,
		Warehouse.Colors.ColorName
 FROM	Warehouse.Colors 
		INNER JOIN Warehouse.StockItems ON Warehouse.Colors.ColorID = Warehouse.StockItems.ColorID 
		INNER JOIN Warehouse.StockItemHoldings ON Warehouse.StockItems.StockItemID = Warehouse.StockItemHoldings.StockItemID
 WHERE ColorName = @paramColor;

GO

-- Executar a procedure com vários parâmetros

EXEC Warehouse.usp_SelecionarProdutosPorCor 'Black';
GO
EXEC Warehouse.usp_SelecionarProdutosPorCor 'Blue';
GO
EXEC Warehouse.usp_SelecionarProdutosPorCor;
GO

-- Alterar o procedimento para incluir um valor padrão e tratamento de erros
ALTER PROCEDURE Warehouse.usp_SelecionarProdutosPorCor
    @paramColor char(20) = NULL
AS
IF @paramColor IS NULL
BEGIN
   PRINT 'Uma cor válida de produto é necessária!'
   RETURN
END
SELECT  Warehouse.StockItems.StockItemID,
        Warehouse.StockItems.StockItemName,
        Warehouse.StockItemHoldings.QuantityOnHand,
        Warehouse.StockItems.RecommendedRetailPrice,
        Warehouse.Colors.ColorName
FROM    Warehouse.Colors INNER JOIN
        Warehouse.StockItems ON Warehouse.Colors.ColorID = Warehouse.StockItems.ColorID INNER JOIN
        Warehouse.StockItemHoldings ON Warehouse.StockItems.StockItemID = Warehouse.StockItemHoldings.StockItemID
WHERE ColorName = @paramColor
;
GO

EXEC Warehouse.usp_SelecionarProdutosPorCor;
GO
EXEC Warehouse.usp_SelecionarProdutosPorCor 'Red';
GO

-- Apaga a procedure da base de dados
DROP PROCEDURE Warehouse.usp_SelecionarProdutosPorCor;
GO