SELECT sobrenome, salario, bonus FROM empregado
WHERE salario BETWEEN 500 AND 2000
ORDER BY sobrenome
LIMIT 2 OFFSET 2
-- limit 2,2

-- @block
SELECT salario, sobrenome, bonus FROM empregado
WHERE salario < 5000 AND bonus IS TRUE
LIMIT 2
-- @block
SELECT DISTINCT id_departamento FROM projeto
WHERE descricao LIKE '%sistema%'

-- @block
SELECT * FROM departamento
WHERE nome LIKE 'D%S'
AND id_gerente IS NOT NULL

-- @block
SELECT * FROM departamento
WHERE id_departamento_gerencia IS NULL

-- @block
SELECT * FROM empregado
WHERE sobrenome LIKE 'G%'
AND (salario BETWEEN 1000 AND 4000)
AND (sexo = 'M' OR bonus > 200)
ORDER BY sobrenome

-- @block
SELECT salario, sobrenome, bonus FROM empregado
WHERE (salario > 1000) AND (bonus BETWEEN 400 AND 500) AND (id_nivel_escolaridade > 5)
ORDER BY sobrenome

-- @block
SELECT salario, sobrenome, bonus FROM empregado
WHERE (salario > 1000 AND bonus > 100) 
OR (id_nivel_escolaridade > 4 AND salario > 2000)
ORDER BY sobrenome

-- @block
SELECT sobrenome, salario FROM empregado
WHERE YEAR(data_nascimento) > '1985'
AND salario > 1000 
AND bonus < 500

-- @block
SELECT sobrenome, salario, bonus FROM empregado
WHERE (sexo = 'M') AND (salario > 1000  || bonus < 500)

-- @block
SELECT DISTINCT id_nivel_escolaridade 
FROM empregado
ORDER BY id_nivel_escolaridade DESC
-- @block
SELECT sobrenome, primeiro_nome, id_departamento 
FROM empregado
WHERE YEAR(data_nascimento) = '1994'
AND salario > 500
ORDER BY id_departamento DESC, salario ASC

-- @block
SELECT id_empregado, sobrenome, data_nascimento, salario 
FROM empregado 
WHERE (salario * 12) > 1000 
ORDER BY salario DESC

-- @block
select * from empregado

-- @block
USE rh
