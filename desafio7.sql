SELECT 
    a.nome_artista AS artista,
	ab.nome_album AS album,
	COUNT(sa.artista_id) AS seguidores
FROM
    SpotifyClone.artista AS a
        INNER JOIN
    SpotifyClone.albuns AS ab ON a.artista_id = ab.artista_id
        INNER JOIN
    SpotifyClone.seguindo_artista AS sa ON sa.artista_id = a.artista_id
    GROUP BY a.nome_artista, ab.nome_album
    ORDER BY seguidores DESC, artista, album;