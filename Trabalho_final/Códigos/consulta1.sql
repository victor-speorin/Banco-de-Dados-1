select e.nome, e.cod_cidade from escola e
where not exists (
select * from aluno a, turma t, pessoa p
where a.id = p.id
and p.cod_cidade <> e.cod_cidade
and a.cod_turma = t.id
and t.cod_escola = e.id);