SELECT 
    a.nome_artista AS artista, ab.nome_album AS album
FROM
    SpotifyClone.artista AS a
        INNER JOIN
    SpotifyClone.albuns AS ab ON a.artista_id = ab.artista_id
    WHERE a.nome_artista = 'Elis Regina'
    ORDER BY album;