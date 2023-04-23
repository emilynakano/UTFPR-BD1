SELECT id_projeto, data_inicio, data_fim, DATE_ADD(data_inicio, INTERVAL DATEDIFF(data_fim, data_inicio) * 1.1 DAY) FROM projeto
WHERE YEAR(data_inicio) BETWEEN '2013' AND '2016'
ORDER BY id_projeto

-- @block
SELECT id_projeto, descricao, FORMAT(DATEDIFF(data_fim, data_inicio) / 7, 1) FROM projeto
WHERE YEAR(data_inicio) >= '2014'
ORDER BY id_projeto

-- @block
SELECT descricao, MONTH(data_inicio), YEAR(data_inicio), sobrenome FROM projeto
LEFT JOIN empregado e ON e.id_empregado = id_gerente
WHERE data_fim > '2015/01/01'
ORDER BY id_projeto
-- @block
SELECT 
  id_empregado, 
  sobrenome, 
  FORMAT(DATEDIFF(data_contratacao, data_nascimento) / 365, 0)
FROM empregado
WHERE DATEDIFF(data_contratacao, data_nascimento) / 365 < 25
ORDER BY DATEDIFF(CURDATE(), data_nascimento)
-- @block
SELECT 
  d.id_departamento, 
  d.nome,
  CASE WHEN ger.nome IS NULL THEN 'Desconhecido' ELSE ger.nome END
FROM departamento d
LEFT JOIN departamento ger ON ger.id_departamento = d.id_departamento_gerencia
-- @block
SELECT 
  sobrenome, 
  d.nome,
  salario,
  salario - 100
FROM empregado
JOIN departamento d USING(id_departamento)
WHERE d.nome = 'Testes' || (0.8 * salario >= 5000) || (2.2 * salario <= 3000)
-- @block
SELECT 
  sobrenome, 
  d.nome,
  ne.descricao,
  salario + 1200,
  bonus / 2
FROM empregado
JOIN departamento d USING(id_departamento)
JOIN nivel_escolaridade ne USING(id_nivel_escolaridade)
WHERE id_nivel_escolaridade BETWEEN 2 AND 7
ORDER BY sobrenome

-- @block
SELECT 
  CONCAT(primeiro_nome, " ", sobrenome) AS nome_completo,
  d.nome AS departamento_nome, 
  ne.descricao AS nivel_escolaridade, 
  (salario + bonus) * 1.05 AS rendimento_aumento, 
  (salario + bonus) AS rendimento  
FROM empregado
JOIN departamento d USING(id_departamento)
JOIN nivel_escolaridade ne USING(id_nivel_escolaridade)
WHERE (salario + bonus) * 1.05  <= 20000
ORDER BY nome_completo
