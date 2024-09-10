CREATE TABLE Quartos (
	ID_Quarto int IDENTITY(1, 1) NOT NULL,
	Numero_Quarto char(3) NOT NULL,
	Tipo_Cama varchar(15) NOT NULL, 
	Tarifa smallmoney NOT NULL
);

SELECT *
  FROM dbo.Hospedes;
