function validarProduct(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[A-Za-zñáéíóú]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarNum(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[0-9]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarPrice(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[0-9.]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarText(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[A-Za-zñáéíóú]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarDatos(){
    document.DatosProducto.err1.value= "";
    document.DatosProducto.err2.value= "";
    document.DatosProducto.err3.value= "";
    document.DatosProducto.err4.value= "";
    var verif = true;

    var pro = document.DatosProducto.producto.value;
    var pri = document.DatosProducto.precio.value;
    var dis = document.DatosProducto.descuento.value;
    var des = document.DatosProducto.descripcion.value;

    var puntos = 0;

    var patPro = /[A-Za-zñáéíóú]/;
    var patPri = /[0-9.]/;
    var patDis = /[0-9]/;
    var patDes = /[A-Za-zñáéíóú]/;

    if(pro.length<1){
        verif = false;
        document.DatosProducto.err1.value= "*Este campo es obligatorio";
    }

    if(pro.length>25){
        verif = false;
        document.DatosProducto.err1.value= "*Ingreso demasiados caracteres";
    }

    if(pri.length<1){
        verif = false;
        document.DatosProducto.err2.value= "*Este campo es obligatorio";
    }

    if(pri.length>5){
        document.DatosProducto.err2.value= "*Ingreso demasiados caracteres";
        verif = false;
    }

    if(dis.length<1){
        verif = false;
        document.DatosProducto.err3.value= "*Este campo es obligatorio";
    }

    if(dis.length>2){
        document.DatosProducto.err3.value= "*Ingreso demasiados caracteres";
        verif = false;
    }

    if(des.length<1){
        verif = false;
        document.DatosProducto.err4.value= "*Este campo es obligatorio";
    }

    if(des.length>200){
        document.DatosProducto.err4.value= "*Ingreso demasiados caracteres";
        verif = false;
    }

    for(var i=0;i<pro.length;i++){
        if(patPro.test(pro[i])){

        }else{
            document.DatosProducto.err1.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<pri.length;i++){
        if(patPri.test(pri[i])){

        }else{
            document.DatosProducto.err2.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
        if(pri[i]=="."){
            puntos += 1;
        }
    }

    if(puntos>=2){
        document.DatosProducto.err2.value= "*Ingreso demasiados puntos";
        verif = false;
    }

    for(var i=0;i<dis.length;i++){
        if(patDis.test(dis[i])){

        }else{
            document.DatosProducto.err3.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<des.length;i++){
        if(patDes.test(des[i])){

        }else{
            document.DatosProducto.err4.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    return verif;
}