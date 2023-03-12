select id_empregado, sobrenome, data_nascimento, salario 
from empregado where salario>1000 order by salario desc;

select sobrenome, primeiro_nome, id_departamento from empregado
where data_nascimento>='1994-01-01' and data_nascimento<='1994-12-31'
 and salario>500 order by id_departamento desc, salario asc;
 

7
select sobrenome, salario, bonus from Empregado
where (salario>1000 and bonus>100) or (id_nivel_escolaridade>4 and salario>2000)
order by sobrenome;

select sobrenome, salario, bonus from Empregado where
(salario>1000) and (bonus between 400 and 500) and (id_nivel_escolaridade>5)
order by sobrenome;

select sobrenome from Empregado where (sobrenome like 'G%') and
(salario between 1000 and 4000) and (sexo='M' or bonus>200) 
order by sobrenome;

select id_departamento from Departamento 
where id_departamento_gerencia is null;

select id_departamento, nome, id_gerente from Departamento where 
nome like 'D%S' and id_gerente is not null;

select id_departamento, descricao from Projeto where descricao like '%sistema%'; 


select sobrenome, salario, bonus from Empregado 
where salario<5000 and bonus>0 limit 0,2;

select sobrenome, salario, bonus from Empregado where
salario between 500 and 2000 order by sobrenome limit 2,2 