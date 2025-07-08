select p.id, p.nome, pr.titulacao, count(*) as num_turmas from pessoa p
join professor pr on p.id = pr.id
join turma_ministra t on t.cod_prof = p.id
group by p.id, p.nome, pr.titulacao
having count(*) > 3;