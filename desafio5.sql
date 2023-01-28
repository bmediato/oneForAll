SELECT 
    c.nome_cancao AS cancao, COUNT(hr.cancao_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS c
        INNER JOIN
    SpotifyClone.historico_reproducao AS hr ON c.cancao_id=hr.cancao_id
    GROUP BY hr.cancao_id
    ORDER BY reproducoes DESC, cancao ASC
    LIMIT 2;