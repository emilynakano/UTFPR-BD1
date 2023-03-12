1 - select id_empregado, sobrenome, id_departamento, salario from empregado where salario >(select avg(salario) from empregado where salario>5000)

2 - select id_empregado, sobrenome from empregado where id_empregado not in(select id_empregado from empregado_projeto where id_empregado is not null)

3 - select id_projeto, descricao from projeto where datediff(data_fim, data_inicio)=(select min(datediff(data_fim, data_inicio)) from projeto);

4 - select id_departamento, nome, primeiro_nome, sobrenome from departamento join empregado using(id_departamento) where id_departamento in (select distinct(id_departamento) from empregado where (sexo='F') and (id_departamento not in (select distinct(id_departamento) from empregado where sexo='M')));

5 - select Departamento.nome, count(*) as 'Quantidade' from Empregado join Departamento using(id_departamento) where id_departamento not in (select id_departamento from Empregado where sexo='M')
 group by(id_departamento) having avg(salario)>500

6 - select Departamento.nome, count(*) as 'Quantidade' from Departamento join Projeto using(id_departamento) where year(data_inicio)=2015 and id_departamento in
(select id_departamento from Empregado group by id_departamento having avg(salario)>=500)
 group by(id_departamento) 

7 - select nome, count(*) as 'Quantidade' from Projeto join Departamento using(id_departamento) where id_projeto in (select id_projeto from Projeto group by(id_projeto) having avg(datediff(data_fim, data_inicio))>(select avg(datediff(data_fim, data_inicio)) from Projeto)) group by id_departamento