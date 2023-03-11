-- @block
-- exercise 3
SELECT id_projeto, descricao, (
    SELECT MIN(DATEDIFF(data_fim, data_inicio))
    FROM projeto
  ) AS data_diff FROM projeto
WHERE DATEDIFF(data_fim, data_inicio) = (
    SELECT MIN(DATEDIFF(data_fim, data_inicio))
    FROM projeto
  )
-- @block
-- exercise 2
SELECT empregado.id_empregado, empregado.sobrenome 
FROM empregado
WHERE NOT EXISTS (
    SELECT id_empregado 
    FROM empregado_projeto 
    WHERE empregado_projeto.id_empregado = empregado.id_empregado
  )

-- @block
-- exercise 1
SELECT departamento.nome, empregado.id_empregado, empregado.sobrenome, empregado.salario  
FROM empregado 
JOIN departamento 
ON departamento.id_departamento = empregado.id_departamento
WHERE empregado.salario >= ((SELECT SUM(CASE WHEN empregado.salario > 5000 THEN empregado.salario ELSE 0 END) FROM empregado) / (SELECT SUM(CASE WHEN salario > 5000 THEN 1 ELSE 0 END) FROM empregado))
ORDER BY empregado.id_departamento, empregado.id_empregado



