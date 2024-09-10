-- Ao criar uma nova tabela, você deve informar informar o nome da mesma, e entre paranteses, vc informa todas as colunas e seus respectivos parametros 

CREATE TABLE Quartos(
ID_Quarto int IDENTITY(1, 1) NOT NULL,
Numero_Quarto char(3) NOT NULL,
Tipo_Cama varchar(15) NOT NULL,
Tarifa smallmoney not null
);