using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using Dapper;

public static class BD 
{
    private static string _connectionString = @"Server=localhost;DataBase=PreguntadOrt;Trusted_Connection=True;";

    public static proveedor descripcionPROV(int id_provedor)
    {
        proveedor descripcionPROV = new proveedor();
        
        using(SqlConnection db = new SqlConnection(_connectionString)) {
            string sql = "SELECT * FROM proveedor WHERE id_proveedor = id_provedor_" ;
            MisProveedores = db.Query<proveedor>(sql).ToList();
        }
        
        return MisProveedores;
    }

    public static Objeto descripcionOBJ(int id_objeto)
    {
        Objeto descripcionOBJ = new Objeto();
        
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Objeto WHERE id_objeto = id_objeto_";
            MisObjetos = db.Query<Objeto>(sql).ToList();
        }
        
        return MisObjetos;
    }

    public static venta descripcionVENTA(int id)
    {
        venta descripcionVENTA = new venta();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM venta WHERE id = id_";
            MisVentas = db.Query<venta>(sql).ToList();
        }
        return MisVentas;

    }

    public static void Register(usuario usuario) 
    {
        string sql = "INSERT INTO Usuario(nombre_US,apellido_US,email_US,nombre_empresa,fecha_creacion,contraseña) VALUES(nombre_US_,apellido_US_,email_US_,nombre_empresa_,fecha_creacion_,contraseña_)";
        using(SqlConnection db = new SqlConnection(_connectionString)) {
            db.Execute(sql, new {nombre_US_ = usuario.nombre_US, apellido_US_ = usuario.apellido_US, email_US_ = usuario.email_US, nombre_empresa_ = usuario.nombre_empresa, fecha_creacion_=usuario.fecha_creacion ,contraseña_ = usuario.contraseña});   
        }
    }
    public static usuario Login(string nombre_US, string contraseña) {
        usuario MiUser = new usuario();
        using(SqlConnection db = new SqlConnection(_connectionString)) {
            string sql = "SELECT * FROM Usuario WHERE nombre_US = @nombre_US_ AND contraseña = @contraseña_";
            MiUser = db.QueryFirstOrDefault<usuario>(sql, new {nombre_US_ = nombre_US, contraseña_ = contraseña });
        }
        return MiUser;
    }
     public static usuario Olvide(string email_US) {
        usuario MiUser = new usuario();
        using(SqlConnection db = new SqlConnection(_connectionString)) {
            string sql = "SELECT * FROM Usuario WHERE email_US = @email_US_ ";
            MiUser = db.QueryFirstOrDefault<usuario>(sql, new {email_US_ = email_US });
        }
        return MiUser;
    }
}

