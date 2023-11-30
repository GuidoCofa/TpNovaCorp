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

    public IActionResult Index(int id_objeto=1)
    {

        ViewBag.Objeto = BD.descripcionOBJ(id_objeto);
        return View();
    }


    /*public Objeto Detalles(int id_objeto)
    {
       return BD.descripcionOBJ(id_objeto);

        // if (Objeto == null)
        // {
        //     return View("objetoNoEncontrado");
        // }
        // else
        // {
        //     return View("DetalleObjeto");

        // }

        // return View(Objeto);
    } */
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


  public IActionResult Register()
    {
        return View("registrarse"); 
    }

    public IActionResult Ingre()
    {
        return View("ingresar");
    }
}
