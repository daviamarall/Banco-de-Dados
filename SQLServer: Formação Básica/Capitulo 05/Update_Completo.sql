SELECT * FROM dbo.ReservaQuartos;

UPDATE dbo.ReservaQuartos
   SET CheckInData = '2022-05-08'
 WHERE ID_RESERVA = 2 AND NumeroQuarto = 202;

