-- Consultas propostas na BD SOCIEDADE CULTURAL
--Proposta 1. Aumentar o número de prazas das actividades nun 15%.
use SOCIEDADE_CULTURAL
GO

select * from ACTIVIDADE

begin tran
UPDATE ACTIVIDADE
SET num_prazas = num_prazas*1.15

select * from ACTIVIDADE
rollback
--– Proposta 2. Cambiar o estado da aula de nome AULA SUR a regular (R).

use SOCIEDADE_CULTURAL
GO

select * from AULA

begin tran
UPDATE AULA
set estado = 'R'
WHERE descricion = 'AULA SUR'

select * from AULA
rollback
--– Proposta 3. Engadir unha aula nova de número 9, nome AULA NOVA e con
--superficie e estado os mesmos que os da aula COCIÑA.
use SOCIEDADE_CULTURAL
GO

select * from AULA

begin tran
INSERT INTO AULA (numero,descricion,superficie,estado)
select 9,'AULA NOVA', superficie, estado
from  AULA
where descricion='COCIÑA'

select * from AULA
rollback


--– Proposta 4. Engadir dúas novas cotas, unha cos datos 21, COTA1, 75 e outra cos
--datos 22, COTA2 e 74.3.
use SOCIEDADE_CULTURAL
GO

select * from COTA

begin tran
INSERT INTO COTA (codigo,nome,importe)
values(21,'COTA1',75),(22,'COTA2',74.3)

select * from COTA
rollback
--– Proposta 5. Crear unha táboa temporal global PROFE_ASISTENTE_ACTI co nif, nome
--e primeiro apelido do profesorado que asiste a actividades.
use SOCIEDADE_CULTURAL
GO

select * FROM EMPREGADO
select * from PROFE_CURSA_ACTI

begin tran
SELECT nif, nome, ape1
INTO ##PROFE_ASISTENTE_ACTI
FROM EMPREGADO e join PROFE_CURSA_ACTI pca on e.numero = pca.num_profesorado 

select * from ##PROFE_ASISTENTE_ACTI
rollback

--– Proposta 6. Crear unha táboa permanente de nome AULA_MALA coas aulas en mal
--estado (Estado=M) e coas mesmas columnas da táboa AULA. Os nomes dos campos
--de AULA_MALA serán codigo, nome, m2 e estado.


--– Proposta 7. Crear unha táboa temporal local que sexa unha copia en canto a contido
--e columnas da táboa ACTIVIDADE e que se chame ACTI2. Antes de pechar a
--transacción, farase unha consulta que elimine todas as actividades da táboa nova
--que non teñan observacións.
--– Proposta 8. Crear unha táboa temporal local de nome SOCIO2 copia de SOCIO. A
--continuación faremos a consulta que elimine de SOCIO2 aqueles socios que non
--teñen teléfono algún.
--– Proposta 9. Substituír os espazos en branco das observacións das actividades, as que
--asisten docentes, por guións baixos(_).
--– Proposta 10. Retrasar nun día a data de inicio de tódalas actividades que aínda non
--comezaron a día de hoxe.

-- Consultas propostas na BD EMPRESA.
--– Proposta 11. Eliminar os fabricantes dos que non hai produtos na BD.
--– Proposta 12. Incrementar o obxectivo das sucursais da rexión OESTE nun 6% e
--modificar o nome da rexión por WEST.
--– Proposta 13. Crear unha táboa de nome FABRICANTE2 que sexa unha copia de
--FABRICANTE en número e nome de columnas e en contido. Elimina todas as filas da
--nova táboa do xeito máis rápido e menos custoso posible.
--– Proposta 14. Transferir todos os empregados que traballan na sucursal de
--BARCELONA á sucursal de VIGO, e cambiar a súa cota de vendas pola media das
--cotas de vendas de tódolos empregados.
--– Proposta 15. Elimina os pedidos de empregados contratados antes do ano 2001.