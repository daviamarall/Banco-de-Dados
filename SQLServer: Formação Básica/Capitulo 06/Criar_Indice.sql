-- Cria um índice NÃO CLUSTERIZADO na coluna 
-- SOBRENOME da tabela dos hóspedes

USE LandonHotel;

CREATE NONCLUSTERED INDEX idx_Hospedes_Sobrenome
ON dbo.Hospedes (Sobrenome ASC);
