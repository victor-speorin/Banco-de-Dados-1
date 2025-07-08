select tm.cod_prof, p.nome
from turma_ministra tm
join pessoa p on tm.cod_prof = p.id
group by cod_prof
having count(*) = 1;