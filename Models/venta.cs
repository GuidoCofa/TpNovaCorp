    public class venta
{
    
    public int id{ get; set; }
    public int id_usuario{ get; set; }
    public int id_proveedor{ get; set; }
    public int cantidad{ get; set; }
    public int id_objeto{ get; set; }    
    
  public  venta( int id_, int id_usuario_, int id_proveedor_, int cantidad_, int id_objeto_ )
    {
        id = id_;
        id_usuario = id_usuario_;
        id_proveedor = id_proveedor_;
        cantidad = cantidad_;
        id_objeto = id_objeto_;
    }



 public  venta()
    {
    
    }
}