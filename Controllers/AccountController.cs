using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;

namespace PrimerProyecto.Controllers;

public class AccountController : Controller
{
    private readonly ILogger<AccountController> _logger;
    public AccountController(ILogger<AccountController> logger)
    {
        _logger = logger;
    }
    public IActionResult Index()
    {
        return View();
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
    public IActionResult Register() {
         
        return View("Register");
    }
    //------------------------------------------------------------------------POSIBLE ERROR----------------------------------------------------------------------------------------------*/
    public IActionResult IngresarRegister( string email_US, string apellido_US, string nombre_empresa, DateTime fecha_creacion, string nombre_US, string contraseña) {
      
        usuario usario = new usuario(  email_US,  apellido_US,  nombre_empresa,  fecha_creacion,  nombre_US,  contraseña);
        BD.Register(usuario);
        @ViewBag.usuario = usuario;
        return View("Register");
    }
    public IActionResult OlvideContraseña() {
        return View("OlvideContraseña");
    }
  
}