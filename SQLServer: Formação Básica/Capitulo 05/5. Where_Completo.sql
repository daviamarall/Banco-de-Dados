CREATE TABLE quartos (
	ID_Quarto int IDENTITY(1, 1) NOT NULL,
	Numero_Quarto char(3) NOT NULL,
	Tipo_Cama varchar(15) NOT NULL, 
	Tarifa smallmoney NOT NULL
);

select * 
  from dbo.quartos
 where tipo_cama = 'Luxo';

select numero_quarto, tarifa
  from dbo.quartos
 where tipo_cama = 'Luxo';

 select numero_quarto, tarifa
  from dbo.quartos
 where tarifa > 100;

 > maior
 < menor
 >= maior ou igual
 <= menor ou igual
 = igual
 != diferente

 select *
  from dbo.quartos
 where tipo_cama != 'Luxo';

select *
  from dbo.quartos
 where tipo_cama != 'Luxo'
   and tarifa = 100;


-- order by 
select *
  from dbo.quartos
  order by Tarifa ; 