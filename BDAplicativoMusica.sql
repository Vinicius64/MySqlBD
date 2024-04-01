create database ead3;
use ead3;

CREATE TABLE usuario
(
 id int PRIMARY KEY,
 nome varchar(40) NOT NULL,
 email varchar(40) not null
);
CREATE TABLE playlist
(
 codigo int PRIMARY KEY,
 nome varchar(40) NOT NULL,
 dataDeCriacao date,
 codUsuario int,
 constraint fk_usuario foreign key (codUsuario) references usuario(id) on update cascade on delete cascade
);
CREATE TABLE artista
(
 id int PRIMARY KEY,
 nome varchar(40) NOT NULL
);
CREATE TABLE genero
(
 id int PRIMARY KEY,
 nome varchar(40) NOT NULL
);
CREATE TABLE musica
(
 id int PRIMARY KEY,
 titulo varchar(40) NOT NULL,
 duracao TIME,
 idGenero int,
 constraint fk_Genero foreign key (idGenero) references genero(id)
);
CREATE TABLE compMusica
(
 idArtista int,
 idMusica int,
 constraint fk_Artistas foreign key (idArtista) references artista(id),
 constraint fk_Musica foreign key (idMusica) references musica(id)
);
CREATE TABLE addMusica
(
 idPlaylist int,
 idMusica int,
 constraint fk_Playlist foreign key (idPlaylist) references playlist(codigo),
 constraint fk_Musicas foreign key (idMusica) references musica(id)
);
INSERT INTO usuario (id, nome, email)
VALUES
  (1, 'João da Silva', 'joao.silva@email.com'),
  (2, 'Maria Santos', 'maria.santos@email.com'),
  (3, 'Pedro Oliveira', 'pedro.oliveira@email.com'),
  (4, 'Ana Pereira', 'ana.pereira@email.com'),
  (5, 'Carlos Fernandes', 'carlos.fernandes@email.com'),
  (6, 'Julia Rodrigues', 'julia.rodrigues@email.com'),
  (7, 'Rafaela Sousa', 'rafaela.sousa@email.com'),
  (8, 'Lucas Lima', 'lucas.lima@email.com');
  
  INSERT INTO artista (id, nome) VALUES
  (1, 'Freddie Mercury'),
  (2, 'Ed Sheeran'),
  (3, 'Lil Nas X'),
  (4, 'Frank Sinatra'),
  (5, 'Darius Rucker'),
  (6, 'Zedd'),
  (7, 'Harry Styles'),
  (8, 'Bob Marley'),
  (9, 'The Beatles'),
  (10, 'Michael Jackson'),
  (11, 'Eagles'),
  (12, 'Oasis'),
  (13, 'Adele'),
  (14, 'Mark Ronson'),
  (15, 'Luis Fonsi'),
  (16, 'Earth, Wind & Fire');
  
  INSERT INTO playlist (codigo, nome, dataDeCriacao, codUsuario)
VALUES
  (1, 'Minha Playlist 1', '2023-01-15', 1),
  (2, 'Músicas Favoritas', '2023-02-20', 2),
  (3, 'Rock Classics', '2023-03-10', 3),
  (4, 'Playlist de Verão', '2023-04-05', 1),
  (5, 'Jazz Lounge', '2023-05-12', 4),
  (6, 'Músicas para Malhar', '2023-06-25', 2),
  (7, 'Chill Out Vibes', '2023-07-18', 3),
  (8, 'Minha Lista de Reprodução', '2023-08-30', 4),
  (9, 'Outra Lista de Reprodução', '2023-09-10', 5),
  (10, 'Pop Hits', '2023-10-05', 6),
  (11, 'Country Music', '2023-11-15', 7),
  (12, 'R&B Grooves', '2023-12-20', 8);
  
  INSERT INTO genero (id, nome)
VALUES
  (1, 'Rock'),
  (2, 'Pop'),
  (3, 'Hip-Hop'),
  (4, 'Jazz'),
  (5, 'Country'),
  (6, 'Electronic'),
  (7, 'R&B'),
  (8, 'Reggae');
  
  INSERT INTO musica (id, titulo, duracao, idGenero)
VALUES
  (1, 'Bohemian Rhapsody', '00:05:55', 1),
  (2, 'Shape of You', '00:03:53', 2),
  (3, 'Old Town Road', '00:02:37', 3),
  (4, 'Fly Me to the Moon', '00:02:34', 4),
  (5, 'Wagon Wheel', '00:03:58', 5),
  (6, 'Clarity', '00:04:31', 6),
  (7, 'Adore You', '00:03:20', 7),
  (8, 'No Woman No Cry', '00:03:01', 8);
  
  INSERT INTO musica (id, titulo, duracao, idGenero)
VALUES
  (9, 'Yesterday', '00:02:03', 4), 
  (10, 'Billie Jean', '00:04:54', 7), 
  (11, 'Hotel California', '00:06:30', 1), 
  (12, 'Wonderwall', '00:04:19', 1), 
  (13, 'Rolling in the Deep', '00:03:49', 2), 
  (14, 'Uptown Funk', '00:04:31', 2), 
  (15, 'Despacito', '00:03:47', 3), 
  (16, 'Boogie Wonderland', '00:05:15', 6); 
  
  INSERT INTO compMusica (idArtista, idMusica) VALUES
  (1, 1),(2, 2),(3, 3),(4, 4),(5, 5),
  (6, 6),(7, 7),(8, 8),(9, 9),(10, 10),
  (11, 11),(12, 12),(13, 13),(14, 14),
  (15, 15),(16, 16);
  
  INSERT INTO addMusica (idPlaylist, idMusica)
VALUES
  (1, 1), (1, 2), (2, 3), (2, 4), (3, 5),
  (3, 6), (4, 7), (4, 8), (5, 9), (5, 10),
  (6, 11), (6, 12), (7, 13), (7, 14), (8, 15),
  (8, 16), (1, 3), (2, 5), (3, 7), (4, 9),
  (5, 11), (6, 13), (7, 15), (8, 2), (1, 4),
  (2, 6), (3, 8), (4, 10), (5, 12), (6, 14),
  (7, 16), (8, 1);
-- Retorna uma tabela com as musicas com tempo de duração superior a 2min e inferior a 3
select * from musica having duracao>'00:02:00' and duracao<'00:03:00';
-- Retorna uma tabela com as musicas com digito indicador igual a 7 ou 6
select * from musica where idGenero=7 or idGenero=6;
-- Retorna uma tabela com os usuarios que possuem o nome iniciando com a letra j e o id igual a 6
select * from usuario where nome like'j%' and id=6;
  
-- Retorna uma tabela com informações id, titulo, duração da tabela musica e com o respectivo nome do genero relacionado pelo id
select m.id, m.titulo, m.duracao, g.nome
from musica m inner join genero g
on m.idGenero = g.id;

-- Retorna uma tabela com informações codigo, nome, data de criação da tabela playlist e com o respectivo 
-- nome do usuario que a criaou relacionado pelo id
select p.codigo, p.nome, p.dataDeCriacao, u.nome
from playlist p inner join usuario u
on p.codUsuario = u.id;
-- Essa tabela ira utilizar os id de artista, id da musica da tabela compmusica relacionado-a com as tabelas artista e musica.
-- Retornando o nome do artista e o titulo da musica para cada item.
select a.nome,m.titulo
from compmusica c inner join artista a
on c.idArtista = a.id inner join musica m on c.idMusica=m.id;

-- Essa tabela ira utilizar os id da playlist, id da musica da tabela compmusica relacionado-a com as tabelas playlist e musica.
-- Retornando o nome da playlist e o titulo da musica para cada item.
select p.nome,m.titulo
from addmusica a inner join playlist p
on a.idPlaylist = p.codigo inner join musica m on a.idMusica=m.id;

-- Essa tabela relaciona a qauntidade de musicas para cada playlist.
select p.nome,count(m.id) as 'Quantidade de musicas na playlist'
from addmusica a inner join playlist p
on a.idPlaylist = p.codigo inner join musica m on a.idMusica=m.id group by p.nome;

-- Essa tabela retorna o nome da playlist e o seu respectivo tempo de duração.
select p.nome,sec_to_time(sum(time_to_sec(m.duracao))) as 'tempo de duração'
from addmusica a inner join playlist p
on a.idPlaylist = p.codigo inner join musica m on a.idMusica=m.id group by p.nome;

-- Essa tabela retorna o tempo de duração em relação ao genero das musicas, mas somente os que forem superiores a 10min.
select g.nome, sec_to_time(sum(time_to_sec(m.duracao))) as 'tempo de duração' from musica m inner join genero g
on m.idGenero = g.id group by g.nome having sec_to_time(sum(time_to_sec(m.duracao)))>'00:10:00';

-- Essa tabela retorna a quantidade de playlists criadas em relação ao usuario, mas somente aqueles que criaram mais que 1 playlist.
select  u.nome,count(p.dataDeCriacao) as 'plalists criadas'
from playlist p inner join usuario u
on p.codUsuario = u.id group by u.nome having count(p.dataDeCriacao)>1 ;

