using System.Data.SqlClient;
using System.Data;
using System.Collections.Generic;
using Dapper;

public static class BD 
{
    private static string _connectionString = @"Server=localhost;DataBase=TpFinal;Trusted_Connection=True;";

    public static proveedor descripcionPROV(int id_proveedor, string email_prov, string apellido_prov, int id_objeto, DateTime fecha_Nac, string nombre_prov)
    {
        proveedor descripcionPROV = new proveedor();
        
        using(SqlConnection db = new SqlConnection(_connectionString)) {
            string sql = "SELECT * FROM proveedor WHERE id_proveedor = @id_proveedor";
            descripcionPROV = db.QueryFirstOrDefault<proveedor>(sql, new { id_proveedor });
        }
        
        return descripcionPROV;
    }

    public static List<Objeto> descripcionOBJ(int id_objeto)
    {
        List<Objeto> descripcionOB = new List<Objeto>();
        
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM Objeto WHERE id_objeto = @id_objeto";
            descripcionOB = db.Query<Objeto>(sql, new { id_objeto }).ToList();
        }
        
        return descripcionOB;
    }

    public static venta descripcionVENTA(int id, int id_usuario, int id_proveedor, int cantidad, DateTime fecha_venta, int id_objeto)
    {
        venta descripcionVENTA = new venta();
        using(SqlConnection db = new SqlConnection(_connectionString)){
            string sql = "SELECT * FROM venta WHERE id = @id";
            descripcionVENTA = db.QueryFirstOrDefault<venta>(sql, new { id });
        }
        return descripcionVENTA;
    }

    public static void Register(usuario usuario) 
    {
        string sql = "INSERT INTO Usuario(id_US,email_US,apellido_US,nombre_empresa,fecha_creacion,nombre_US,contraseña) VALUES(@id_US,@email_US, @apellido_US, @nombre_empresa, @fecha_creacion, @nombre_US, @contraseña)";
        using(SqlConnection db = new SqlConnection(_connectionString)) {
            db.Execute(sql, usuario);
        }
    }

    public static usuario Login(string nombre_US, string contraseña) {
        usuario MiUser = new usuario();
        using(SqlConnection db = new SqlConnection(_connectionString)) {
            string sql = "SELECT * FROM Usuario WHERE nombre_US = @nombre_US AND contraseña = @contraseña";
            MiUser = db.QueryFirstOrDefault<usuario>(sql, new { nombre_US, contraseña });
        }
        return MiUser;
    }

    public static usuario Olvide(string email_US) {
        usuario MiUser = new usuario();
        using(SqlConnection db = new SqlConnection(_connectionString)) {
            string sql = "SELECT * FROM Usuario WHERE email_US = @email_US";
            MiUser = db.QueryFirstOrDefault<usuario>(sql, new { email_US });
        }
        return MiUser;
    }
}
