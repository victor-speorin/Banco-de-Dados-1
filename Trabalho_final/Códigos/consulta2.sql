select p.nome, a.matricula from aluno a join pessoa p on p.id = a.id
where not exists (select * from contato c where a.id = c.cod_aluno);