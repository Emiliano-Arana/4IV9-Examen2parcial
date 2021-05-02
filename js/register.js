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

function validarNum(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[0-9]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validar(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[A-Za-zñáéíóú]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarMail(e){
    var teclado = (document.all)?e.keyCode:e.which;
    var patron = /[@a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]/;
    var prueba = String.fromCharCode(teclado);
    return patron.test(prueba);
}

function validarDatos(){
    document.Registrar.err1.value= "";
    document.Registrar.err2.value= "";
    document.Registrar.err3.value= "";
    document.Registrar.err4.value= "";
    document.Registrar.err5.value= "";
    document.Registrar.err6.value= "";
    document.Registrar.err7.value= "";
    document.Registrar.err8.value= "";
    var verif = true;

    var usu = document.Registrar.username.value;
    var contra = document.Registrar.password.value;
    var nom = document.Registrar.nombre.value;
    var appat = document.Registrar.appat.value;
    var apmat = document.Registrar.apmat.value;
    var mail = document.Registrar.mail.value;
    var edad = document.Registrar.edad.value;
    var tel = document.Registrar.tel.value;

    var patUsu = /[A-Za-z0-9_-]/;
    var patPass = /[$%A-Za-zñáéíóú0-9_-]/;
    var patNoms = /[A-Za-zñáéíóú]/;
    var patNum = /[0-9]/;

    if(usu.length<1){
        verif = false;
        document.Registrar.err2.value= "*Este campo es obligatorio";
    }

    if(usu.length>15){
        verif = false;
        document.Registrar.err2.value= "*Ingreso demasiados caracteres";
    }

    if(nom.length<1){
        verif = false;
        document.Registrar.err1.value= "*Este campo es obligatorio";
    }

    if(nom.length>20){
        verif = false;
        document.Registrar.err1.value= "*Ingreso demasiados caracteres";
    }

    if(appat.length<1){
        verif = false;
        document.Registrar.err3.value= "*Este campo es obligatorio";
    }

    if(appat.length>20){
        verif = false;
        document.Registrar.err3.value= "*Ingreso demasiados caracteres";
    }

    if(apmat.length<1){
        verif = false;
        document.Registrar.err5.value= "*Este campo es obligatorio";
    }

    if(apmat.length>20){
        verif = false;
        document.Registrar.err5.value= "*Ingreso demasiados caracteres";
    }

    if(contra.length<1){
        verif = false;
        document.Registrar.err4.value= "*Este campo es obligatorio";
    }

    if(contra.length>15){
        document.Registrar.err4.value= "*Ingreso demasiados caracteres";
        verif = false;
    }

    if(mail.length<1){
        verif = false;
        document.Registrar.err6.value= "*Este campo es obligatorio";
    }

    if(mail.length>100){
        document.Registrar.err6.value= "*Ingreso demasiados caracteres";
        verif = false;
    }

    if(edad.length<1){
        verif = false;
        document.Registrar.err7.value= "*Este campo es obligatorio";
    }

    if(edad.length>3){
        document.Registrar.err7.value= "*Ingreso demasiados caracteres";
        verif = false;
    }

    if(tel.length<1){
        verif = false;
        document.Registrar.err8.value= "*Este campo es obligatorio";
    }

    if(tel.length>14){
        document.Registrar.err8.value= "*Ingreso demasiados caracteres";
        verif = false;
    }

    for(var i=0;i<usu.length;i++){
        if(patUsu.test(usu[i])){

        }else{
            document.Registrar.err2.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<contra.length;i++){
        if(patPass.test(contra[i])){

        }else{
            document.Registrar.err4.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<nom.length;i++){
        if(patNoms.test(nom[i])){

        }else{
            document.Registrar.err1.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<appat.length;i++){
        if(patNoms.test(appat[i])){

        }else{
            document.Registrar.err3.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<apmat.length;i++){
        if(patNoms.test(apmat[i])){

        }else{
            document.Registrar.err5.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<edad.length;i++){
        if(patNum.test(edad[i])){

        }else{
            document.Registrar.err7.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    for(var i=0;i<tel.length;i++){
        if(patNum.test(tel[i])){

        }else{
            document.Registrar.err8.value= "*Ingreso algun caracter invalido";
            verif = false;
        }
    }

    return verif;
}