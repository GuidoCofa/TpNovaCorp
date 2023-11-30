public class usuario
{
    
    public int id_usuario{ get; set; }
    public string email_US{ get; set; }
    public string apellido_US{ get; set; }
    public string nombre_empresa{ get; set; }
    public string nombre_US{ get; set; }   
    public string contraseña{ get; set; }   
    
    
  public  usuario( int id_usuario_, string email_US_, string apellido_US_, string nombre_empresa_ , string nombre_US_, string contraseña_  )
    {
        id_usuario = id_usuario_;
        email_US =email_US_;
        apellido_US = apellido_US_;
        nombre_empresa = nombre_empresa_;
        nombre_US = nombre_US_;
        contraseña=contraseña_;
    }

      public  usuario(  string email_US_, string apellido_US_, string nombre_empresa_, string nombre_US_, string contraseña_  )
    {
   
        email_US =email_US_;
        apellido_US = apellido_US_;
        nombre_empresa = nombre_empresa_;
        nombre_US = nombre_US_;
        contraseña=contraseña_;
    }

    public  usuario()
    {
 
    }
}



