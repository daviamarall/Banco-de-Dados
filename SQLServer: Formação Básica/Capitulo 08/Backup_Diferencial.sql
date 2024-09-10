USE LandonHotel;
GO

INSERT INTO Hospedes (Nome, Sobrenome, Endereco, Cidade, Estado, Cep, Pais)
	VALUES ('Luciana','Aparecida','Rua Edgar Facó, 12','São Paulo','SP','01000810','Brasil'),
		('André','Luiz','Rua Floriano Peixoto, 199','Itu','SP','13300712','Brasil'),
		('Miguel','Costa','Rua Santa Rita, 32','Itu','SP','13300700','Brasil'),
		('Enrico','Kiyoshi','Rua Marechal Deodoro, 566','Extrema','MG','12887000','Brasil'),
		('Marcio','Souza','Rua Floriano Peixoto, 3','Lençois','BA','75000878','Brasil')
;

SELECT *
FROM Hospedes;
