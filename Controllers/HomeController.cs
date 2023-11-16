using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using NovaCorp.Models;


namespace NovaCorp.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    public HomeController(ApplicationDbContext context)
    {
        
        _context = context;
    }

        public IActionResult Detalles(int id_objeto)
    {
        Objeto Objeto = _context.Objeto.Find(id_objeto);     

        if (Objeto == null)
        {
            return View("objetoNoEncontrado");
        }
        else
        {
            return View("DetalleObjeto");

        }

        return View(Objeto);
    } 
      public IActionResult VerificarProveedor(int id_provedor)
    {
        if (id_provedor==null)
        {
            return View("ProveedorNoEncontrado");
        }
        else
        {
            return View("DetallesProvedor");
        }
    }
       public IActionResult VerificarVenta(int id)
    {
        if (id==null)
        {
            return View("VentaNoEncontrada");
        }
        else
        {
            return View("DetallesVenta");
        }
    }
    


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
