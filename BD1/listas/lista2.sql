SELECT d.id_departamento, d.nome, e.primeiro_nome AS nome_gerente, e.sobrenome AS sobrenome_gerente
FROM departamento d
LEFT JOIN empregado e ON e.id_empregado = d.id_gerente
ORDER BY d.nome
--@block
SELECT e.id_departamento, e.sobrenome, ger.sobrenome, e.data_contratacao, ger.data_contratacao FROM empregado e
JOIN departamento d USING(id_departamento)
JOIN empregado ger ON ger.id_empregado = d.id_gerente
WHERE ger.data_contratacao > e.data_contratacao

--@block
SELECT a.id_atividade, ep.data_inicio, p.id_projeto, e.sobrenome, e2.sobrenome FROM atividade a
JOIN empregado_projeto ep USING(id_atividade)
JOIN empregado e USING(id_empregado)
JOIN projeto p USING(id_projeto)
JOIN empregado e2 ON e2.id_empregado = p.id_gerente
WHERE ep.data_inicio > '2013/01/01'
--@block
SELECT e.id_departamento, p.descricao, e.sobrenome, ep.id_atividade FROM empregado e
JOIN empregado_projeto ep USING(id_empregado)
JOIN projeto p USING (id_projeto)
WHERE e.id_departamento BETWEEN 2 AND 5
ORDER BY e.id_departamento, e.sobrenome, ep.id_atividade

--@block
SELECT e.id_departamento, e.sobrenome, p.descricao, id_atividade FROM empregado e
JOIN empregado_projeto ep USING(id_empregado)
JOIN projeto p USING(id_projeto)
WHERE e.id_departamento = 5
--@block
SELECT e.id_empregado, e.sobrenome, p.id_projeto, p.descricao, a.id_atividade, a.descricao, ep.data_fim FROM atividade a
JOIN empregado_projeto ep USING(id_atividade)
JOIN empregado e USING(id_empregado)
JOIN projeto p USING(id_projeto)
WHERE ep.data_inicio = '2015-08-01'
ORDER BY p.id_projeto, e.id_empregado, a.id_atividade


--@block
SELECT DISTINCT e.id_empregado, e.sobrenome, ep.id_projeto, p.descricao FROM empregado e
JOIN empregado_projeto ep ON ep.id_empregado = e.id_empregado 
JOIN projeto p ON ep.id_projeto = p.id_projeto
WHERE p.id_projeto = 4
ORDER BY e.id_empregado, ep.id_projeto
--@block
SELECT DISTINCT p.id_projeto, p.descricao, a.descricao FROM projeto p
JOIN empregado_projeto ep ON ep.id_projeto = p.id_projeto
JOIN atividade a ON a.id_atividade = ep.id_atividade
WHERE p.id_projeto LIKE '%4'
ORDER BY p.id_projeto

/* 
SELECT p.id_projeto, p.descricao, JSON_OBJECT(
  'atividade', JSON_ARRAYAGG(JSON_OBJECT('nome', a.descricao))
)
FROM projeto p
JOIN empregado_projeto ep ON ep.id_projeto = p.id_projeto
JOIN atividade a ON a.id_atividade = ep.id_atividade
GROUP BY p.id_projeto
 */
--@block
SELECT d.nome, e.primeiro_nome, e.sobrenome FROM departamento d
JOIN empregado e ON e.id_empregado = d.id_gerente
ORDER BY d.nome

--@block
SELECT e.primeiro_nome, e.sobrenome, d.nome FROM empregado e
JOIN departamento d ON d.id_departamento = e.id_departamento
ORDER BY e.primeiro_nome, e.sobrenome, d.nome









