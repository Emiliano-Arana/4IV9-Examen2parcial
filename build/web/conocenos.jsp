<%-- 
    Document   : conocenos.jsp
    Created on : May 4, 2021, 7:08:52 PM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conocenos</title>
    <link rel="stylesheet" href="./css/StyleIndex.css">
    <link rel="stylesheet" href="./css/StyleConocenos.css">
    <link rel="stylesheet" href="./css/StyleNav.css">
    <link rel="stylesheet" href="./css/estilos.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a78d4ea77b.js" crossorigin="anonymous"></script>
    <style>
        
        .body-container{
            margin-bottom: 850px;
        }
        a{
            text-decoration: none;
        }
        
        .formF{
            padding: 0;
            margin: 0;
            width: fit-content;
        }

        .linkF{
            padding: 11px;
            color: rgb(255,255,255);
            display: block;
            background-color: rgba(67, 141, 184, 0.6);
            cursor: pointer;
            border: 0px;
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
        <nav>
                                <div class="BN-I">
                                    <ul class="Principales">
                                        <li id="full"><form class="formF" action="inicio.jsp">
                                        <input type="text" class="dataF" name="user" value="<%=request.getParameter("user")%>">
                                        <input type="text" class="dataF" name="idUsu" value="<%=request.getParameter("idUsu")%>">
                                        <input type="submit" class="linkF" id="full" value="Inicio">
                                    </form></li>
                                        <li id="full"><a class="link" id="productos">Productos</a>
                                            <ul class="sub-link">
                                                <li class="subL" id="full"><a>Helados</a></li>
                                                <li class="subL" id="full"><a>Ofertas</a></li>
                                            </ul>
                                        </li>
                                        <li id="full"><form class="formF" action="conocenos.jsp">
                                        <input type="text" class="dataF" name="user" value="<%=request.getParameter("user")%>">
                                        <input type="text" class="dataF" name="idUsu" value="<%=request.getParameter("idUsu")%>">
                                        <input type="submit" class="linkF" id="full" value="Conocenos">
                                    </form></li>
                                        <li id="full"><a class="link">Carrito</a></li>
                                    </ul>
                                </div>
                                <div class="BN-D">
                                    <form class="formF" action="gestionUsuario.jsp">
                                        <input type="text" class="dataF" name="user" value="<%=request.getParameter("user")%>">
                                        <input type="text" class="dataF" name="idUsu" value="<%=request.getParameter("idUsu")%>">
                                        <input type="submit" class="linkF" id="full" value="<%=request.getParameter("user")%>">
                                    </form>
                                </div>
                            </nav>
        <h1 id=hip>Ben and Jerry's</h1>

        <div class="ino">
            <p id=burn>Conocenos</p>
        </div>
        <div class="inform">
            <img src="./img/locales.jpg" width="500px" height="300px">
            <div>
                <p id=burn>Locales Asociados</p>
                <p>??PartnerShops son las helader??as de Ben & Jerry???s que son propiedad y est??n manejadas por organizaciones sin fines de lucro orientadas a los j??venes.</p>
                <p id=dis>??????sensacional!!!</p>
            </div>
        </div>
        <div class="inform">
            <div>
                <p id=burn>Nuestros Valores</p>
                <p>Ben & Jerry???s tiene una misi??n dividida en 3 pilares igualmente importantes, siempre con la intenci??n de crear prosperidad para cualquier persona que est?? conectada con la marca: proveedores, empleados, agricultores, franquiciatarios, clientes y vecinos por igual.</p>
            </div>
            <img src="./img/valores.jpg" width="500px" height="300px">
        </div>
        <div class="inform">
            <img src="https://www.benandjerrys.com.mx/files/live/sites/systemsite/files/about-us/how-we-are-structured/BOD-header-image.png" width="500px" height="300px">
            <div>
                <p id=burn>Nuestra Estructura</p>
                <p>??Suponemos que la mayor??a de ustedes ya sabe que Ben & Jerry???s es una filial de propiedad absoluta de Unilever; sin embargo, creemos que nunca han conocido nuestro Consejo de Administraci??n independiente???

                    image - image-from-the-document-manager
                    No se trata de un ??rgano ejecutivo convencional, sino de un B.O.D. (??muy!) independiente con la facultad de proteger y defender el valor y la integridad de la marca Ben & Jerry???s. ??y TAMBI??N la calidad de los productos!  Adem??s, se aseguran de que las personas que reci??n ingresan a la empresa tengan un salario </p>
                <p id=dis>??????descente!!!</p>
            </div>
        </div>
        <div class=bussines>
            <p id=burn>Como hacemos negocios</p>
        </div>
        <div class="inform">
            <div>
                <p id=burn>Suministro de ingredientes y pr??cticas de compras</p>
                <p>Con nuestros ingredientes y el poder de nuestras decisiones de compras para respaldar un cambio positivo no solo tiene sentido sino que hace que nuestros helados ??sean exquisitos!</p>
            </div>
            <div>
                <p id=burn>Practicas de fabricaci??n</p>
                <p>??Sabemos cu??l es nuestra huella de carbono y estamos trabajando a trav??s de nuestras operaciones para reducirla, e informamos anualmente el progreso. Y no es solo una cuesti??n medioambiental, es una cuesti??n de justicia social y econ??mica.</p>
            </div>
            <div>
                <p id=burn>Personas, comunidad y pr??cticas de ???devoluci??n???</p>
                <p>Es un bien para nosotros tomar una pala, un martillo y un pincel para hacer un bien a nuestras comunidades locales pero el compromiso de Ben & Jerry???s con la comunidad va mucho m??s all?? de eso.</p>
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
                <p id="nom">N????ez Manrique Cuauhtemoc Emmanuel</p>
            </div>
        </footer>
    </div>
</body>
</html>