1) select sobrenome, nome, descricao, (salario+bonus) as 'Total',
(salario+bonus)*1.05 as 'Aumento' from Empregado join Departamento
using(id_departamento) join Nivel_Escolaridade using(id_nivel_escolaridade)
where ((salario+bonus)*1.05)<20000

2) select sobrenome, nome, descricao, salario+1200, format((bonus/2),2) from
Empregado join Departamento using(id_departamento) join Nivel_Escolaridade using(id_nivel_escolaridade) where id_nivel_escolaridade between 2 and 7 order by sobrenome;

3) select sobrenome, nome, salario, salario-100 from Empregado Join 
Departamento using(id_departamento) where (nome='Testes') or ((salario*0.8)>=5000)
or (salario*2.2)<=3000

4)select sobrenome, descricao, (salario+bonus) from Empregado join Departamento
 using(id_departamento) join Nivel_Escolaridade using(id_nivel_escolaridade) 
 where (salario+bonus)>(salario*1.1) and (nome='Financeiro') order by (salario+bonus)

5)select Departamento.id_departamento, nome, coalesce(id_departamento_gerencia,'Desconhecido'), sobrenome from Departamento join Empregado on id_gerente=id_empregado

6)select id_empregado, sobrenome, format((datediff(data_contratacao, data_nascimento)/365),0)
from Empregado where (datediff(data_contratacao, data_nascimento)/365)<25 order by 
datediff(curdate(),data_nascimento)

7)select descricao, month(data_inicio) as 'mês', year(data_inicio) as 'Ano', sobrenome from Projeto join Empregado on id_gerente=id_empregado where data_fim>'2015-01-01' order by id_projeto;

8)select id_projeto, descricao, format((datediff(data_fim, data_inicio)/7),1) from Projeto
where year(data_inicio)>=2014 order by id_projeto 

9)select id_projeto, data_inicio, data_fim, 
date_add(data_inicio, interval (datediff(data_fim, data_inicio)*1.1) day) as 'Data Final Real'
from Projeto where year(data_inicio) between 2013 and 2016 order by id_projeto
