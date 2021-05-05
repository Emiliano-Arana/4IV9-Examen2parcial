<%-- 
    Document   : agregarProducto
    Created on : May 3, 2021, 7:09:32 PM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./css/StyleNav.css">
        <link rel="stylesheet" href="./css/StyleAdmin.css">
        <link rel="stylesheet" href="./css/estilos.css">
        <script src="https://kit.fontawesome.com/341b72a6e8.js" crossorigin="anonymous"></script>
        <style>
            .response{
                display: flex;
                justify-content: center;
                align-items: center;
            }
        </style>
    <title>Agregar</title>
    </head>
    <body>
    <div class="main-container">
        <nav>
            <div class="BN-I">
                <ul class="Principales">
                    <li id="full"><a class="link" href="index.html">Cerrar Sesion</a></li>
                    <li id="full"><a class="link" href="eliminarProducto.jsp">Eliminar</a></li>
                    <li id="full"><a class="link" href="editarProducto.jsp">Actualizar</a></li>
                </ul>
            </div>
        </nav>
        <div class="body-container">
            <form name="DatosProducto" method="POST" action="" class="formAdd">
                <h1>Agregar Productos</h1>
                <div class="row-wrapper">
                    <div class="column-wrapper">
                        <label>Producto</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" name="err1">
                        <br>
                        <div class="escribir"><div class="icon"><i class="fas fa-ice-cream"></i></div><input type="text" name="producto" onkeypress="return validarProduct(event)" class="answer"></div>
                    </div>
                    <div class="column-wrapper">
                        <label>Precio</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" name="err2">
                        <br>
                        <div class="escribir"><div class="icon"><i class="fas fa-dollar-sign"></i></div><input type="text" name="precio" onkeypress="return validarPrice(event)" class="answer"></div>
                    </div>
                </div>
                <div class="row-wrapper">
                    <div class="column-wrapper">
                        <label>Descuento</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" name="err3">
                        <br>
                        <div class="escribir"><div class="icon"><i class="fas fa-percentage"></i></div><input type="text" name="descuento" onkeypress="return validarNum(event)" class="answer"></div>
                    </div>
                    <div class="column-wrapper">
                        <label>Descripcion</label>
                        <br>
                        <input type="text" readonly="readonly" class="error" name="err4">
                        <br>
                        <div class="escribir"><textarea name="descripcion" class="desc" onkeypress="return validarText(event)"></textarea></div>
                    </div>
                </div>
                <div class="botonCRUD">
                    <input type="submit" value="Agregar" class="boton" onclick="return validarDatos()">
                </div>
            </form>
            <div class="response">
            
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
                    String q = "select * from products";
                    String descripcion,descuento,precio,producto;
                    descripcion = request.getParameter("descripcion");
                    descuento = request.getParameter("descuento");
                    precio = request.getParameter("precio");
                    producto = request.getParameter("producto");
  
                    boolean rep=true;
                            
                    set = con.createStatement();
                    rs = set.executeQuery(q);
                    while(rs.next()){
                        if(rs.getString("producto").equals(producto)){
                            rep = false;
                        }
                    }
                    if(rep){
                        String k = "insert into products(producto, precio, descuento, descripcion) "
                        + "values('"+producto+"', '"+precio+"', '"+descuento+"', '"+descripcion+"')";
                        int registro = set.executeUpdate(k);
                        %>
                        <h1>Registro Exitoso</h1>
                        <%
                    }else{
                            %>
                        <h1>Usuario o Correo ya registrados</h1>
                            <%
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
            </div>
        </div>
        <footer>
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
    <script src="./js/administrador.js"></script>
</body>
</html>
