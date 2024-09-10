SELECT
	   Hospedes.NOME,
	   Hospedes.SOBRENOME,
	   ReservaQuartos.CheckInData,
	   ReservaQuartos.CheckOutData,
	   ReservaQuartos.NumeroQuarto,
	   Quartos.Tipo_Cama,
	   Quartos.Tarifa
  FROM Hospedes 
        RIGHT JOIN ReservaQuartos on ReservaQuartos.ID_Hospede = Hospedes.ID_HOSPEDE
	    RIGHT JOIN Quartos on Quartos.Numero_Quarto = ReservaQuartos.NumeroQuarto;