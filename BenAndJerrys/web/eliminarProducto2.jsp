<%-- 
    Document   : eliminarProducto2
    Created on : May 3, 2021, 7:30:32 PM
    Author     : Emiliano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/StyleNav.css">
        <link rel="stylesheet" href="./css/StyleAdmin.css">
        <link rel="stylesheet" href="./css/estilos.css">
        <script src="https://kit.fontawesome.com/341b72a6e8.js" crossorigin="anonymous"></script>
    <title>Eliminar</title>
    </head>
    <body>
        <div class="main-container">
        <nav>
            <div class="BN-I">
                <ul class="Principales">
                    <li id="full"><a class="link" href="index.html">Cerrar Sesion</a></li>
                    <li id="full"><a class="link" href="administrar.html">Agregar</a></li>
                    <li id="full"><a class="link" href="editarProducto.jsp">Actualizar</a></li>
                </ul>
            </div>
        </nav>
        <div class="body-container">
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
                    int id = Integer.parseInt(request.getParameter("id"));
                    String q = "delete from products where id="+id;
                    
                    set = con.createStatement();
                    
                    int borrar = set.executeUpdate(q);
                    set.close();    
                
                }catch(SQLException ed){
                    System.out.println("Error al eliminar el dato");
                    System.out.println(ed.getMessage());
                     %>
                    
                    <h1>Registro No es posible Borrarlo con Exito</h1>
                    
                    <% 
                
                }
                con.close();
            
    %>
            <div class="productos">
                <table>
                    <tr class="head">
                        <td>ID</td>
                        <td>Producto</td>
                        <td>Precio</td>
                    </tr>
                    
                    <%
                    
                    try{
                        Class.forName(driver);
                        con = DriverManager.getConnection(url, userName, password);
                        try{
                            String q = "select * from products";
                            
                            set = con.createStatement();
                            rs = set.executeQuery(q);
                            while(rs.next()){
                    %>
                    
                    <tr>
                        <form action="eliminarProducto2.jsp" name="eliminar" method="POST">
                            <td id="id"><input value="<%=rs.getInt("id")%>" class="id" readonly="readonly" name="id"></td>
                            <td id="producto"><%=rs.getString("producto")%></td>
                            <td id="precio">$<%=rs.getString("precio")%></td>
                            <td><input type="submit" value="Eliminar" class="tableButton"></td>
                        </form>
                    </tr>
                    
                    <%
                                
                                
                        }
                            rs.close();
                            set.close();
                        
                    }catch(SQLException ed){
                    System.out.println("Error al consultar la tabla");
                    System.out.println(ed.getMessage());
                    %>
            <h1>Error el recurso de la consulta no esta disponible</h1>
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
                </table>
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
    </body>
</html>
