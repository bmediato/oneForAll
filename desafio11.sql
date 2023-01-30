SELECT nome_cancao AS "nome_musica",
 CASE 
	WHEN nome_cancao LIKE '%Bard%' THEN REPLACE(nome_cancao, 'Bard', 'QA')
	WHEN nome_cancao LIKE '%Amar%' THEN REPLACE(nome_cancao, 'Amar', 'Code Review')
	WHEN nome_cancao LIKE '%Pais%' THEN REPLACE(nome_cancao, 'Pais', 'Pull Requests')
	WHEN nome_cancao LIKE '%SOUL%' THEN REPLACE(nome_cancao, 'SOUL', 'CODE')
	WHEN nome_cancao LIKE '%SUPERSTAR%' THEN REPLACE(nome_cancao, 'SUPERSTAR', 'SUPERDEV')
END AS novo_nome
 FROM SpotifyClone.cancoes
HAVING novo_nome <> 'NULL'
 ORDER BY nome_cancao DESC;