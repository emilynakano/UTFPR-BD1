
-- @block
-- exercise 7
SELECT d.id_departamento, d.nome, COUNT(CASE WHEN DATEDIFF(p.data_fim, p.data_inicio) > (SELECT AVG(DATEDIFF(p2.data_fim, p2.data_inicio)) FROM projeto p2) THEN 1 ELSE NULL END) AS quantidade_projetos
FROM departamento d
JOIN projeto p ON p.id_departamento = d.id_departamento
GROUP BY d.id_departamento
/* SELECT (SELECT COUNT(*) FROM projeto p), (SELECT SUM(DATEDIFF(p.data_fim, p.data_inicio)) FROM projeto p), id_departamento, nome, (
  SELECT COUNT(*) 
  FROM projeto 
  WHERE projeto.id_departamento = departamento.id_departamento
  AND DATEDIFF(data_fim, data_inicio) > (
    (SELECT SUM(DATEDIFF(p.data_fim, p.data_inicio)) FROM projeto p)
    /
    (SELECT COUNT(*) FROM projeto p)
  )
) 
FROM departamento */

-- @block
-- exercise 6
SELECT d.id_departamento, d.nome, COUNT(DISTINCT p.id_projeto) AS quantidade_projetos
FROM departamento d
JOIN projeto p ON p.id_departamento = d.id_departamento
JOIN empregado e ON e.id_departamento = d.id_departamento
GROUP BY d.id_departamento, d.nome
HAVING SUM(CASE WHEN EXTRACT(YEAR FROM p.data_inicio) = '2015' THEN 1 ELSE NULL END) >= 1
AND AVG(e.salario) > 500 
/* SELECT id_departamento, nome, (
  SELECT COUNT(*) 
  FROM projeto 
  WHERE projeto.id_departamento = departamento.id_departamento
) 
FROM departamento 
WHERE EXISTS (
  SELECT * FROM projeto
  WHERE projeto.id_departamento = departamento.id_departamento 
  AND EXTRACT(YEAR FROM projeto.data_inicio) = 2015
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
) */

-- @block
-- exercise 5
/* SELECT id_departamento, nome, (
    SELECT COUNT(*) 
    FROM empregado 
    WHERE empregado.id_departamento = departamento.id_departamento
  ) AS quantidade_empregados
FROM departamento
WHERE NOT EXISTS (
    SELECT * FROM empregado 
    WHERE empregado.id_departamento = departamento.id_departamento AND empregado.sexo = 'M'
  ) AND (SELECT AVG(salario) FROM empregado WHERE empregado.id_departamento = departamento.id_departamento) > 500 */
SELECT d.id_departamento, d.nome, COUNT(e.id_empregado) AS quantidade_empregados
FROM departamento d
JOIN empregado e
ON d.id_departamento = e.id_departamento
GROUP BY e.id_departamento
HAVING COUNT(CASE WHEN e.sexo <> 'F' THEN 1 ELSE NULL END) = 0 AND AVG(e.salario) > 500


-- @block
-- exercise 4
SELECT d.id_departamento, d.nome, e.primeiro_nome, e.sobrenome
FROM departamento d
JOIN empregado e ON e.id_departamento = d.id_departamento
WHERE NOT EXISTS (SELECT * FROM empregado e2 WHERE d.id_departamento = e2.id_departamento AND e2.sexo = "M")
GROUP BY e.id_empregado
/* SELECT d.id_departamento, d.nome, JSON_OBJECT(
  'empregadas', JSON_ARRAYAGG(JSON_OBJECT('nome', CONCAT(primeiro_nome, " ", sobrenome)))
)
FROM departamento d
JOIN empregado e ON e.id_departamento = d.id_departamento
GROUP BY d.id_departamento
HAVING SUM(CASE WHEN e.sexo <> "F" THEN 1 ELSE 0 END) = 0 */

-- @block
-- exercise 3
/* SELECT id_projeto, descricao, DATEDIFF(data_fim, data_inicio) AS data_duracao FROM projeto
WHERE DATEDIFF(data_fim, data_inicio) = (
    SELECT MIN(DATEDIFF(data_fim, data_inicio))
    FROM projeto
  ) */
SELECT id_projeto, descricao, DATEDIFF(data_fim, data_inicio) AS data_duracao FROM projeto
ORDER BY data_duracao ASC
LIMIT 1
-- @block
-- exercise 2
SELECT id_empregado, sobrenome 
FROM empregado
WHERE id_empregado NOT IN (SELECT id_empregado FROM empregado_projeto)

-- @block
-- exercise 1
SELECT departamento.nome, empregado.id_empregado, empregado.sobrenome, empregado.salario  
FROM empregado 
JOIN departamento 
ON departamento.id_departamento = empregado.id_departamento
WHERE empregado.salario >= (SELECT AVG(e.salario) FROM empregado e WHERE e.salario > 5000)
ORDER BY empregado.id_departamento, empregado.id_empregado





