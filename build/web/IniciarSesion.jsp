<%-- 
    Document   : IniciarSesion
    Created on : May 2, 2021, 9:15:53 PM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/StyleForms.css">
        <link rel="stylesheet" href="./css/StyleNav.css">
        <link rel="stylesheet" href="./css/StyleIndex.css">
        <link rel="stylesheet" href="./css/estilos.css">
        <script src="https://kit.fontawesome.com/341b72a6e8.js" crossorigin="anonymous"></script>
    <title>Registrar</title>
    <style>
        .body-container{
            margin-bottom: 750px;
        }
        
        .botonIngresar{
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100px
        }
        
        .formF{
            padding: 0;
            margin: 0;
        }

        .linkF{
            padding: 11px;
            color: rgb(255,255,255);
            display: block;
            background-color: rgba(67, 141, 184, 0.6);
            cursor: pointer;
        }
        
        .linkF:hover{
            cursor: pointer;
            background-color: rgba(168, 139, 235, 0.6);
            color: white;
            animation: shadow-pulse 1200ms 1;
        }

        .dataF{
            display: none;
        }
    </style>
    </head>
    <body>
        <div class="main-container">
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
                
                if(request.getParameter("usuario").equals("admin9")&&request.getParameter("password").equals("3927")){
                    %>
                    <nav>
                        <div class="BN-I">
                            
                        <div class="BN-D">
                            
                        </div>
                    </nav>
                    <div class="botonIngresar">
                        <a href="./administrar.html" class="boton">Ingresar al modo Administrador</a>
                    </div>
                    
                    <%
                }else{
                    try{
                        String q = "select * from users";
                        String username,pass;
                        username = request.getParameter("usuario");
                        pass = request.getParameter("password");
                        boolean rep=false;
                        int id = -1;

                        set = con.createStatement();
                        rs = set.executeQuery(q);
                        while(rs.next()){
                            if(rs.getString("usu").equals(username)&&rs.getString("pass").equals(pass)){
                                id = rs.getInt("id");
                                rep = true;
                            }
                        }
                        if(rep){
                            %>
                            <nav>
                                <div class="BN-I">
                                    <ul class="Principales">
                                        <li id="full"><form class="formF" action="inicio.jsp">
                                        <input type="text" class="dataF" name="user" value="<%=username%>">
                                        <input type="text" class="dataF" name="idUsu" value="<%=id%>">
                                        <input type="submit" class="linkF" id="full" value="Inicio">
                                    </form></li>
                                        <li id="full"><a class="link" id="productos">Productos</a>
                                            <ul class="sub-link">
                                                <li class="subL" id="full"><a>Helados</a></li>
                                                <li class="subL" id="full"><a>Ofertas</a></li>
                                            </ul>
                                        </li>
                                        <li id="full"><form class="formF" action="conocenos.jsp">
                                        <input type="text" class="dataF" name="user" value="<%=username%>">
                                        <input type="text" class="dataF" name="idUsu" value="<%=id%>">
                                        <input type="submit" class="linkF" id="full" value="Conocenos">
                                    </form></li>
                                        <li id="full"><a class="link">Carrito</a></li>
                                    </ul>
                                </div>
                                <div class="BN-D">
                                    <form class="formF" action="gestionUsuario.jsp">
                                        <input type="text" class="dataF" name="user" value="<%=username%>">
                                        <input type="text" class="dataF" name="idUsu" value="<%=id%>">
                                        <input type="submit" class="linkF" id="full" value="<%=username%>">
                                    </form>
                                </div>
                            </nav>
                            <h1 id=hip>Ben and Jerry's</h1>

                            <div class="container">
                                <img src="./img/prueba.jpg" width="1200px" height="500px" id="otro">
                            </div>
                            <div class="inform">
                                <div>
                                    <p id=burn>Descubre una sabor que mueva tus sentidos</p>
                                    <p>Contamos con gran variedad de sabores que te haran tener una experiencia unica en tu boca</p>
                                    <p id=dis>¡¡¡DISFRUTALOS!!!</p>
                                </div>
                                <img src="./img/sensa.jpg" width="500px" height="300px">
                            </div>
                            <div class="inform">
                                <img src="./img/INGR.jpg" width="500px" height="300px">
                                <div>
                                    <p id=burn>Ingredientes conscientes</p>
                                    <p>¡Nuestros ingredientes promueven un cambio positivo y eso hace que nuestro helado tenga un sabor</p>
                                    <p id=dis>¡¡¡sensacional!!!</p>
                                </div>
                            </div>
                            <div class="body-container">
                            </div>
                            <%
                        }else{
                            %>
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
                                        <li id="full"><a class="link" href="./compra.html">Carrito</a></li>
                                    </ul>
                                </div>
                                <div class="BN-D">
                                    <a class="link" id="full" href="./login.html">Log In/Sign In</a>
                                </div>
                            </nav>
                            <div class="body-container">
                                <form name="IniciarSesion" method="POST" action="">
                                    <h1>Iniciar Sesion</h1>
                                    <p>No se encontro regsitros</p>
                                    <div class="row-wrapper">
                                        <div class="column-wrapper">
                                            <label>Username</label>
                                            <br>
                                            <input type="text" readonly="readonly" class="error" name="err1">
                                            <br>
                                            <div class="escribir"><div class="icon"><i class="fas fa-user"></i></div><input type="text" name="usuario" onkeypress="return validarUsu(event)" class="answer"></div>
                                        </div>
                                        <div class="column-wrapper">
                                            <label>Contraseña</label>
                                            <br>
                                            <input type="text" readonly="readonly" class="error" name="err2">
                                            <br>
                                            <div class="escribir"><div class="icon"><i class="fas fa-lock"></i></div><input type="text" name="password" onkeypress="return validarPass(event)" class="answer"></div>
                                        </div>
                                    </div>
                                    <div class="row-wrapper">
                                        <div class="column-wrapper-boton">
                                            <input type="submit" value="Iniciar Sesion" class="boton" onclick="return validarDatos()">
                                        </div>
                                        <div class="column-wrapper-boton">
                                            <div class="boton"><a href="./register.html">Registrar</a></div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <%
                        }
                        set.close();


                    }catch(SQLException ed){
                        System.out.println("Error al registrar en la tabla");
                        System.out.println(ed.getMessage());
                        %>

                        <h1>Error</h1>

                        <%

                    }
                    con.close();
                }
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                    
                    <h1>Sitio en construcción</h1>
                    
                    <%
            
            }
            
            %>   
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
    <script src="./js/login.js"></script>
    </body>
</html>