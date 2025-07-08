select e.nome, count(distinct t.id) as num_turmas, count(distinct p.id) as num_prof
from escola e, turma t, turma_ministra m, professor p
where t.cod_escola = e.id and m.cod_turma = t.id and p.id = m.cod_prof
group by e.nome;