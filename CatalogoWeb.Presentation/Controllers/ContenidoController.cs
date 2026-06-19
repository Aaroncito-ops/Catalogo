using CatalogoWeb.Business;
using CatalogoWeb.Entities;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace CatalogoWeb.Presentation.Controllers
{
    public class ContenidoController : Controller
    {
        private readonly ContenidoService _service;

        public ContenidoController(ContenidoService service)
        {
            _service = service;
        }

        public IActionResult Index(string buscar, string tipo, string genero, string plataforma)
        {
            var lista = _service.ListarTodo();

            if (!string.IsNullOrWhiteSpace(buscar))
                lista = lista.Where(x => x.Titulo.Contains(buscar, StringComparison.OrdinalIgnoreCase)).ToList();

            if (!string.IsNullOrWhiteSpace(tipo))
                lista = lista.Where(x => x.Tipo == tipo).ToList();

            if (!string.IsNullOrWhiteSpace(genero))
                lista = lista.Where(x => x.Genero.Contains(genero, StringComparison.OrdinalIgnoreCase)).ToList();

            if (!string.IsNullOrWhiteSpace(plataforma))
                lista = lista.Where(x => x.Plataforma.Contains(plataforma, StringComparison.OrdinalIgnoreCase)).ToList();

            ViewBag.Buscar = buscar;
            ViewBag.Tipo = tipo;
            ViewBag.Genero = genero;
            ViewBag.Plataforma = plataforma;

            ViewBag.Top5 = _service.ListarTodo()
                .OrderByDescending(x => x.Calificacion)
                .Take(5)
                .ToList();

            ViewBag.Peliculas = lista.Where(x => x.Tipo == "Película").ToList();
            ViewBag.Series = lista.Where(x => x.Tipo == "Serie").ToList();

            return View(lista);
        }

        public IActionResult Registros()
        {
            var registros = _service.ListarTodo()
                .Where(c => c.EsAgregadoPorUsuario)
                .OrderByDescending(c => c.Id)
                .ToList();

            return View(registros);
        }

        public IActionResult AgregarRegistro(int id)
        {
            var contenido = _service.ObtenerPorId(id);

            if (contenido != null)
            {
                contenido.EsAgregadoPorUsuario = true;
                _service.Guardar(contenido);
            }

            return RedirectToAction("Details", new { id = id });
        }

        public IActionResult Details(int id)
        {
            var contenido = _service.ObtenerPorId(id);

            if (contenido == null)
                return RedirectToAction("Index");

            return View(contenido);
        }

        public IActionResult Create()
        {
            return View(new Pelicula());
        }

        [HttpPost]
        public IActionResult Create(string Titulo, string Tipo, string Genero, int Anio_estreno, string Plataforma, string Estado, int Calificacion, string Resenia, int? Temporadas, int? Episodios)
        {
            Contenido contenido;

            if (Tipo == "Serie")
            {
                contenido = new Serie
                {
                    Temporadas = Temporadas ?? 0,
                    Episodios = Episodios ?? 0
                };
            }
            else
            {
                contenido = new Pelicula();
            }

            contenido.Titulo = Titulo;
            contenido.Tipo = Tipo;
            contenido.Genero = Genero;
            contenido.Anio_estreno = Anio_estreno;
            contenido.Plataforma = Plataforma;
            contenido.Estado = Estado;
            contenido.Calificacion = Calificacion;
            contenido.Resenia = Resenia;
            contenido.EsAgregadoPorUsuario = true;

            try
            {
                _service.Guardar(contenido);
                return RedirectToAction("Registros");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View(contenido);
            }
        }

        public IActionResult Edit(int id)
        {
            var contenido = _service.ObtenerPorId(id);

            if (contenido == null)
                return RedirectToAction("Index");

            if (!contenido.EsAgregadoPorUsuario)
                return RedirectToAction("Details", new { id = id });

            return View(contenido);
        }

        [HttpPost]
        public IActionResult Edit(int Id, string Titulo, string Tipo, string Genero, int Anio_estreno, string Plataforma, string Estado, int Calificacion, string Resenia, int? Temporadas, int? Episodios)
        {
            var contenidoOriginal = _service.ObtenerPorId(Id);

            if (contenidoOriginal == null)
                return RedirectToAction("Index");

            if (!contenidoOriginal.EsAgregadoPorUsuario)
                return RedirectToAction("Details", new { id = Id });

            Contenido contenido;

            if (Tipo == "Serie")
            {
                contenido = new Serie
                {
                    Id = Id,
                    Temporadas = Temporadas ?? 0,
                    Episodios = Episodios ?? 0
                };
            }
            else
            {
                contenido = new Pelicula
                {
                    Id = Id
                };
            }

            contenido.Titulo = Titulo;
            contenido.Tipo = Tipo;
            contenido.Genero = Genero;
            contenido.Anio_estreno = Anio_estreno;
            contenido.Plataforma = Plataforma;
            contenido.Estado = Estado;
            contenido.Calificacion = Calificacion;
            contenido.Resenia = Resenia;
            contenido.EsAgregadoPorUsuario = true;

            try
            {
                _service.Guardar(contenido);
                return RedirectToAction("Registros");
            }
            catch (Exception ex)
            {
                ViewBag.Error = ex.Message;
                return View(contenido);
            }
        }

        public IActionResult Delete(int id)
        {
            try
            {
                var contenido = _service.ObtenerPorId(id);

                if (contenido != null)
                {
                    contenido.EsAgregadoPorUsuario = false;
                    _service.Guardar(contenido);
                }
            }
            catch
            {
            }

            return RedirectToAction("Registros");
        }

        public IActionResult MarcarVisto(int id)
        {
            var contenido = _service.ObtenerPorId(id);

            if (contenido != null)
            {
                contenido.Estado = "Vista";
                _service.Guardar(contenido);
            }

            return RedirectToAction("Details", new { id = id });
        }

        public IActionResult MarcarPendiente(int id)
        {
            var contenido = _service.ObtenerPorId(id);

            if (contenido != null)
            {
                contenido.Estado = "Pendiente";
                _service.Guardar(contenido);
            }

            return RedirectToAction("Details", new { id = id });
        }

        public IActionResult Estadisticas()
        {
            var lista = _service.ListarTodo();

            ViewBag.Total = lista.Count;
            ViewBag.Series = lista.Count(x => x.Tipo == "Serie");
            ViewBag.Peliculas = lista.Count(x => x.Tipo == "Película");
            ViewBag.Vistas = lista.Count(x => x.Estado == "Vista");
            ViewBag.Pendientes = lista.Count(x => x.Estado == "Pendiente");
            ViewBag.Promedio = lista.Count > 0 ? lista.Average(x => x.Calificacion) : 0;
            ViewBag.Top5 = lista.OrderByDescending(x => x.Calificacion).Take(5).ToList();

            return View();
        }
    }
}