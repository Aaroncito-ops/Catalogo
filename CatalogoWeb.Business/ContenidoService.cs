using CatalogoWeb.Data;
using CatalogoWeb.Entities;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CatalogoWeb.Business
{
    public class ContenidoService
    {
        private readonly ContenidoRepository repository;

        public ContenidoService(ContenidoRepository repository)
        {
            this.repository = repository;
        }

        public List<Contenido> ListarTodo()
        {
            return repository.ObtenerTodos();
        }

        public Contenido? ObtenerPorId(int id)
        {
            return repository.ObtenerPorId(id);
        }

        public void Guardar(Contenido contenido)
        {
            
            if (string.IsNullOrWhiteSpace(contenido.Titulo))
                throw new Exception("El título no puede estar vacío");

            
            if (contenido.Tipo != "Serie" && contenido.Tipo != "Película")
                throw new Exception("El tipo solo puede ser Serie o Película");

            
            if (contenido.Anio_estreno > DateTime.Now.Year)
                throw new Exception("El año no puede ser mayor al actual");

            
            if (contenido.Calificacion < 1 || contenido.Calificacion > 5)
                throw new Exception("La calificación debe estar entre 1 y 5");

            
            var lista = repository.ObtenerTodos();

            bool duplicado = lista.Any(x =>
                x.Titulo.ToLower() == contenido.Titulo.ToLower()
                && x.Id != contenido.Id);

            if (duplicado)
                throw new Exception("No se puede registrar contenido duplicado");

           
            if (contenido.Id == 0)
            {
                repository.Agregar(contenido);
            }
            else
            {
                var existente = repository.ObtenerPorId(contenido.Id);

                if (existente == null)
                    throw new Exception("No se puede editar un registro inexistente");

                repository.Actualizar(contenido);
            }
        }

        public void Eliminar(int id)
        {
            var contenido = repository.ObtenerPorId(id);

            if (contenido == null)
                throw new Exception("No se puede eliminar un registro inexistente");

            repository.Eliminar(id);
        }
    }
}