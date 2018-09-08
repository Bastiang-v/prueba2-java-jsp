<%-- 
    Document   : consulta
    Created on : 06-sep-2016, 19:01:28
    Author     : educacion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="css/cssindex.css"/>
        <title>Consulta Usuarios</title>
    </head>
    <body>
        <h1>Consulta Usuario</h1>
        <%
        if( session.getAttribute("logeo")=="si"){    
        BLL.NegocioUsuario auxNego = new BLL.NegocioUsuario();
        out.println("<table border=\"1\"><tr><td>Código</td><td>Nombre</td><td>Apellido</td><td>Tipo</td>");
        
        java.util.Iterator iter = auxNego.getCliente().iterator();
        
        while(iter.hasNext())
        {
            DTO.Usuario auxUsuarios = new DTO.Usuario();
            auxUsuarios = (DTO.Usuario) iter.next();
            
            out.println("<tr>");
            out.println("<td>" + auxUsuarios.getId()+ "</td>");
            out.println("<td>" + auxUsuarios.getNombre() + "</td>");
            out.println("<td>" + auxUsuarios.getApellido() + "</td>");
            if((auxUsuarios.getTipo()).equals("1"))
            {
                out.println("<td>Docente</td>");
            } 
            else
            {
                out.println("<td>Estudiante</td>");
            }  
            out.println("</tr>");
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
