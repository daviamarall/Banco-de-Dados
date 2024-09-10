USE LandonHotel;
GO

-- Visualização dos dados
SELECT * FROM RecursosHumanos.Funcionarios;
GO

-- Adicionar máscara de dados ao campo de E-mail
ALTER TABLE RecursosHumanos.Funcionarios
ALTER COLUMN Email ADD MASKED WITH (Function = 'email()');
								-- (Function = 'default()');
								-- (Function = 'random([start range], [end range])');
								-- (Function = 'partial(prefix, [padding], suffix)');
								-- (Function = 'partial(2, "-----", 1)');

-- Nova visualização dos dados
SELECT * FROM RecursosHumanos.Funcionarios;
GO

-- Remover a máscara de dados da coluna de e-mail
ALTER TABLE RecursosHumanos.Funcionarios
ALTER COLUMN Email DROP MASKED;

