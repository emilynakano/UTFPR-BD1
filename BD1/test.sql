
-- @block
-- exercise 1
SELECT departamento.nome, empregado.id_empregado, empregado.sobrenome, empregado.salario  FROM empregado 
JOIN departamento 
ON departamento.id_departamento = empregado.id_departamento
WHERE empregado.salario >= ((SELECT SUM(CASE WHEN empregado.salario > 5000 THEN empregado.salario ELSE 0 END) FROM empregado) / (SELECT SUM(CASE WHEN salario > 5000 THEN 1 ELSE 0 END) FROM empregado))
ORDER BY empregado.id_departamento, empregado.id_empregado



