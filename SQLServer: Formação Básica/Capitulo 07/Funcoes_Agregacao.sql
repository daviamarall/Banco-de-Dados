USE WideWorldImporters;

SELECT * 
FROM Application.StateProvinces;


-- Contar registros
SELECT COUNT(*) 
FROM Application.StateProvinces;

--Alias
SELECT COUNT(*) AS CountOfStates  
FROM Application.StateProvinces;

SELECT COUNT(*) AS CountOfStates
FROM Application.StateProvinces
WHERE SalesTerritory = 'Southwest';

SELECT COUNT(*) AS CountOfStates
FROM Application.StateProvinces
WHERE LatestRecordedPopulation > 5000000;


-- Agrupando registros
SELECT SalesTerritory, StateProvinceName
FROM Application.StateProvinces
ORDER BY SalesTerritory;

SELECT SalesTerritory, Count(StateProvinceName) AS NumberOfStates
FROM Application.StateProvinces
GROUP BY SalesTerritory
ORDER BY SalesTerritory;


-- Máximo, Mínimo e Média
SELECT MAX(*) 
FROM Application.StateProvinces;

SELECT MAX(LatestRecordedPopulation) AS MaxPopulation,
	MIN(LatestRecordedPopulation) AS MinPopulation,
	AVG(LatestRecordedPopulation) AS AvgPopulation
FROM Application.StateProvinces;


-- Subquery ou subconsulta
SELECT StateProvinceName, LatestRecordedPopulation
FROM Application.StateProvinces
WHERE LatestRecordedPopulation =
	(SELECT MAX(LatestRecordedPopulation) FROM Application.StateProvinces)
;

SELECT StateProvinceName, LatestRecordedPopulation
FROM Application.StateProvinces
WHERE LatestRecordedPopulation >
	(SELECT AVG(LatestRecordedPopulation) FROM Application.StateProvinces)
;