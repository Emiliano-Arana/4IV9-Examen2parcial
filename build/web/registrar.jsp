<%-- 
    Document   : registrar
    Created on : May 2, 2021, 8:33:02 PM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/StyleForms.css">
        <link rel="stylesheet" href="./css/StyleNav.css">
        <link rel="stylesheet" href="./css/estilos.css">
        <script src="https://kit.fontawesome.com/341b72a6e8.js" crossorigin="anonymous"></script>
    <title>Registrar</title>
    <style>
        .body-container{
            margin-bottom: 750px;
        }
    </style>
    </head>
    <body>
        <div class="main-container">
        <nav>
            <div class="BN-I">
                <ul class="Principales">
                    <li id="full"><a class="link" href="./index.html">Inicio</a></li>
                    <li id="full"><a class="link" id="productos">Productos</a>
                        <ul class="sub-link">
                            <li class="subL" id="full"><a>Helados</a></li>
                            <li class="subL" id="full"><a>Ofertas</a></li>
                        </ul>
                    </li>
                    <li id="full"><a class="link" href="./conocenos.html">Conocenos</a></li>
                    <li id="full"><a class="link">Carrito</a></li>
                </ul>
            </div>
            <div class="BN-D">
                <a class="link" id="full" href="./login.html">Log In/Sign In</a>
            </div>
        </nav>
        <div class="body-container">
    <%
            Connection con = null;
            Statement set = null;
            ResultSet rs = null;
            
            String url, userName, password, driver;
            
            url = "mysql://r4cpqdasfj2w6lnr:rd78fipx9g5wgedd@frwahxxknm9kwy6c.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/sjb1bpe9m53ayonq";
            userName = "r4cpqdasfj2w6lnr";
            password = "rd78fipx9g5wgedd";
            driver = "com.mysql.jdbc.Driver";
            
            try{
                Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                
                
                try{
                    String q = "select * from users";
                    String nombre,appat,apmat,edad,username,pass,mail,tel;
                    nombre = request.getParameter("nombre");
                    appat = request.getParameter("appat");
                    apmat = request.getParameter("apmat");
                    edad = request.getParameter("edad");
                    username = request.getParameter("username");
                    pass = request.getParameter("password");
                    mail = request.getParameter("mail");
                    tel = request.getParameter("tel");
                    boolean rep=true;
                            
                    set = con.createStatement();
                    rs = set.executeQuery(q);
                    while(rs.next()){
                        if(rs.getString("usu").equals(username)){
                            rep = false;
                        }
                        if(rs.getString("mail").equals(mail)){
                            rep = false;
                        }
                        
                    }
                    if(request.getParameter("username").equals("admin9")){
                        
                    }else{
                        if(rep){
                            String k = "insert into users(nombre, appat, apmat, usu, pass, edad, mail, tel) "
                            + "values('"+nombre+"', '"+appat+"', '"+apmat+"', '"+username+"', '"+pass+"', '"+edad+"', '"+mail+"', '"+tel+"')";
                            int registro = set.executeUpdate(k);
                            %>
                            <h1>Registro Exitoso</h1>
                            <%
                        }else{
                            %>
                            <h1>Usuario o Correo ya registrados</h1>
                            <%
                        }
                    }
                        set.close();
                        
                
                }catch(SQLException ed){
                    System.out.println("Error al registrar en la tabla");
                    System.out.println(ed.getMessage());
                    %>
                    
                    <h1>Registro No Exitoso</h1>
                    
                    <%
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                    
                    <h1>Sitio en construcción</h1>
                    
                    <%
            
            }
            
            %>   
            <div class="row-wrapper">
                <div class="column-wrapper-boton">
                    <div class="boton"><a href="./register.html">Registrar</a></div>
                </div>
                <div class="column-wrapper-boton">
                    <div class="boton"><a href="./login.html">Iniciar Sesion</a></div>
                </div>
            </div>
        </div>   
            <footer>
            <h1 id=con>Contactanos</h1>
            <div class=formulario>
                <form action="" >
                    <p id=dis>Formulario de contacto</p>
                    <input type="text" name="nombre" placeholder="Nombre" required>
                    <input type="text" name="apellido" placeholder="Apellido" required>
                    <input type="email" name="correo" placeholder="Correo" required>
                    <textarea name="mensaje" placeholder="Escriba su mensaje" cols="30" rows="10" required></textarea>
                    <input type="submit" value="Enviar" id="boton">
                </form>
            </div>
            <div class="redes-sociales">
                <ul>
                    <li><a href="https://es-la.facebook.com/benandjerrys/"><p id=facebook><i class="fab fa-facebook-square fa-3x"></i></p></a></li>
                    <li><a href="https://www.instagram.com/benandjerrys/?hl=es"><p id="instagram"><i class="fab fa-instagram-square  fa-3x"></i></p></a></li>
                    <li><p id="correo"><i class="fas fa-envelope fa-3x"></i></p></li>
                    <li><a href="https://twitter.com/benandjerrys"><p id="twitter"><i class="fab fa-twitter-square fa-3x" ></i></p></a></li>
                </ul>
            </div>
            <div class=nombres>
                <p id="nom">Hecho por</p>
                <br>
                <p id="nom">Arana Chavez Emiliano</p>
                <br>
                <p id="nom">Lizarraga Anguiano Jesus Adrian</p>
                <br>
                <p id="nom">Núñez Manrique Cuauhtemoc Emmanuel</p>
            </div>
        </footer>
    </div>
    </body>
</html>
