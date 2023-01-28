SELECT 
    u.nome_usuario AS usuario,
    COUNT(hr.usuario_id) AS qt_de_musicas_ouvidas,
    SUM(c.duracao_segundos) / 60 AS total_minutos
FROM
    SpotifyClone.usuario AS u
        INNER JOIN
    SpotifyClone.historico_reproducao AS hr ON u.usuario_id = hr.usuario_id
        INNER JOIN
    SpotifyClone.cancoes AS c ON hr.cancao_id = c.cancao_id
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario;