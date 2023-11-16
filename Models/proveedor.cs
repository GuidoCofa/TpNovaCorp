public class proveedor
{
    
    public int id_provedor{ get; set; }
    public string email_prov{ get; set; }
    public string apellido_prov{ get; set; }
    public int id_objeto{ get; set; }
    public DateTime fecha_Nac{ get; set; }
    public string nombre_prov{ get; set; }    
    
  public  proveedor( int id_provedor_, string email_prov, string apellido_prov, int id_objeto_, DateTime fecha_Nac_, string nombre_prov )
    {
        id_provedor = id_provedor_;
        email_prov = email_prov_;
        apellido_prov = apellido_prov_;
        id_objeto = id_objeto_;
        fecha_Nac = fecha_Nac_;
        nombre_prov = nombre_prov_;
    }
}



