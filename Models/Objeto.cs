public class Objeto
{
    
    public int id_objeto{ get; set; }
    public int stock{ get; set; }
    public string tipo_objeto{ get; set; }
    public int lugar{ get; set; }
    public DateTime fecha_Fact{ get; set; }
    public string Nombre_Obj{ get; set; }  
    public string img_obj{ get; set; }  
    
  public static Objeto( int id_objeto_, int stock_, string tipo_objeto_, int lugar_, DateTime fecha_Fact_, string Nombre_Obj_, string img_obj_ )
    {
        id_objeto = id_objeto_;
        stock = stock_;
        tipo_objeto = tipo_objeto_;
        lugar = lugar_;
        fecha_Fact = fecha_Fact_;
        Nombre_Obj = Nombre_Obj_;
        img_obj = img_obj_;
    }
}

