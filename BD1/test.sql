-- @block
-- exercise 7
SELECT (SELECT COUNT(*) FROM projeto p), (SELECT SUM(DATEDIFF(p.data_fim, p.data_inicio)) FROM projeto p), id_departamento, nome, (
  SELECT COUNT(*) 
  FROM projeto 
  WHERE projeto.id_departamento = departamento.id_departamento
  AND DATEDIFF(data_fim, data_inicio) > (
    (SELECT SUM(DATEDIFF(p.data_fim, p.data_inicio)) FROM projeto p)
    /
    (SELECT COUNT(*) FROM projeto p)
  )
) 
FROM departamento

-- @block
-- exercise 6
SELECT id_departamento, nome, (
  SELECT COUNT(*) 
  FROM projeto 
  WHERE projeto.id_departamento = departamento.id_departamento
) 
FROM departamento 
WHERE EXISTS (
  SELECT * FROM projeto
  WHERE projeto.id_departamento = departamento.id_departamento 
  AND EXTRACT(YEAR FROM projeto.data_inicio) >= 2015
  AND (
    (SELECT SUM(salario) 
    FROM empregado
    WHERE empregado.id_departamento = departamento.id_departamento
    ) 
  / 
    (SELECT COUNT(*) 
    FROM empregado
    WHERE empregado.id_departamento = departamento.id_departamento
    )) > 500
)

-- @block
-- exercise 5
SELECT id_departamento, nome, (
    SELECT COUNT(*) 
    FROM empregado 
    WHERE empregado.id_departamento = departamento.id_departamento
  ) AS quantidade_empregados
FROM departamento
WHERE NOT EXISTS (
    SELECT * FROM empregado 
    WHERE empregado.id_departamento = departamento.id_departamento AND empregado.sexo = 'M'
  ) AND ((
    SELECT SUM(salario) FROM empregado 
    WHERE empregado.id_departamento = departamento.id_departamento
  ) / (
    SELECT COUNT(*) FROM empregado 
    WHERE empregado.id_departamento = departamento.id_departamento
  )) > 500
-- @block
-- exercise 4
SELECT id_departamento, nome, (
    SELECT COUNT(*) 
    FROM empregado 
    WHERE empregado.id_departamento = departamento.id_departamento
  ) 
FROM departamento
WHERE NOT EXISTS (
    SELECT * FROM empregado 
    WHERE empregado.id_departamento = departamento.id_departamento AND empregado.sexo = 'M'
  )

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
WHERE empregado.salario >= (SELECT AVG(e.salario) FROM empregado e WHERE e.salario > 5000)
ORDER BY empregado.id_departamento, empregado.id_empregado



