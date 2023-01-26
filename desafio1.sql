DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.artista(
      artista_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_artista VARCHAR(50) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.albuns(
      album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_album VARCHAR(100) NOT NULL,
      artista_id INT NOT NULL,
      FOREIGN KEY(artista_id) REFERENCES artista(artista_id)
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.cancoes(
      cancao_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_cancao VARCHAR(100) NOT NULL,
      duracao_segundos INT NOT NULL,
      ano_lancamento INT NOT NULL,
      album_id INT NOT NULL,
      FOREIGN KEY(album_id) REFERENCES albuns(album_id)
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.plano(
      plano_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_plano VARCHAR(50) NOT NULL,
      valor_plano DECIMAL(3,2) NOT NULL
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.usuario(
      usuario_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      nome_usuario VARCHAR(50) NOT NULL,
      idade INT NOT NULL, 
      plano_id INT NOT NULL,
      data_assinatura DATE,
      FOREIGN KEY(plano_id) REFERENCES plano(plano_id)
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.historico_reproducao(
      usuario_id INT NOT NULL,
      cancao_id INT NOT NULL,
      data_reproducao DATETIME,
      CONSTRAINT PRIMARY KEY(usuario_id, cancao_id),
      FOREIGN KEY(usuario_id) REFERENCES usuario(usuario_id),
      FOREIGN KEY(cancao_id) REFERENCES cancoes(cancao_id)
  ) engine = InnoDB;
  
    CREATE TABLE SpotifyClone.seguindo_artista(
      usuario_id INT NOT NULL,
      artista_id INT NOT NULL,
      CONSTRAINT PRIMARY KEY(usuario_id, artista_id),
      FOREIGN KEY(usuario_id) REFERENCES usuario(usuario_id),
      FOREIGN KEY(artista_id) REFERENCES artista(artista_id),
  ) engine = InnoDB;