<%-- 
    Document   : insertar
    Created on : 03-sep-2018, 20:12:24
    Author     : Docente
--%>

<%@page import="BLL.NegocioUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="css/cssindex.css"/>
        <title>Ingresar Usuario</title>
    </head>
    <body>
        <h1>Ingresar Usuario</h1>
        <%
        if( session.getAttribute("logeo")=="si")
        {
            if(request.getParameter("txtNombre")==null &&
                    request.getParameter("txtApellido")==null)
            {
        %>
        <table  width="700" border="3">
            <form method="post" action="">
                <tr>
                    <td>Nombre:</td> 
                    <td>    
                        <input type="text" name="txtNombre" id="txtNombre">
                    </td>
                </tr>
                <tr>
                    <td>Apellido:</td>
                    <td>    
                       <input type="text" name="txtApellido" id="txtApellido">
                    </td>
                </tr>
                <tr>
                    <td>Contraseña:</td>
                    <td>    
                        <input type="password" name="txtPass" id="txtPass">
                    </td>
                </tr>
                <tr>
                    <td>Tipo Usuario:</td>
                    <td>    
                        <select name="id_tipousuario">
                            <option value="1">Docente</option>
                            <option value="2">Estudiante</option>
                            <option value="3">Administrativo</option>
                            <option value="4">Seguridad</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>    
                        <input type="submit" name="btnEnviar" id="btnEnviar" value="Enviar">
                    </td>
                </tr>
            </form> 
        </table>
        <%
            }
            else
            {
                BLL.NegocioUsuario auxNego = new BLL.NegocioUsuario();
                DTO.Usuario auxUsuario = new DTO.Usuario();
                auxUsuario.setNombre(request.getParameter("txtNombre"));
                auxUsuario.setApellido(request.getParameter("txtApellido"));
                auxUsuario.setTipo(request.getParameter("id_tipousuario"));
                auxUsuario.setContraseña(request.getParameter("txtPass"));
                auxNego.InsertarUsuario(auxUsuario);
                %>
                <h1>Registro Insertado</h1>
    <center>
                <a href="index.jsp">Regresar</a>
                </center>
                <%
            }
        }
        else
        {
        %>
        <h1>NO HAY SESION ENCONTRADA</h1>
        <%
        }
        %>
    </body>
</html>
