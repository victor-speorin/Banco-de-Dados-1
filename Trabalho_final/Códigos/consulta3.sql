select t.id, t.nome, count(a.id) as total_alunos from turma t
join aluno a on a.cod_turma = t.id
group by t.id, t.nome
having count(a.id) > 5;