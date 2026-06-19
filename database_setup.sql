USE master;
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'CatalogoWebDB')
BEGIN
    CREATE DATABASE CatalogoWebDB;
    PRINT 'Database CatalogoWebDB created.';
END
ELSE
BEGIN
    PRINT 'Database CatalogoWebDB already exists.';
END
GO

USE CatalogoWebDB;
GO
IF OBJECT_ID(N'dbo.Contenidos', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.Contenidos
    (
        Id            INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        Titulo        NVARCHAR(250)     NOT NULL,
        Tipo          NVARCHAR(20)      NOT NULL CHECK (Tipo IN (N'Película', N'Serie')),
        Genero        NVARCHAR(100)     NOT NULL,
        Anio_estreno  INT               NOT NULL,
        Plataforma    NVARCHAR(100)     NOT NULL,
        Estado        NVARCHAR(50)      NOT NULL DEFAULT N'Pendiente',
        Calificacion  INT               NOT NULL CHECK (Calificacion BETWEEN 1 AND 5),
        Resenia       NVARCHAR(MAX)     NULL,
        Temporadas    INT               NULL,   
        Episodios     INT               NULL    
    );
    PRINT 'Table dbo.Contenidos created.';
END
ELSE
BEGIN
    PRINT 'Table dbo.Contenidos already exists. Recreating it to ensure fresh data...';
    DROP TABLE dbo.Contenidos;
    CREATE TABLE dbo.Contenidos
    (
        Id            INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
        Titulo        NVARCHAR(250)     NOT NULL,
        Tipo          NVARCHAR(20)      NOT NULL CHECK (Tipo IN (N'Película', N'Serie')),
        Genero        NVARCHAR(100)     NOT NULL,
        Anio_estreno  INT               NOT NULL,
        Plataforma    NVARCHAR(100)     NOT NULL,
        Estado        NVARCHAR(50)      NOT NULL DEFAULT N'Pendiente',
        Calificacion  INT               NOT NULL CHECK (Calificacion BETWEEN 1 AND 5),
        Resenia       NVARCHAR(MAX)     NULL,
        Temporadas    INT               NULL,   
        Episodios     INT               NULL    
    );
END
GO


PRINT 'Seeding data...';
INSERT INTO dbo.Contenidos
    (Titulo, Tipo, Genero, Anio_estreno, Plataforma, Estado, Calificacion, Resenia, Temporadas, Episodios)
VALUES
    (N'Inception', N'Película', N'Ciencia ficción', 2010, N'Netflix', N'Visto', 4, N'Inception destaca dentro del género ciencia ficción gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'The Dark Knight', N'Película', N'Acción', 2008, N'Amazon Prime Video', N'Visto', 4, N'Una de las cintas de acción más recomendadas del catálogo; The Dark Knight logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Interstellar', N'Película', N'Ciencia ficción', 2014, N'HBO Max', N'Visto', 5, N'Interstellar es un referente del cine de ciencia ficción, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Avengers: Endgame', N'Película', N'Acción', 2019, N'Disney+', N'Visto', 5, N'Dentro del catálogo de acción, Avengers: Endgame sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Parasite', N'Película', N'Drama', 2019, N'HBO Max', N'Visto', 3, N'Una producción de drama que combina un guion sólido con una dirección cuidada; Parasite se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Joker', N'Película', N'Drama', 2019, N'HBO Max', N'Visto', 4, N'Joker destaca dentro del género drama gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'The Shawshank Redemption', N'Película', N'Drama', 1994, N'HBO Max', N'Visto', 4, N'Una de las cintas de drama más recomendadas del catálogo; The Shawshank Redemption logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Pulp Fiction', N'Película', N'Crimen', 1994, N'Netflix', N'Pendiente', 5, N'Pulp Fiction es un referente del cine de crimen, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Forrest Gump', N'Película', N'Drama', 1994, N'Paramount+', N'Pendiente', 5, N'Dentro del catálogo de drama, Forrest Gump sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'The Matrix', N'Película', N'Ciencia ficción', 1999, N'HBO Max', N'Visto', 3, N'Una producción de ciencia ficción que combina un guion sólido con una dirección cuidada; The Matrix se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Titanic', N'Película', N'Romance', 1997, N'Paramount+', N'Visto', 4, N'Titanic destaca dentro del género romance gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Avatar', N'Película', N'Ciencia ficción', 2009, N'Disney+', N'Visto', 4, N'Una de las cintas de ciencia ficción más recomendadas del catálogo; Avatar logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Avatar: The Way of Water', N'Película', N'Ciencia ficción', 2022, N'Disney+', N'Visto', 5, N'Avatar: The Way of Water es un referente del cine de ciencia ficción, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Spider-Man: No Way Home', N'Película', N'Acción', 2021, N'Netflix', N'Visto', 5, N'Dentro del catálogo de acción, Spider-Man: No Way Home sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Top Gun: Maverick', N'Película', N'Acción', 2022, N'Paramount+', N'Visto', 3, N'Una producción de acción que combina un guion sólido con una dirección cuidada; Top Gun: Maverick se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Oppenheimer', N'Película', N'Drama', 2023, N'Amazon Prime Video', N'Visto', 4, N'Oppenheimer destaca dentro del género drama gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Barbie', N'Película', N'Comedia', 2023, N'HBO Max', N'Visto', 4, N'Una de las cintas de comedia más recomendadas del catálogo; Barbie logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'The Godfather', N'Película', N'Crimen', 1972, N'Paramount+', N'Pendiente', 5, N'The Godfather es un referente del cine de crimen, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Fight Club', N'Película', N'Drama', 1999, N'HBO Max', N'Pendiente', 5, N'Dentro del catálogo de drama, Fight Club sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Gladiator', N'Película', N'Acción', 2000, N'Netflix', N'Visto', 3, N'Una producción de acción que combina un guion sólido con una dirección cuidada; Gladiator se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'The Lion King', N'Película', N'Animación', 1994, N'Disney+', N'Visto', 4, N'The Lion King destaca dentro del género animación gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Frozen', N'Película', N'Animación', 2013, N'Disney+', N'Visto', 4, N'Una de las cintas de animación más recomendadas del catálogo; Frozen logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Frozen II', N'Película', N'Animación', 2019, N'Disney+', N'Visto', 5, N'Frozen II es un referente del cine de animación, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Coco', N'Película', N'Animación', 2017, N'Disney+', N'Visto', 5, N'Dentro del catálogo de animación, Coco sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Toy Story', N'Película', N'Animación', 1995, N'Disney+', N'Visto', 3, N'Una producción de animación que combina un guion sólido con una dirección cuidada; Toy Story se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Toy Story 3', N'Película', N'Animación', 2010, N'Disney+', N'Visto', 4, N'Toy Story 3 destaca dentro del género animación gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Inside Out', N'Película', N'Animación', 2015, N'Disney+', N'Visto', 4, N'Una de las cintas de animación más recomendadas del catálogo; Inside Out logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Inside Out 2', N'Película', N'Animación', 2024, N'Disney+', N'Pendiente', 5, N'Inside Out 2 es un referente del cine de animación, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Shrek', N'Película', N'Animación', 2001, N'Netflix', N'Pendiente', 5, N'Dentro del catálogo de animación, Shrek sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Up', N'Película', N'Animación', 2009, N'Disney+', N'Visto', 3, N'Una producción de animación que combina un guion sólido con una dirección cuidada; Up se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'WALL-E', N'Película', N'Animación', 2008, N'Disney+', N'Visto', 4, N'WALL-E destaca dentro del género animación gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Finding Nemo', N'Película', N'Animación', 2003, N'Disney+', N'Visto', 4, N'Una de las cintas de animación más recomendadas del catálogo; Finding Nemo logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'The Incredibles', N'Película', N'Animación', 2004, N'Disney+', N'Visto', 5, N'The Incredibles es un referente del cine de animación, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Despicable Me', N'Película', N'Animación', 2010, N'Netflix', N'Visto', 5, N'Dentro del catálogo de animación, Despicable Me sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Minions', N'Película', N'Animación', 2015, N'Netflix', N'Visto', 3, N'Una producción de animación que combina un guion sólido con una dirección cuidada; Minions se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Encanto', N'Película', N'Animación', 2021, N'Disney+', N'Visto', 4, N'Encanto destaca dentro del género animación gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Moana', N'Película', N'Animación', 2016, N'Disney+', N'Visto', 4, N'Una de las cintas de animación más recomendadas del catálogo; Moana logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Spider-Man: Into the Spider-Verse', N'Película', N'Animación', 2018, N'Netflix', N'Pendiente', 5, N'Spider-Man: Into the Spider-Verse es un referente del cine de animación, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Spider-Man: Across the Spider-Verse', N'Película', N'Animación', 2023, N'Netflix', N'Pendiente', 5, N'Dentro del catálogo de animación, Spider-Man: Across the Spider-Verse sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'The Super Mario Bros. Movie', N'Película', N'Animación', 2023, N'Netflix', N'Visto', 3, N'Una producción de animación que combina un guion sólido con una dirección cuidada; The Super Mario Bros. Movie se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Jurassic Park', N'Película', N'Aventura', 1993, N'Amazon Prime Video', N'Visto', 4, N'Jurassic Park destaca dentro del género aventura gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Jurassic World', N'Película', N'Aventura', 2015, N'HBO Max', N'Visto', 4, N'Una de las cintas de aventura más recomendadas del catálogo; Jurassic World logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Star Wars: Episode IV - A New Hope', N'Película', N'Ciencia ficción', 1977, N'Disney+', N'Visto', 5, N'Star Wars: Episode IV - A New Hope es un referente del cine de ciencia ficción, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Star Wars: The Force Awakens', N'Película', N'Ciencia ficción', 2015, N'Disney+', N'Visto', 5, N'Dentro del catálogo de ciencia ficción, Star Wars: The Force Awakens sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Harry Potter and the Sorcerer''s Stone', N'Película', N'Fantasía', 2001, N'HBO Max', N'Visto', 3, N'Una producción de fantasía que combina un guion sólido con una dirección cuidada; Harry Potter and the Sorcerer''s Stone se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Harry Potter and the Deathly Hallows Part 2', N'Película', N'Fantasía', 2011, N'HBO Max', N'Visto', 4, N'Harry Potter and the Deathly Hallows Part 2 destaca dentro del género fantasía gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'The Lord of the Rings: The Fellowship of the Ring', N'Película', N'Fantasía', 2001, N'HBO Max', N'Visto', 4, N'Una de las cintas de fantasía más recomendadas del catálogo; The Lord of the Rings: The Fellowship of the Ring logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'The Lord of the Rings: The Return of the King', N'Película', N'Fantasía', 2003, N'HBO Max', N'Pendiente', 5, N'The Lord of the Rings: The Return of the King es un referente del cine de fantasía, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'The Hobbit: An Unexpected Journey', N'Película', N'Fantasía', 2012, N'HBO Max', N'Pendiente', 5, N'Dentro del catálogo de fantasía, The Hobbit: An Unexpected Journey sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Pirates of the Caribbean: The Curse of the Black Pearl', N'Película', N'Aventura', 2003, N'Disney+', N'Visto', 3, N'Una producción de aventura que combina un guion sólido con una dirección cuidada; Pirates of the Caribbean: The Curse of the Black Pearl se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Iron Man', N'Película', N'Acción', 2008, N'Disney+', N'Visto', 4, N'Iron Man destaca dentro del género acción gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'The Avengers', N'Película', N'Acción', 2012, N'Disney+', N'Visto', 4, N'Una de las cintas de acción más recomendadas del catálogo; The Avengers logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Black Panther', N'Película', N'Acción', 2018, N'Disney+', N'Visto', 5, N'Black Panther es un referente del cine de acción, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Guardians of the Galaxy', N'Película', N'Acción', 2014, N'Disney+', N'Visto', 5, N'Dentro del catálogo de acción, Guardians of the Galaxy sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Doctor Strange', N'Película', N'Fantasía', 2016, N'Disney+', N'Visto', 3, N'Una producción de fantasía que combina un guion sólido con una dirección cuidada; Doctor Strange se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Captain America: Civil War', N'Película', N'Acción', 2016, N'Disney+', N'Visto', 4, N'Captain America: Civil War destaca dentro del género acción gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Deadpool', N'Película', N'Comedia', 2016, N'Disney+', N'Visto', 4, N'Una de las cintas de comedia más recomendadas del catálogo; Deadpool logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Wonder Woman', N'Película', N'Acción', 2017, N'HBO Max', N'Pendiente', 5, N'Wonder Woman es un referente del cine de acción, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Aquaman', N'Película', N'Acción', 2018, N'HBO Max', N'Pendiente', 5, N'Dentro del catálogo de acción, Aquaman sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Batman Begins', N'Película', N'Acción', 2005, N'HBO Max', N'Visto', 3, N'Una producción de acción que combina un guion sólido con una dirección cuidada; Batman Begins se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Mad Max: Fury Road', N'Película', N'Acción', 2015, N'HBO Max', N'Visto', 4, N'Mad Max: Fury Road destaca dentro del género acción gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'John Wick', N'Película', N'Acción', 2014, N'Amazon Prime Video', N'Visto', 4, N'Una de las cintas de acción más recomendadas del catálogo; John Wick logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Mission: Impossible - Fallout', N'Película', N'Acción', 2018, N'Paramount+', N'Visto', 5, N'Mission: Impossible - Fallout es un referente del cine de acción, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Fast & Furious 7', N'Película', N'Acción', 2015, N'Netflix', N'Visto', 5, N'Dentro del catálogo de acción, Fast & Furious 7 sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'The Hunger Games', N'Película', N'Aventura', 2012, N'Netflix', N'Visto', 3, N'Una producción de aventura que combina un guion sólido con una dirección cuidada; The Hunger Games se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Twilight', N'Película', N'Romance', 2008, N'Netflix', N'Visto', 4, N'Twilight destaca dentro del género romance gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'La La Land', N'Película', N'Musical', 2016, N'Netflix', N'Visto', 4, N'Una de las cintas de musical más recomendadas del catálogo; La La Land logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'A Star Is Born', N'Película', N'Musical', 2018, N'HBO Max', N'Pendiente', 5, N'A Star Is Born es un referente del cine de musical, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'The Greatest Showman', N'Película', N'Musical', 2017, N'Disney+', N'Pendiente', 5, N'Dentro del catálogo de musical, The Greatest Showman sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Bohemian Rhapsody', N'Película', N'Drama', 2018, N'HBO Max', N'Visto', 3, N'Una producción de drama que combina un guion sólido con una dirección cuidada; Bohemian Rhapsody se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Get Out', N'Película', N'Terror', 2017, N'Amazon Prime Video', N'Visto', 4, N'Get Out destaca dentro del género terror gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'It', N'Película', N'Terror', 2017, N'HBO Max', N'Visto', 4, N'Una de las cintas de terror más recomendadas del catálogo; It logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'A Quiet Place', N'Película', N'Terror', 2018, N'Paramount+', N'Visto', 5, N'A Quiet Place es un referente del cine de terror, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'The Conjuring', N'Película', N'Terror', 2013, N'HBO Max', N'Visto', 5, N'Dentro del catálogo de terror, The Conjuring sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Hereditary', N'Película', N'Terror', 2018, N'Netflix', N'Visto', 3, N'Una producción de terror que combina un guion sólido con una dirección cuidada; Hereditary se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Knives Out', N'Película', N'Misterio', 2019, N'Netflix', N'Visto', 4, N'Knives Out destaca dentro del género misterio gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Glass Onion', N'Película', N'Misterio', 2022, N'Netflix', N'Visto', 4, N'Una de las cintas de misterio más recomendadas del catálogo; Glass Onion logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Gone Girl', N'Película', N'Thriller', 2014, N'HBO Max', N'Pendiente', 5, N'Gone Girl es un referente del cine de thriller, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Shutter Island', N'Película', N'Thriller', 2010, N'Paramount+', N'Pendiente', 5, N'Dentro del catálogo de thriller, Shutter Island sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Se7en', N'Película', N'Thriller', 1995, N'Netflix', N'Visto', 3, N'Una producción de thriller que combina un guion sólido con una dirección cuidada; Se7en se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'The Social Network', N'Película', N'Drama', 2010, N'Netflix', N'Visto', 4, N'The Social Network destaca dentro del género drama gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'The Wolf of Wall Street', N'Película', N'Drama', 2013, N'Paramount+', N'Visto', 4, N'Una de las cintas de drama más recomendadas del catálogo; The Wolf of Wall Street logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Whiplash', N'Película', N'Drama', 2014, N'Amazon Prime Video', N'Visto', 5, N'Whiplash es un referente del cine de drama, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'La vita è bella', N'Película', N'Drama', 1997, N'Netflix', N'Visto', 5, N'Dentro del catálogo de drama, La vita è bella sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'El Laberinto del Fauno', N'Película', N'Fantasía', 2006, N'HBO Max', N'Visto', 3, N'Una producción de fantasía que combina un guion sólido con una dirección cuidada; El Laberinto del Fauno se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Roma', N'Película', N'Drama', 2018, N'Netflix', N'Visto', 4, N'Roma destaca dentro del género drama gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'The Irishman', N'Película', N'Crimen', 2019, N'Netflix', N'Visto', 4, N'Una de las cintas de crimen más recomendadas del catálogo; The Irishman logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Once Upon a Time in Hollywood', N'Película', N'Comedia', 2019, N'Netflix', N'Pendiente', 5, N'Once Upon a Time in Hollywood es un referente del cine de comedia, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'Django Unchained', N'Película', N'Western', 2012, N'Netflix', N'Pendiente', 5, N'Dentro del catálogo de western, Django Unchained sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Inglourious Basterds', N'Película', N'Guerra', 2009, N'Netflix', N'Visto', 3, N'Una producción de guerra que combina un guion sólido con una dirección cuidada; Inglourious Basterds se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Dunkirk', N'Película', N'Guerra', 2017, N'HBO Max', N'Visto', 4, N'Dunkirk destaca dentro del género guerra gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'1917', N'Película', N'Guerra', 2019, N'Amazon Prime Video', N'Visto', 4, N'Una de las cintas de guerra más recomendadas del catálogo; 1917 logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Saving Private Ryan', N'Película', N'Guerra', 1998, N'Paramount+', N'Visto', 5, N'Saving Private Ryan es un referente del cine de guerra, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'The Revenant', N'Película', N'Aventura', 2015, N'HBO Max', N'Visto', 5, N'Dentro del catálogo de aventura, The Revenant sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Everything Everywhere All at Once', N'Película', N'Ciencia ficción', 2022, N'Amazon Prime Video', N'Visto', 3, N'Una producción de ciencia ficción que combina un guion sólido con una dirección cuidada; Everything Everywhere All at Once se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Dune', N'Película', N'Ciencia ficción', 2021, N'HBO Max', N'Visto', 4, N'Dune destaca dentro del género ciencia ficción gracias a su ritmo envolvente y a interpretaciones que sostienen la historia de principio a fin.', NULL, NULL),
    (N'Dune: Part Two', N'Película', N'Ciencia ficción', 2024, N'HBO Max', N'Visto', 4, N'Una de las cintas de ciencia ficción más recomendadas del catálogo; Dune: Part Two logra equilibrar espectáculo visual y desarrollo de personajes.', NULL, NULL),
    (N'Blade Runner 2049', N'Película', N'Ciencia ficción', 2017, N'Netflix', N'Pendiente', 5, N'Blade Runner 2049 es un referente del cine de ciencia ficción, con una atmósfera que atrapa al espectador desde los primeros minutos.', NULL, NULL),
    (N'No Time to Die', N'Película', N'Acción', 2021, N'Amazon Prime Video', N'Pendiente', 5, N'Dentro del catálogo de acción, No Time to Die sobresale por su fotografía, su banda sonora y un cierre que deja huella.', NULL, NULL),
    (N'Wicked', N'Película', N'Musical', 2024, N'Amazon Prime Video', N'Visto', 3, N'Una producción de musical que combina un guion sólido con una dirección cuidada; Wicked se mantiene como una de las películas más comentadas por los suscriptores.', NULL, NULL),
    (N'Breaking Bad', N'Serie', N'Drama', 2008, N'Netflix', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, Breaking Bad es de las propuestas de drama más comentadas en redes y plataformas.', 5, 62),
    (N'Stranger Things', N'Serie', N'Ciencia ficción', 2016, N'Netflix', N'Visto', 5, N'Stranger Things combina tramas de ciencia ficción con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 5, 42),
    (N'The Mandalorian', N'Serie', N'Ciencia ficción', 2019, N'Disney+', N'Visto', 3, N'Una de las series de ciencia ficción con mayor maratón de reproducciones; The Mandalorian engancha desde el primer episodio.', 3, 24),
    (N'Game of Thrones', N'Serie', N'Fantasía', 2011, N'HBO Max', N'Visto', 4, N'Game of Thrones renovó el interés por el género fantasía gracias a su narrativa serializada y a finales de temporada muy comentados.', 8, 73),
    (N'The Last of Us', N'Serie', N'Drama', 2023, N'HBO Max', N'Pendiente', 4, N'The Last of Us se consolidó como una de las series de drama más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 2, 16),
    (N'House of the Dragon', N'Serie', N'Fantasía', 2022, N'HBO Max', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, House of the Dragon es de las propuestas de fantasía más comentadas en redes y plataformas.', 2, 18),
    (N'The Witcher', N'Serie', N'Fantasía', 2019, N'Netflix', N'Visto', 5, N'The Witcher combina tramas de fantasía con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 4, 32),
    (N'La Casa de Papel', N'Serie', N'Crimen', 2017, N'Netflix', N'Visto', 3, N'Una de las series de crimen con mayor maratón de reproducciones; La Casa de Papel engancha desde el primer episodio.', 5, 41),
    (N'Squid Game', N'Serie', N'Thriller', 2021, N'Netflix', N'Visto', 4, N'Squid Game renovó el interés por el género thriller gracias a su narrativa serializada y a finales de temporada muy comentados.', 3, 23),
    (N'Wednesday', N'Serie', N'Comedia', 2022, N'Netflix', N'Visto', 4, N'Wednesday se consolidó como una de las series de comedia más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 2, 16),
    (N'Dark', N'Serie', N'Ciencia ficción', 2017, N'Netflix', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, Dark es de las propuestas de ciencia ficción más comentadas en redes y plataformas.', 3, 26),
    (N'Narcos', N'Serie', N'Crimen', 2015, N'Netflix', N'Visto', 5, N'Narcos combina tramas de crimen con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 3, 30),
    (N'Ozark', N'Serie', N'Crimen', 2017, N'Netflix', N'Visto', 3, N'Una de las series de crimen con mayor maratón de reproducciones; Ozark engancha desde el primer episodio.', 4, 44),
    (N'The Crown', N'Serie', N'Drama', 2016, N'Netflix', N'Visto', 4, N'The Crown renovó el interés por el género drama gracias a su narrativa serializada y a finales de temporada muy comentados.', 6, 60),
    (N'Bridgerton', N'Serie', N'Romance', 2020, N'Netflix', N'Pendiente', 4, N'Bridgerton se consolidó como una de las series de romance más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 3, 24),
    (N'Emily in Paris', N'Serie', N'Comedia', 2020, N'Netflix', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, Emily in Paris es de las propuestas de comedia más comentadas en redes y plataformas.', 4, 40),
    (N'You', N'Serie', N'Thriller', 2018, N'Netflix', N'Visto', 5, N'You conbina tramas de thriller con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 5, 50),
    (N'The Umbrella Academy', N'Serie', N'Ciencia ficción', 2019, N'Netflix', N'Visto', 3, N'Una de las series de ciencia ficción con mayor maratón de reproducciones; The Umbrella Academy engancha desde el primer episodio.', 4, 40),
    (N'Black Mirror', N'Serie', N'Ciencia ficción', 2011, N'Netflix', N'Visto', 4, N'Black Mirror renovó el interés por el género ciencia ficción gracias a su narrativa serializada y a finales de temporada muy comentados.', 7, 33),
    (N'Peaky Blinders', N'Serie', N'Drama', 2013, N'Netflix', N'Visto', 4, N'Peaky Blinders se consolidó como una de las series de drama más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 6, 36),
    (N'The Walking Dead', N'Serie', N'Terror', 2010, N'Amazon Prime Video', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, The Walking Dead es de las propuestas de terror más comentadas en redes y plataformas.', 11, 177),
    (N'Better Call Saul', N'Serie', N'Drama', 2015, N'Netflix', N'Visto', 5, N'Better Call Saul combina tramas de drama con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 6, 63),
    (N'Friends', N'Serie', N'Comedia', 1994, N'HBO Max', N'Visto', 3, N'Una de las series de comedia con mayor maratón de reproducciones; Friends engancha desde el primer episodio.', 10, 236),
    (N'The Office', N'Serie', N'Comedia', 2005, N'Amazon Prime Video', N'Visto', 4, N'The Office renovó el interés por el género comedia gracias a su narrativa serializada y a finales de temporada muy comentados.', 9, 201),
    (N'Suits', N'Serie', N'Drama', 2011, N'Netflix', N'Pendiente', 4, N'Suits se consolidó como una de las series de drama más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 9, 134),
    (N'How I Met Your Mother', N'Serie', N'Comedia', 2005, N'Disney+', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, How I Met Your Mother es de las propuestas de comedia más comentadas en redes y plataformas.', 9, 208),
    (N'Grey''s Anatomy', N'Serie', N'Drama', 2005, N'Disney+', N'Visto', 5, N'Grey''s Anatomy combina tramas de drama con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 20, 431),
    (N'The Big Bang Theory', N'Serie', N'Comedia', 2007, N'HBO Max', N'Visto', 3, N'Una de las series de comedia con mayor maratón de reproducciones; The Big Bang Theory engancha desde el primer episodio.', 12, 279),
    (N'Modern Family', N'Serie', N'Comedia', 2009, N'Disney+', N'Visto', 4, N'Modern Family renovó el interés por el género comedia gracias a su narrativa serializada y a finales de temporada muy comentados.', 11, 250),
    (N'Brooklyn Nine-Nine', N'Serie', N'Comedia', 2013, N'Netflix', N'Visto', 4, N'Brooklyn Nine-Nine se consolidó como una de las series de comedia más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 8, 153),
    (N'Rick and Morty', N'Serie', N'Animación', 2013, N'HBO Max', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, Rick and Morty es de las propuestas de animación más comentadas en redes y plataformas.', 7, 71),
    (N'The Simpsons', N'Serie', N'Animación', 1989, N'Disney+', N'Visto', 5, N'The Simpsons combina tramas de animación con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 35, 770),
    (N'South Park', N'Serie', N'Animación', 1997, N'HBO Max', N'Visto', 3, N'Una de las series de animación con mayor maratón de reproducciones; South Park engancha desde el primer episodio.', 27, 327),
    (N'Arcane', N'Serie', N'Animación', 2021, N'Netflix', N'Visto', 4, N'Arcane renovó el interés por el género animación gracias a su narrativa serializada y a finales de temporada muy comentados.', 2, 18),
    (N'Avatar: The Last Airbender', N'Serie', N'Animación', 2005, N'Netflix', N'Pendiente', 4, N'Avatar: The Last Airbender se consolidó como una de las series de animación más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 3, 61),
    (N'Invincible', N'Serie', N'Animación', 2021, N'Amazon Prime Video', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, Invincible es de las propuestas de animación más comentadas en redes y plataformas.', 3, 24),
    (N'The Boys', N'Serie', N'Acción', 2019, N'Amazon Prime Video', N'Visto', 5, N'The Boys combina tramas de acción con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 4, 32),
    (N'Reacher', N'Serie', N'Acción', 2022, N'Amazon Prime Video', N'Visto', 3, N'Una de las series de acción con mayor maratón de reproducciones; Reacher engancha desde el primer episodio.', 3, 24),
    (N'The Marvelous Mrs. Maisel', N'Serie', N'Comedia', 2017, N'Amazon Prime Video', N'Visto', 4, N'The Marvelous Mrs. Maisel renovó el interés por el género comedia gracias a su narrativa serializada y a finales de temporada muy comentados.', 5, 43),
    (N'Fleabag', N'Serie', N'Comedia', 2016, N'Amazon Prime Video', N'Visto', 4, N'Fleabag se consolidó como una de las series de comedia más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 2, 12),
    (N'The Wheel of Time', N'Serie', N'Fantasía', 2021, N'Amazon Prime Video', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, The Wheel of Time es de las propuestas de fantasía más comentadas en redes y plataformas.', 3, 24),
    (N'The Rings of Power', N'Serie', N'Fantasía', 2022, N'Amazon Prime Video', N'Visto', 5, N'The Rings of Power combina tramas de fantasía con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 2, 16),
    (N'Fallout', N'Serie', N'Ciencia ficción', 2024, N'Amazon Prime Video', N'Visto', 3, N'Una de las series de ciencia ficción con mayor maratón de reproducciones; Fallout engancha desde el primer episodio.', 1, 8),
    (N'Ted Lasso', N'Serie', N'Comedia', 2020, N'Apple TV+', N'Visto', 4, N'Ted Lasso renovó el interés por el género comedia gracias a su narrativa serializada y a finales de temporada muy comentados.', 3, 34),
    (N'Severance', N'Serie', N'Ciencia ficción', 2022, N'Apple TV+', N'Pendiente', 4, N'Severance se consolidó como una de las series de ciencia ficción más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 2, 19),
    (N'The Morning Show', N'Serie', N'Drama', 2019, N'Apple TV+', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, The Morning Show es de las propuestas de drama más comentadas en redes y plataformas.', 3, 30),
    (N'Slow Horses', N'Serie', N'Thriller', 2022, N'Apple TV+', N'Visto', 5, N'Slow Horses combina tramas de thriller con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 4, 24),
    (N'For All Mankind', N'Serie', N'Ciencia ficción', 2019, N'Apple TV+', N'Visto', 3, N'Una de las series de ciencia ficción con mayor maratón de reproducciones; For All Mankind engancha desde el primer episodio.', 4, 40),
    (N'Loki', N'Serie', N'Ciencia ficción', 2021, N'Disney+', N'Visto', 4, N'Loki renovó el interés por el género ciencia ficción gracias a su narrativa serializada y a finales de temporada muy comentados.', 2, 12),
    (N'WandaVision', N'Serie', N'Ciencia ficción', 2021, N'Disney+', N'Visto', 4, N'WandaVision se consolidó como una de las series de ciencia ficción más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 1, 9),
    (N'Daredevil: Born Again', N'Serie', N'Acción', 2025, N'Disney+', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, Daredevil: Born Again es de las propuestas de acción más comentadas en redes y plataformas.', 1, 9),
    (N'Andor', N'Serie', N'Ciencia ficción', 2022, N'Disney+', N'Visto', 5, N'Andor combina tramas de ciencia ficción con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 2, 24),
    (N'Ahsoka', N'Serie', N'Ciencia ficción', 2023, N'Disney+', N'Visto', 3, N'Una de las series de ciencia ficción con mayor maratón de reproducciones; Ahsoka engancha desde el primer episodio.', 1, 8),
    (N'What We Do in the Shadows', N'Serie', N'Comedia', 2019, N'Hulu', N'Visto', 4, N'What We Do in the Shadows renovó el interés por el género comedia gracias a su narrativa serializada y a finales de temporada muy comentados.', 6, 70),
    (N'Only Murders in the Building', N'Serie', N'Comedia', 2021, N'Hulu', N'Pendiente', 4, N'Only Murders in the Building se consolidó como una de las series de comedia más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 4, 40),
    (N'American Horror Story', N'Serie', N'Terror', 2011, N'Hulu', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, American Horror Story es de las propuestas de terror más comentadas en redes y plataformas.', 12, 130),
    (N'Euphoria', N'Serie', N'Drama', 2019, N'HBO Max', N'Visto', 5, N'Euphoria combina tramas de drama con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 2, 18),
    (N'Succession', N'Serie', N'Drama', 2018, N'HBO Max', N'Visto', 3, N'Una de las series de drama con mayor maratón de reproducciones; Succession engancha desde el primer episodio.', 4, 39),
    (N'The White Lotus', N'Serie', N'Drama', 2021, N'HBO Max', N'Visto', 4, N'The White Lotus renovó el interés por el género drama gracias a su narrativa serializada y a finales de temporada muy comentados.', 3, 21),
    (N'Barry', N'Serie', N'Comedia', 2018, N'HBO Max', N'Visto', 4, N'Barry se consolidó como una de las series de comedia más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 4, 32),
    (N'True Detective', N'Serie', N'Crimen', 2014, N'HBO Max', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, True Detective es de las propuestas de crimen más comentadas en redes y plataformas.', 4, 33),
    (N'Chernobyl', N'Serie', N'Drama', 2019, N'HBO Max', N'Visto', 5, N'Chernobyl combina tramas de drama con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 1, 5),
    (N'Band of Brothers', N'Serie', N'Guerra', 2001, N'HBO Max', N'Visto', 3, N'Una de las series de guerra con mayor maratón de reproducciones; Band of Brothers engancha desde el primer episodio.', 1, 10),
    (N'Westworld', N'Serie', N'Ciencia ficción', 2016, N'HBO Max', N'Visto', 4, N'Westworld renovó el interés por el género ciencia ficción gracias a su narrativa serializada y a finales de temporada muy comentados.', 4, 36),
    (N'Sherlock', N'Serie', N'Misterio', 2010, N'Netflix', N'Pendiente', 4, N'Sherlock se consolidó como una de las series de misterio más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 4, 13),
    (N'Vikings', N'Serie', N'Drama', 2013, N'Amazon Prime Video', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, Vikings es de las propuestas de drama más comentadas en redes y plataformas.', 6, 89),
    (N'Outer Banks', N'Serie', N'Aventura', 2020, N'Netflix', N'Visto', 5, N'Outer Banks combina tramas de aventura con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 4, 40),
    (N'13 Reasons Why', N'Serie', N'Drama', 2017, N'Netflix', N'Visto', 3, N'Una de las series de drama con mayor maratón de reproducciones; 13 Reasons Why engancha desde el primer episodio.', 4, 49),
    (N'Cobra Kai', N'Serie', N'Acción', 2018, N'Netflix', N'Visto', 4, N'Cobra Kai renovó el interés por el género acción gracias a su narrativa serializada y a finales de temporada muy comentados.', 6, 65),
    (N'Lucifer', N'Serie', N'Fantasía', 2016, N'Netflix', N'Visto', 4, N'Lucifer se consolidó como una de las series de fantasía más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 6, 93),
    (N'Élite', N'Serie', N'Drama', 2018, N'Netflix', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, Élite es de las propuestas de drama más comentadas en redes y plataformas.', 8, 64),
    (N'La Casa de las Flores', N'Serie', N'Comedia', 2018, N'Netflix', N'Visto', 5, N'La Casa de las Flores combina tramas de comedia con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 3, 33),
    (N'Sex Education', N'Serie', N'Comedia', 2019, N'Netflix', N'Visto', 3, N'Una de las series de comedia con mayor maratón de reproducciones; Sex Education engancha desde el primer episodio.', 4, 33),
    (N'Manifest', N'Serie', N'Drama', 2018, N'Netflix', N'Visto', 4, N'Manifest renovó el interés por el género drama gracias a su narrativa serializada y a finales de temporada muy comentados.', 4, 66),
    (N'Lupin', N'Serie', N'Crimen', 2021, N'Netflix', N'Pendiente', 4, N'Lupin se consolidó como una de las series de crimen más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 3, 15),
    (N'The Sandman', N'Serie', N'Fantasía', 2022, N'Netflix', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, The Sandman es de las propuestas de fantasía más comentadas en redes y plataformas.', 2, 21),
    (N'Maid', N'Serie', N'Drama', 2021, N'Netflix', N'Visto', 5, N'Maid conbina tramas de drama con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 1, 10),
    (N'Outlander', N'Serie', N'Romance', 2014, N'Netflix', N'Visto', 3, N'Una de las series de romance con mayor maratón de reproducciones; Outlander engancha desde el primer episodio.', 7, 95),
    (N'Riverdale', N'Serie', N'Drama', 2017, N'Netflix', N'Visto', 4, N'Riverdale renovó el interés por el género drama gracias a su narrativa serializada y a finales de temporada muy comentados.', 7, 137),
    (N'Daredevil', N'Serie', N'Acción', 2015, N'Netflix', N'Visto', 4, N'Daredevil se consolidó como una de las series de acción más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 3, 39),
    (N'Jessica Jones', N'Serie', N'Acción', 2015, N'Netflix', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, Jessica Jones es de las propuestas de acción más comentadas en redes y plataformas.', 3, 39),
    (N'Mindhunter', N'Serie', N'Crimen', 2017, N'Netflix', N'Visto', 5, N'Mindhunter conbina tramas de crimen con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 2, 19),
    (N'House of Cards', N'Serie', N'Drama', 2013, N'Netflix', N'Visto', 3, N'Una de las series de drama con mayor maratón de reproducciones; House of Cards engancha desde el primer episodio.', 6, 73),
    (N'Orange Is the New Black', N'Serie', N'Drama', 2013, N'Netflix', N'Visto', 4, N'Orange Is the New Black renovó el interés por el género drama gracias a su narrativa serializada y a finales de temporada muy comentados.', 7, 91),
    (N'The Haunting of Hill House', N'Serie', N'Terror', 2018, N'Netflix', N'Pendiente', 4, N'The Haunting of Hill House se consolidó como una de las series de terror más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 1, 10),
    (N'Midnight Mass', N'Serie', N'Terror', 2021, N'Netflix', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, Midnight Mass es de las propuestas de terror más comentadas en redes y plataformas.', 1, 7),
    (N'Dahmer - Monster', N'Serie', N'Crimen', 2022, N'Netflix', N'Visto', 5, N'Dahmer - Monster conbina tramas de crimen con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 1, 10),
    (N'Baby Reindeer', N'Serie', N'Drama', 2024, N'Netflix', N'Visto', 3, N'Una de las series de drama con mayor maratón de reproducciones; Baby Reindeer engancha desde el primer episodio.', 1, 7),
    (N'Adolescence', N'Serie', N'Drama', 2025, N'Netflix', N'Visto', 4, N'Adolescence renovó el interés por el género drama gracias a su narrativa serializada y a finales de temporada muy comentados.', 1, 4),
    (N'The Bear', N'Serie', N'Comedia', 2022, N'Hulu', N'Visto', 4, N'The Bear se consolidó como una de las series de comedia más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 3, 28),
    (N'Yellowstone', N'Serie', N'Drama', 2018, N'Paramount+', N'Visto', 5, N'Con un elenco sólido y giros bien construidos, Yellowstone es de las propuestas de drama más comentadas en redes y plataformas.', 5, 53),
    (N'1923', N'Serie', N'Drama', 2022, N'Paramount+', N'Visto', 5, N'1923 conbina tramas de drama con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 2, 16),
    (N'SEAL Team', N'Serie', N'Acción', 2017, N'Paramount+', N'Visto', 3, N'Una de las series de acción con mayor maratón de reproducciones; SEAL Team engancha desde el primer episodio.', 7, 138),
    (N'Star Trek: Discovery', N'Serie', N'Ciencia ficción', 2017, N'Paramount+', N'Visto', 4, N'Star Trek: Discovery renovó el interés por el género ciencia ficción gracias a su narrativa serializada y a finales de temporada muy comentados.', 5, 65),
    (N'The Walking Dead: Daryl Dixon', N'Serie', N'Terror', 2023, N'Amazon Prime Video', N'Pendiente', 4, N'The Walking Dead: Daryl Dixon se consolidó como una de las series de terror más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 2, 12),
    (N'Fear the Walking Dead', N'Serie', N'Terror', 2015, N'Amazon Prime Video', N'Pendiente', 5, N'Con un elenco sólido y giros bien construidos, Fear the Walking Dead es de las propuestas de terror más comentadas en redes y plataformas.', 8, 84),
    (N'The Penguin', N'Serie', N'Crimen', 2024, N'HBO Max', N'Visto', 5, N'The Penguin conbina tramas de crimen con personajes memorables, lo que explica su permanencia en los listados de tendencia.', 1, 8),
    (N'True Blood', N'Serie', N'Fantasía', 2008, N'HBO Max', N'Visto', 3, N'Una de las series de fantasía con mayor maratón de reproducciones; True Blood engancha desde el primer episodio.', 7, 80),
    (N'Big Little Lies', N'Serie', N'Drama', 2017, N'HBO Max', N'Visto', 4, N'Big Little Lies renovó el interés por el género drama gracias a su narrativa serializada y a finales de temporada muy comentados.', 2, 14),
    (N'Peacemaker', N'Serie', N'Acción', 2022, N'HBO Max', N'Visto', 4, N'Peacemaker se consolidó como una de las series de acción más vistas, con temporadas que mantienen el interés capítulo a capítulo.', 1, 8);
GO


SELECT Tipo, COUNT(*) AS Total FROM dbo.Contenidos GROUP BY Tipo;
SELECT TOP 5 * FROM dbo.Contenidos ORDER BY Id;
GO
USE CatalogoWebDB;
GO

UPDATE Contenidos
SET Estado = N'Pendiente';
GO
USE CatalogoWebDB;
GO

IF COL_LENGTH('dbo.Contenidos', 'EsAgregadoPorUsuario') IS NULL
BEGIN
    ALTER TABLE dbo.Contenidos
    ADD EsAgregadoPorUsuario BIT NOT NULL DEFAULT 0;
END
GO
USE CatalogoWebDB;
GO

SELECT TOP 10 Id, Titulo, Tipo, EsAgregadoPorUsuario
FROM Contenidos;
GO