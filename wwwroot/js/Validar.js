
﻿document.addEventListener("DOMContentLoaded", () => {
    let contraseña = document.getElementById("contraseña_");
    const mayus = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M','N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

    const enviar = document.getElementById("Register");
    enviar.disabled = true

    contraseña.addEventListener('input', () => {
        let valor = contraseña.value;
        const Mayusculas = mayus.some(caracter => valor.includes(caracter))

        if(Mayusculas){
            contraseña.style.border = "2px solid green";
            enviar.disabled = false
        }else{
            contraseña.style.border = "2px solid red"
        }

    })
});

{
    
    $.ajax(
    {
        type:'POST',
        datatype:'JSON',
        url:'/Home/Detalles',
        data:{id_objeto: id_objeto_},
        
        success: function(Objeto) {
            $("#ImgObjeto").html(Objeto.img_obj);
            $("#NombreObjeto").html(Objeto.Nombre_Obj);
            $("#TipoObjeto").html(Objeto.tipo_objeto);
            $("#stockObjeto").html(Objeto.stock);
            $("#lugarObjeto").html(Objeto.lugar);
            $("#FechaFacturacion").html("Ultima Fecha de facturacion: " + Objeto.fecha_Fact.substr(0,9));
        }
    })
}

