USE LandonHotel;
GO

-- Criar um novo Schema no Banco de Dados
CREATE SCHEMA RecursosHumanos;
GO


-- Mover uma tabela para um novo Schema
ALTER SCHEMA RecursosHumanos TRANSFER dbo.Funcionarios;
GO


-- Elevar as permissões da Jenifer dentro do esquema 
GRANT INSERT ON SCHEMA :: RecursosHumanos TO Jenifer;  -- Varições do comando: GRANT UPDATE ou GRANT DELETE
GO