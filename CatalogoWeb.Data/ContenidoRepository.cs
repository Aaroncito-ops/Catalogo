using CatalogoWeb.Entities;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;

namespace CatalogoWeb.Data
{
    public class ContenidoRepository
    {
        private readonly string _connectionString;

        public ContenidoRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")
                ?? "Server=(localdb)\\mssqllocaldb;Database=CatalogoWebDB;Trusted_Connection=True;TrustServerCertificate=True";
        }

        public List<Contenido> ObtenerTodos()
        {
            var contenidos = new List<Contenido>();

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "SELECT Id, Titulo, Tipo, Genero, Anio_estreno, Plataforma, Estado, Calificacion, Resenia, Temporadas, Episodios, EsAgregadoPorUsuario FROM dbo.Contenidos";
                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        contenidos.Add(MapReaderToContenido(reader));
                    }
                }
            }

            return contenidos;
        }

        public Contenido? ObtenerPorId(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "SELECT Id, Titulo, Tipo, Genero, Anio_estreno, Plataforma, Estado, Calificacion, Resenia, Temporadas, Episodios, EsAgregadoPorUsuario FROM dbo.Contenidos WHERE Id = @Id";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", id);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        return MapReaderToContenido(reader);
                    }
                }
            }

            return null;
        }

        public void Agregar(Contenido contenido)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = @"INSERT INTO dbo.Contenidos 
                                (Titulo, Tipo, Genero, Anio_estreno, Plataforma, Estado, Calificacion, Resenia, Temporadas, Episodios, EsAgregadoPorUsuario) 
                                VALUES 
                                (@Titulo, @Tipo, @Genero, @Anio_estreno, @Plataforma, @Estado, @Calificacion, @Resenia, @Temporadas, @Episodios, @EsAgregadoPorUsuario)";

                SqlCommand command = new SqlCommand(query, connection);
                AddParameters(command, contenido);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public void Actualizar(Contenido contenido)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = @"UPDATE dbo.Contenidos 
                                SET Titulo = @Titulo,
                                    Tipo = @Tipo,
                                    Genero = @Genero,
                                    Anio_estreno = @Anio_estreno,
                                    Plataforma = @Plataforma,
                                    Estado = @Estado,
                                    Calificacion = @Calificacion,
                                    Resenia = @Resenia,
                                    Temporadas = @Temporadas,
                                    Episodios = @Episodios,
                                    EsAgregadoPorUsuario = @EsAgregadoPorUsuario
                                WHERE Id = @Id";

                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", contenido.Id);
                AddParameters(command, contenido);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public void Eliminar(int id)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                string query = "DELETE FROM dbo.Contenidos WHERE Id = @Id";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Id", id);

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private Contenido MapReaderToContenido(SqlDataReader reader)
        {
            string tipo = reader["Tipo"].ToString() ?? string.Empty;
            Contenido contenido;

            if (tipo == "Serie")
            {
                contenido = new Serie
                {
                    Temporadas = reader["Temporadas"] != DBNull.Value ? Convert.ToInt32(reader["Temporadas"]) : 0,
                    Episodios = reader["Episodios"] != DBNull.Value ? Convert.ToInt32(reader["Episodios"]) : 0
                };
            }
            else
            {
                contenido = new Pelicula();
            }

            contenido.Id = Convert.ToInt32(reader["Id"]);
            contenido.Titulo = reader["Titulo"].ToString() ?? string.Empty;
            contenido.Tipo = tipo;
            contenido.Genero = reader["Genero"].ToString() ?? string.Empty;
            contenido.Anio_estreno = Convert.ToInt32(reader["Anio_estreno"]);
            contenido.Plataforma = reader["Plataforma"].ToString() ?? string.Empty;
            contenido.Estado = reader["Estado"].ToString() ?? string.Empty;
            contenido.Calificacion = Convert.ToInt32(reader["Calificacion"]);
            contenido.Resenia = reader["Resenia"].ToString() ?? string.Empty;
            contenido.EsAgregadoPorUsuario = reader["EsAgregadoPorUsuario"] != DBNull.Value && Convert.ToBoolean(reader["EsAgregadoPorUsuario"]);

            return contenido;
        }

        private void AddParameters(SqlCommand command, Contenido contenido)
        {
            command.Parameters.AddWithValue("@Titulo", contenido.Titulo);
            command.Parameters.AddWithValue("@Tipo", contenido.Tipo);
            command.Parameters.AddWithValue("@Genero", contenido.Genero);
            command.Parameters.AddWithValue("@Anio_estreno", contenido.Anio_estreno);
            command.Parameters.AddWithValue("@Plataforma", contenido.Plataforma);
            command.Parameters.AddWithValue("@Estado", contenido.Estado);
            command.Parameters.AddWithValue("@Calificacion", contenido.Calificacion);
            command.Parameters.AddWithValue("@Resenia", (object)contenido.Resenia ?? DBNull.Value);
            command.Parameters.AddWithValue("@EsAgregadoPorUsuario", contenido.EsAgregadoPorUsuario);

            if (contenido is Serie serie)
            {
                command.Parameters.AddWithValue("@Temporadas", serie.Temporadas);
                command.Parameters.AddWithValue("@Episodios", serie.Episodios);
            }
            else
            {
                command.Parameters.AddWithValue("@Temporadas", DBNull.Value);
                command.Parameters.AddWithValue("@Episodios", DBNull.Value);
            }
        }
    }
}