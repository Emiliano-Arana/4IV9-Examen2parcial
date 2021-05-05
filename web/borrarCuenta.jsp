<%-- 
    Document   : borrarCuenta
    Created on : May 5, 2021, 1:49:51 AM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio</title>
    <link rel="stylesheet" href="./css/StyleIndex.css">
     <link rel="stylesheet" href="./css/StyleNav.css">
    <link rel="stylesheet" href="./css/estilos.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a78d4ea77b.js" crossorigin="anonymous"></script>
    <style>
        a{
            text-decoration: none;
        }
        .body-container{
            margin-bottom: 750px;
        }
    </style>
</head>
<body>
    <%
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;

                    String url, userName, password, driver;
                    url = "jdbc:mysql://localhost/benandjerys";
                    userName = "root";
                    password = "Arm%2312%3927";
                    driver = "com.mysql.jdbc.Driver";
                    
Class.forName(driver);
                con = DriverManager.getConnection(url, userName, password);
                try{
                    int id = Integer.parseInt(request.getParameter("idUsu"));
                    String q = "delete from users where id="+id;
                    
                    set = con.createStatement();
                    int borrar = set.executeUpdate(q);
                    set.close();    
                
                }catch(SQLException ed){
                    System.out.println("Error al eliminar el dato");
                    System.out.println(ed.getMessage());
                
                }
                con.close();
    %>
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
