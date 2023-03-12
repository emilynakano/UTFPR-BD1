1
select primeiro_nome, sobrenome, nome from Empregado, Departamento
where (Empregado.id_departamento=Departamento.id_departamento) 
order by primeiro_nome, sobrenome, nome;

select primeiro_nome, sobrenome, nome from Empregado join Departamento 
using(id_departamento) order by primeiro_nome, sobrenome, nome;

---------------------

2

select nome, primeiro_nome, sobrenome from Empregado, Departamento where
(id_gerente=id_empregado) order by nome, sobrenome;

select nome, primeiro_nome, sobrenome from Empregado join Departamento
on (id_gerente=id_empregado) order by nome, sobrenome;

_________________

3

select Projeto.id_projeto, Projeto.descricao, Empregado_Projeto.id_atividade, Atividade.descricao 
from Projeto, Empregado_Projeto, Atividade where 
(Projeto.id_projeto=Empregado_Projeto.id_projeto) and
 (Empregado_Projeto.id_atividade=Atividade.id_atividade)
and  Projeto.id_projeto like '%4'

select Projeto.id_projeto, Projeto.descricao, Empregado_Projeto.id_atividade, Atividade.descricao
from Projeto join Empregado_Projeto using(id_projeto) join Atividade using(id_atividade)
where Projeto.id_projeto like '%4';
-------------------------

4

select id_empregado, sobrenome, id_projeto, descricao from Empregado join Empregado_Projeto
using(id_empregado) join Projeto using(id_projeto) where Projeto.id_projeto=4;

________________________

5

select id_empregado, sobrenome, id_projeto, Projeto.descricao, 
id_atividade, Atividade.descricao, Empregado_Projeto.data_fim from Empregado join Empregado_Projeto
 using(id_empregado)
join Projeto using(id_projeto) join Atividade using(id_atividade)
where Empregado_Projeto.data_inicio='2013-03-06';

--------------------------
6

select Empregado.id_departamento, Departamento.nome, sobrenome, Empregado_Projeto.id_projeto,
Projeto.descricao, Empregado_Projeto.id_atividade, Atividade.descricao from
Empregado join Empregado_Projeto using(id_empregado) join Projeto using(id_projeto)
join Atividade using(id_atividade) join Departamento on 
(Empregado.id_departamento=Departamento.id_departamento)
where Departamento.id_departamento=5;

-------------------------
7

select Empregado.id_departamento, sobrenome, descricao, id_atividade 
from Empregado join Empregado_Projeto using(id_empregado) join
Projeto using(id_projeto) where Empregado.id_departamento between 2 and 5 
order by id_departamento, sobrenome

8

select id_atividade, Ger.sobrenome, Empregado_Projeto.data_inicio, 
Empregado_Projeto.id_projeto, Emp.sobrenome
from Empregado_Projeto, Projeto, Departamento, Empregado Ger, Empregado Emp
where (Empregado_Projeto.id_projeto=Projeto.id_projeto) and
(Projeto.id_departamento=Departamento.id_departamento) and
(Departamento.id_gerente=Ger.id_empregado) and
(Empregado_Projeto.data_inicio>='2013-01-13') order by id_atividade 

____________________________
9

select Emp.id_departamento, Ger.sobrenome, Emp.sobrenome,
 Ger.data_contratacao, Emp.data_contratacao from Empregado Emp join
 Departamento using(id_departamento) join Empregado Ger 
 on Departamento.id_gerente=Ger.id_empregado 
 where Emp.data_contratacao<Ger.data_contratacao order by Emp.sobrenome;

10

select Departamento.id_departamento, nome, primeiro_nome, sobrenome from
Departamento left join Empregado using(id_departamento) order by nome;
