-- Etapa 1: Se o professor que queremos remover for diretor
-- selecionamos outro

SET SQL_SAFE_UPDATES = 0;
UPDATE escola
SET cod_prof = (
    SELECT id_novo_diretor
    FROM (
        SELECT p.id AS id_novo_diretor -- aqui fazemos um select dentro do select pois o mysql não permite fazer update em uma tabela que está na cláusula set
        FROM professor AS p
        JOIN pessoa AS pe ON p.id = pe.id
        LEFT JOIN escola AS e ON p.id = e.cod_prof
        WHERE p.id <> [id_do_professor_a_ser_removido] -- Exclui o professor que será removido
        GROUP BY p.id
        HAVING COUNT(e.id) = 0
        LIMIT 1
    ) AS temp_diretor -- Apelido para a tabela derivada
)
WHERE cod_prof = [id_do_professor_a_ser_removido];

-- Etapa 2: Remover as entradas em Turma_Ministra associadas a este professor
delete from turma_ministra
where cod_prof = [id_do_professor_a_ser_removido];

-- Etapa 3: Remover as entradas em Ministra associadas a este professor
delete from ministra
where cod_prof = [id_do_professor_a_ser_removido];

-- Etapa 4: Remover o professor da tabela Professor( e da tabela Pessoa devido ao ON DELETE CASCADE)
delete from professor
where id = [id_do_professor_a_ser_removido];