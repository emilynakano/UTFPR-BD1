2)select Departamento.nome, count(*) from Empregado join Departamento using(id_departamento) group by(id_departamento)

3)select Departamento.nome, count(*) 'Quantidade' from Empregado join
Departamento using(id_departamento) where Departamento.nome like 'D%' group by (id_departamento)
 having count(*)>=3 order by Departamento.nome;

4)select Departamento.nome, count(*) as 'Quantidade' from Empregado join Departamento
using(id_departamento) where id_empregado not in (select id_empregado from Empregado join Nivel_Escolaridade using(id_nivel_escolaridade) where descricao<>'Superior') group by id_departamento
 having count(*)>=1;

5)select Departamento.nome, sexo, format(avg(salario+bonus),2) from Empregado join Departamento using(id_departamento) group by id_departamento,sexo having count(*)>=2

6)select Departamento.nome, format(avg(salario),2), format(avg(bonus),2) from Empregado join Departamento using(id_departamento)
group by(id_departamento) having avg(bonus)>100 and avg(salario)>1000