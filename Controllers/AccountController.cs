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
    public IActionResult Olvide() {

    return View("OlvideContraseña");
    }
    public IActionResult Login() {

        return View("Login");
    }
    public IActionResult ValidarLogin(string usuario, string contraseña) {
        @ViewBag.Usuario = BD.Login(usuario,contraseña);
        if(@ViewBag.Usuario != null) {
            return View("PostLogin");
        } else {
            return View("Login");
        }
    }
    public IActionResult Register() {
         
        return View("Register");
    }
    public IActionResult IngresarRegister(string usuario, string contraseña, int telefono, string email, string nombre) {
        Usuarios user = new Usuarios(usuario,contraseña,nombre,email,telefono);
        BD.Register(user);
        @ViewBag.Usuario = user;
        return View("Register");
    }
    public IActionResult OlvideContraseña() {
        return View("OlvideContraseña");
    }
    public IActionResult Privacy()
    {
        return View();
    }

}