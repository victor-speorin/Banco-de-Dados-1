select a.matricula, c.nome, c.telefone
from aluno a, contato c
where a.id = c.cod_aluno
order by a.matricula, c.nome;