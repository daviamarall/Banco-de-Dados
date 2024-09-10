--Função de conversão - Graus Celsius por Fahrenheit

USE WideWorldImporters;

SELECT 
       vt.VehicleTemperatureID,
	   vt.Temperature AS Celsius,
	   vt.Temperature * 1.8 + 32 AS Fahrenheit
  FROM warehouse.VehicleTemperatures VT;

-- Criar uma função personalizada para converter graus Célsius em graus Fahrenheit

CREATE FUNCTION Warehouse.ParaFahrenheit (@Celsius decimal(10,2))
RETURNS decimal(10,2)
AS
BEGIN
	DECLARE @Fahrenheit decimal(10,2);
	SET @Fahrenheit = (@Celsius * 1.8 + 32);
	RETURN @Fahrenheit
END;

-- Utilizar a função personalizada em um Select
SELECT TOP 100 VehicleTemperatureID,
	Temperature AS Celsius,
	Warehouse.ParaFahrenheit(Temperature) AS Fahrenheit
FROM Warehouse.VehicleTemperatures;
