SELECT 
    COUNT(hr.usuario_id) AS quantidade_musicas_no_historico
FROM
    SpotifyClone.historico_reproducao AS hr
    WHERE hr.usuario_id=1;