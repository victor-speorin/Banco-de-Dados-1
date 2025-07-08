-- Supondo que [ID_PROFESSOR_P1] é o id do professor que sairá de licença
-- e [ID_PROFESSOR_P2] é o id do professor que o substituirá

-- Etapa 1: Garantir que P2 possa ministrar todas as disciplinas de P1
insert ignore into ministra (cod_disciplina, cod_prof)
select cod_disciplina, [ID_PROFESSOR_P2]
from ministra
where cod_prof = [ID_PROFESSOR_P1];

-- Trocar as turmas de P1 para P2
update turma_ministra
set cod_prof = [ID_PROFESSOR_P2]
where cod_prof = [ID_PROFESSOR_P1];