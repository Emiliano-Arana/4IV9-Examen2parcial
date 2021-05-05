<%-- 
    Document   : gestionUsuario2
    Created on : May 4, 2021, 8:03:51 PM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="./css/StyleForms.css">
    <link rel="stylesheet" href="./css/StyleNav.css">
    <link rel="stylesheet" href="./css/estilos.css">
    <script src="https://kit.fontawesome.com/341b72a6e8.js" crossorigin="anonymous"></script>
    <title>Gestion Usuario</title>
    <style>
        .body-container{
            margin-bottom: 750px;
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
    <%
                    Connection con = null;
                    Statement set = null;
                    ResultSet rs = null;

                    String url, userName, password, driver;
                    url = "mysql://r4cpqdasfj2w6lnr:rd78fipx9g5wgedd@frwahxxknm9kwy6c.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/sjb1bpe9m53ayonq";
                    userName = "r4cpqdasfj2w6lnr";
                    password = "rd78fipx9g5wgedd";
                    driver = "com.mysql.jdbc.Driver";
                    int id = Integer.parseInt(request.getParameter("idUsu"));
                    
                try{
                    Class.forName(driver);
                    con = DriverManager.getConnection(url, userName, password);
                    try{
                        
                        boolean rep=true;

                        String nombre,appat,apmat,edad,username,pass,mail,tel;
                        nombre = request.getParameter("nombre");
                        appat = request.getParameter("appat");
                        apmat = request.getParameter("apmat");
                        edad = request.getParameter("edad");
                        username = request.getParameter("username");
                        pass = request.getParameter("password");
                        mail = request.getParameter("mail");
                        tel = request.getParameter("tel");
                        
                        String j = "select * from users";
                        set = con.createStatement();
                        
                        rs = set.executeQuery(j);
                        while(rs.next()){
                            if((rs.getString("nombre").equals(nombre)||rs.getString("mail").equals(mail))&&rs.getInt("id")!=id){
                                rep = false;
                            }
                        }
                        if(rep){
                            String q = "update users set nombre = '"+nombre+"', "
                                    + "appat = '"+appat+"', apmat = '"+apmat+"', usu = '"+username+"', pass = '"+pass+"', edad = '"+edad+"', mail = '"+mail+"', tel = '"+tel+"'"
                                    + "where id = "+id+"";
                            int actualizar = set.executeUpdate(q);
                        }


                        }catch(SQLException ed){
                            System.out.println("Error al actualizar el dato");
                            System.out.println(ed.getMessage());
                        }
                        con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
            }
    %>
    <div class="main-container">
        <nav>
                                <div class="BN-I">
                                    <ul class="Principales">
                                        <li id="full"><form class="formF" action="inicio.jsp">
                                        <input type="text" class="dataF" name="user" value="<%=request.getParameter("username")%>">
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
                                        <input type="text" class="dataF" name="user" value="<%=request.getParameter("username")%>">
                                        <input type="text" class="dataF" name="idUsu" value="<%=request.getParameter("idUsu")%>">
                                        <input type="submit" class="linkF" id="full" value="Conocenos">
                                    </form></li>
                                        <li id="full"><a class="link">Carrito</a></li>
                                    </ul>
                                </div>
                                <div class="BN-D">
                                    <form class="formF" action="gestionUsuario.jsp">
                                        <input type="text" class="dataF" name="user" value="<%=request.getParameter("username")%>">
                                        <input type="text" class="dataF" name="idUsu" value="<%=request.getParameter("idUsu")%>">
                                        <input type="submit" class="linkF" id="full" value="<%=request.getParameter("username")%>">
                                    </form>
                                </div>
                            </nav>
        <div class="body-container">
            <%
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        try{
                            String k = "select * from users";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(k);
                            while(rs.next()){
                                
                            if(rs.getInt("id")==id){
                    %>
            <form name="Registrar" action="gestionUsuario2.jsp" method="POST">
                <h1>Actualizar Datos</h1>
                <div class="row-wrapper">
                    <div class="column-wrapper">
                        <label>Nombre</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" id="err1">
                        <br>
                        <div class="escribir"><div class="icon"><i class="far fa-user"></i></div><input value="<%=rs.getString("nombre")%>" type="text" name="nombre" onkeypress="return validar(event)" class="answer"></div>
                    </div>
                    <div class="column-wrapper">
                        <label>Username</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" id="err2">
                        <br>
                        <div class="escribir"><div class="icon"><i class="fas fa-user"></i></div><input value="<%=rs.getString("usu")%>" type="text" name="username" onkeypress="return validarUsu(event)" class="answer"></div>
                    </div>
                </div>
                <div class="row-wrapper">
                    <div class="column-wrapper">
                        <label>Apellido Paterno</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" id="err3">
                        <br>
                        <div class="escribir"><div class="icon"><i class="far fa-user"></i></div><input value="<%=rs.getString("appat")%>" type="text" name="appat" onkeypress="return validar(event)" class="answer"></div>
                    </div>
                    <div class="column-wrapper">
                        <label>Contraseña</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" id="err4">
                        <br>
                        <div class="escribir"><div class="icon"><i class="fas fa-lock"></i></div><input value="<%=rs.getString("pass")%>" type="text" name="password" onkeypress="return validarPass(event)" class="answer"></div>
                    </div>
                </div>
                <div class="row-wrapper">
                    <div class="column-wrapper">
                        <label>Apellido Materno</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" id="err5">
                        <br>
                        <div class="escribir"><div class="icon"><i class="far fa-user"></i></div><input value="<%=rs.getString("apmat")%>" type="text" name="apmat" onkeypress="return validar(event)" class="answer"></div>
                    </div>
                    <div class="column-wrapper">
                        <label>Correo Electronico</label>
                        <br>
                        <input type="email" readonly="readonly" class="error" id="err6">
                        <br>
                        <div class="escribir"><div class="icon"><i class="fas fa-envelope"></i></div><input value="<%=rs.getString("mail")%>" type="email" name="mail" onkeypress="return validarMail(event)" class="answer"></div>
                    </div>
                </div>
                <div class="row-wrapper">
                    <div class="column-wrapper">
                        <label>Edad</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" id="err7">
                        <br>
                        <div class="escribir"><div class="icon"><i class="far fa-user"></i></div><input value="<%=rs.getString("edad")%>" type="text" name="edad" onkeypress="return validarNum(event)" class="answer"></div>
                    </div>
                    <div class="column-wrapper">
                        <label>Telefono</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" id="err8">
                        <br>
                        <div class="escribir"><div class="icon"><i class="fas fa-phone-alt"></i></div><input value="<%=rs.getString("tel")%>" type="text" name="tel" onkeypress="return validarNum(event)" class="answer"></div>
                    </div>
                </div>
                <div class="row-wrapper">
                    <div class="column-wrapper-boton">
                        <input type="submit" value="Actualizar" class="boton" onclick="return validarDatos()">
                    </div>
                </div>
            </form>
                    <%
                                
                            }
                        }
                            rs.close();
                            set.close();
                        
                    }catch(SQLException ed){
                    System.out.println("Error al consultar la tabla");
                    System.out.println(ed.getMessage());
                    }
                        con.close();
                    %>
            <form>
                <input type="text" class="dataF" name="user" value="<%=request.getParameter("username")%>">
                <input type="text" class="dataF" name="idUsu" value="<%=request.getParameter("idUsu")%>">
                    <div class="column-wrapper-boton">
                        <div class="boton"><a href="./login.html">Borrar Cuenta</a></div>
                    </div>
            </form>
        </div>
        <footer>+
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
    <script src="./js/register.js"></script>
</body>
</html>
