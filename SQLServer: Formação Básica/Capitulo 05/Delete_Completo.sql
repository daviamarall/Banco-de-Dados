/* Apagar e recriar tabela de quartos */

USE LandonHotel
GO

DROP TABLE IF EXISTS dbo.Quartos;

CREATE TABLE Quartos (
	ID_Quarto int IDENTITY(1, 1) NOT NULL,
	Numero_Quarto char(3) NOT NULL,
	Tipo_Cama varchar(15) NOT NULL, 
	Tarifa smallmoney NOT NULL
);

INSERT INTO Quartos (numero_quarto, Tipo_Cama, tarifa)
VALUES
('101', 'Luxo', 110),
('102', 'Standard', 100),
('103', 'Duplo', 90),
('201', 'Luxo', 120),
('202', 'Luxo', 120),
('203', 'Duplo', 90)

/* TRUNCATE TABLE dbo.Quartos;

Select * from dbo.quartos;
*/