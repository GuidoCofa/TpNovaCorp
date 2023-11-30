public class proveedor
{
    
    public int id_provedor{ get; set; }
    public string email_prov{ get; set; }
    public string apellido_prov{ get; set; }
    public int id_objeto{ get; set; }
    public string nombre_prov{ get; set; }    
    
  public  proveedor( int id_provedor_, string email_prov_, string apellido_prov_, int id_objeto_ , string nombre_prov_ )
    {
        id_provedor = id_provedor_;
        email_prov = email_prov_;
        apellido_prov = apellido_prov_;
        id_objeto = id_objeto_;
        nombre_prov = nombre_prov_;
    }
    public  proveedor()
    {}
}



