SELECT 
    u.nome_usuario AS usuario, IF(MAX(YEAR(hr.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
FROM
    SpotifyClone.usuario AS u
        INNER JOIN
    SpotifyClone.historico_reproducao AS hr ON u.usuario_id = hr.usuario_id
GROUP BY u.nome_usuario
ORDER BY u.nome_usuario;
