DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.artista (
    artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_artista VARCHAR(50) NOT NULL
);

CREATE TABLE SpotifyClone.albuns (
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_album VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES artista (artista_id)
);
  
CREATE TABLE SpotifyClone.cancoes (
    cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cancao VARCHAR(100) NOT NULL,
    duracao_segundos INT NOT NULL,
    ano_lancamento INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
);
  
CREATE TABLE SpotifyClone.plano (
    plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_plano VARCHAR(50) NOT NULL,
    valor_plano DECIMAL(3 , 2 ) NOT NULL
);
  
CREATE TABLE SpotifyClone.usuario (
    usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    data_assinatura DATE,
    FOREIGN KEY (plano_id)
        REFERENCES plano (plano_id)
);
  
CREATE TABLE SpotifyClone.historico_reproducao (
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    data_reproducao DATETIME,
    CONSTRAINT PRIMARY KEY (usuario_id , cancao_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
    FOREIGN KEY (cancao_id)
        REFERENCES cancoes (cancao_id)
);
  
CREATE TABLE SpotifyClone.seguindo_artista (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (usuario_id , artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES usuario (usuario_id),
    FOREIGN KEY (artista_id)
        REFERENCES artista (artista_id)
);

  INSERT INTO SpotifyClone.artista (nome_artista)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu Do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.albuns (nome_album, artista_id)
  VALUES
    ('Renaissance', 1),
    ('Jazz', 2),
    ('Hot Space', 2),
    ('Falso Brilhante', 3),
    ('Vento de Maio', 3),
    ('QVVJFA?', 4),
    ('Somewhere Far Beyond', 5),
    ('I Put A Spell On You', 6);
    
INSERT INTO SpotifyClone.cancoes (nome_cancao, duracao_segundos, ano_lancamento, album_id)
VALUES
    ('BREAK MY SOUL', 279, 2022, 1),
    ('VIRGOS GROOVE', 369, 2022, 1),
    ('ALIEN SUPERSTAR', 116, 2022, 1),
    ('DONT STOP ME NOW', 203, 1978, 2),
    ('UNDER PRESSURE', 152, 1982, 3),
    ('COMO NOSSOS PAIS', 105, 1998, 4),
    ('O MEDO DE AMAR É O MEDO DE SER LIVRE', 207, 2001, 5),
    ('SAMBA EM PARIS', 267, 2003, 6),
    ('THE BARDS SONG', 244, 2007, 7),
    ('FEELING GOOD', 100, 2012, 8);
    
INSERT INTO SpotifyClone.plano (nome_plano, valor_plano)
VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitario', 5.99),
    ('pessoal', 6.99);
    
INSERT INTO SpotifyClone.usuario (nome_usuario, idade, plano_id, data_assinatura)
VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 2, '2017-12-30'),
    ('Martin Fowler', 46, 2, '2017-01-17'),
    ('Sandi Metz', 58, 2, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 4, '2019-06-05'),
    ('Judith Butler', 45, 4, '2020-05-13'),
    ('Jorge Amado', 58, 4, '2017-02-17');

INSERT INTO SpotifyClone.historico_reproducao (usuario_id, cancao_id, data_reproducao)
VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
    
INSERT INTO SpotifyClone.seguindo_artista (usuario_id, artista_id)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2 ,1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);
