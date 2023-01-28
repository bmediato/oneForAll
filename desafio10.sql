SELECT 
    c.nome_cancao AS nome, COUNT(hr.cancao_id) AS reproducoes
FROM
    SpotifyClone.cancoes AS c
        INNER JOIN
    SpotifyClone.historico_reproducao AS hr ON hr.cancao_id = c.cancao_id
        INNER JOIN
    SpotifyClone.usuario AS u ON hr.usuario_id = u.usuario_id
        INNER JOIN
    SpotifyClone.plano AS p ON p.plano_id = u.plano_id
WHERE
    p.nome_plano = 'gratuito'
        OR p.nome_plano = 'pessoal'
GROUP BY c.nome_cancao
ORDER BY c.nome_cancao;