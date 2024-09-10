CREATE TABLE quartos (
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

SELECT id_quarto, 
	   numero_quarto, 
	   tipo_cama, 
	   tarifa
  FROM landonhotel.dbo.Quartos;

 SELECT id_quarto, 
	   numero_quarto, 
	   tipo_cama
  FROM landonhotel.dbo.Quartos;

 SELECT tipo_cama, 
	    numero_quarto
  FROM landonhotel.dbo.Quartos;

 SELECT *
  FROM dbo.Quartos;