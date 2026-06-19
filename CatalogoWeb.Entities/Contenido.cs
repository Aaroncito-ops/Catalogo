    namespace CatalogoWeb.Entities
    {
        public class Contenido
        {
            public int Id { get; set; }
            public string Titulo { get; set; } = string.Empty;
            public string Tipo { get; set; } = string.Empty;
            public string Genero { get; set; } = string.Empty;
            public int Anio_estreno { get; set; }
            public string Plataforma { get; set;} = string.Empty;
            public string Estado { get; set;} = string.Empty; 
            public int Calificacion { get; set; }
            public string Resenia { get; set; } = string.Empty;
            public bool EsAgregadoPorUsuario { get; set; }

            public Contenido() { }
            public Contenido(int id, string titulo, string tipo, string genero, int anio_estreno, string plataforma, string estado, int calificacion, string resenia)
            {
                Id = id;
                Titulo = titulo;
                Tipo = tipo;
                Genero = genero;
                Anio_estreno = anio_estreno;
                Plataforma = plataforma;
                Estado = estado;
                Calificacion = calificacion;
                Resenia = resenia;
            }
        }

        public class Pelicula : Contenido
        {
            public Pelicula() { }
            public Pelicula(int id, string titulo, string tipo, string genero, int anio_estreno, string plataforma, string estado, int calificacion, string resenia)
                : base(id, titulo, tipo, genero, anio_estreno, plataforma, estado, calificacion, resenia) { }
        }

        public class Serie : Contenido
        {
            public int Temporadas { get; set; }
            public int Episodios { get; set; }

            public Serie() { }
            public Serie(int id, string titulo, string tipo, string genero, int anio_estreno, string plataforma, string estado, int calificacion, string resenia, int temporadas, int episodios)
                : base(id, titulo, tipo, genero, anio_estreno, plataforma, estado, calificacion, resenia)
            {
                Temporadas = temporadas;
                Episodios = episodios;
            }
        }
    }
