select e.nome, p.nome from escola e
join professor pr on pr.id = e.cod_prof
join pessoa p on pr.id = p.id
where p.cod_cidade <> e.cod_cidade;