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




        public IActionResult Inventario (int id_objeto)
   {
         ViewBag.Objeto = BD.descripcionOBJ(id_objeto);

        return View("Inventario");
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
    


    


  public IActionResult Register()
    {
        return View("registrarse"); 
    }

    public IActionResult Ingre()
    {
        return View("ingresar");
    }



    public IActionResult Login() {

        return View("Login");
    }
     public IActionResult ValidarLogin(string nombre_US, string contraseña) {
         @ViewBag.usuario = BD.Login(nombre_US,contraseña);
         if(@ViewBag.usuario != null) {
             return View("PostLogin");
         } else {
             return View("Login");
         }
     }
    //------------------------------------------------------------------------POSIBLE ERROR----------------------------------------------------------------------------------------------*/
     public IActionResult IngresarRegister( string email_US, string apellido_US, string nombre_empresa, string nombre_US, string contraseña) {
      
         usuario usuario = new usuario(  email_US,  apellido_US,  nombre_empresa,  nombre_US,  contraseña);
         BD.Register(usuario);
         @ViewBag.usuario = usuario;
         return View("PostLogin");
     }
     public IActionResult OlvideContraseña() {
         return View("OlvideContraseña");
     }

     
}
