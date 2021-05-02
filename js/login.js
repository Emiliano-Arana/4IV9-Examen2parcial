function validarUsu(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[A-Za-zñáéíóú0-9_-]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarPass(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[$%A-Za-zñáéíóú0-9_-]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarDatos(){
    document.IniciarSesion.err1.value= "";
    document.IniciarSesion.err2.value= "";
    var verif = true;

    var usu = document.IniciarSesion.usuario.value;
    var contra = document.IniciarSesion.password.value;

    var patUsu = /[A-Za-z0-9_-]/;
    var patPass = /[$%A-Za-zñáéíóú0-9_-]/;

    if(usu.length<1){
        verif = false;
        document.IniciarSesion.err1.value= "*Este campo es obligatorio";
    }

    if(usu.length>15){
        verif = false;
        document.IniciarSesion.err1.value= "*Ingreso demasiados caracteres";
    }

    if(contra.length<1){
        verif = false;
        document.IniciarSesion.err2.value= "*Este campo es obligatorio";
    }

    if(contra.length>15){
        document.IniciarSesion.err2.value= "*Ingreso demasiados caracteres";
        verif = false;
    }

    for(var i=0;i<usu.length;i++){
        if(patUsu.test(usu[i])){

        }else{
            document.IniciarSesion.err1.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<usu.length;i++){
        if(patPass.test(contra[i])){

        }else{
            document.IniciarSesion.err2.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    return verif;
}