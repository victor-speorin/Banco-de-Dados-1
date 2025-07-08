select d.id, d.nome, count(distinct m.cod_prof) as qtd_prof_pode_ministrar, count(distinct tm.cod_prof) as qtd_efetivos
from disciplina d
left join ministra m on d.id = m.cod_disciplina
left join turma_ministra tm on tm.cod_disciplina = d.id
group by d.id, d.nome;