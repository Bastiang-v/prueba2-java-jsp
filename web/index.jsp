<%-- 
    Document   : index
    Created on : 27-ago-2018, 21:14:38
    Author     : Docente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/cssindex.css"/>
        <title>Desarrollo web</title>
    </head>
    <body>
        <% 
            session.setAttribute("logeo", null);
            if(request.getParameter("txtUsuario")==null)
            {
        %>
        <div class="wrapper">
            <div class="nav">
                <div class="left">
                    <ul>
                        <li><a href="#">Inicio</a></li>
                        <li><a href="#">Projectos</a></li>
                        <li><a href="#">Contacto</a></li>
                    </ul>
                </div>
                 <div class="right">
                    <ul>
                        <li><a href="#">Ingresar</a></li>
                        <li><a href="#">Registro</a></li>
                    </ul>
                </div>
            </div>
            <div class="header">
                <h1>Desarrollo Web 1</h1>
                <p>Programacion Java EE: Servlets y JavaServer Pages (JSP) IpChile San Joaquin</p>
            </div>
            <div class="form">
                <form method="get">
                     <input type="text" name="txtUsuario" id="txtUsuario" placeholder="Usuario"/>
                    <input type="text" name="txtPass" id="txtPass" placeholder="Contraseña"/>
                     <button type="submit" name="btnEnviar">Ingresar</button>
                </form>
            </div>
        </div>
        <%
            }
            else
            {
               BLL.NegocioUsuario auxNego = new BLL.NegocioUsuario();
               DTO.Usuario usuario = new DTO.Usuario();
               usuario.setNombre(request.getParameter("txtUsuario"));
               usuario.setContraseña(request.getParameter("txtPass"));
                if(auxNego.LoginUsuario(usuario).getEstado()==1)
                {
                    session.setAttribute("logeo", "si");
        %>
        <div class="menu">
                            <h1>Bienvenido</h1>
                           <a href="consulta.jsp">Consulta Usuario</a>
                           <a href="insertar.jsp">Insertar Usuario</a>
                           </div>
        <%
                }else{
%>
<h1>Usuario o contraseña Incorrectos</h1>
<%
}
            }
        %>
    </body>
</html>
