select e.nome, (count(distinct a.id) / count(distinct p.id)) as razao
from escola e, turma t, turma_ministra m, professor p, aluno a, disciplina d
where t.cod_escola = e.id and m.cod_turma = t.id
and a.cod_turma = t.id and d.id = m.cod_disciplina and p.id = m.cod_prof
group by e.nome;