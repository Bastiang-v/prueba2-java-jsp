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
                <p>Programacion Java EE: Servlets y JavaServer Pages (JSP) IpChile</p>
            </div>
            <div class="form">
                <form method="get">
                     <input type="text" name="txtUsuario" id="txtUsuario" placeholder="Usuario"/>
                    <input type="text" name="txtPass" id="txtPass" placeholder="Contraseña"/>
                     <button type="submit" name="btnEnviar">Ingresar</button>
                </form>
            </div>
        </div>
        <%--  <div class="login-caja">
      <img src="img/logo.png" class="avatar" alt="Avatar Image">
            <h2>Cuenta Usuario</h2>
            <form method='get'>
                <label for="username">Usuario</label>
                <input type="text" name="txtUsuario" id="txtUsuario" placeholder="Ingrese Usuario"/>
                   <label for="password">Contraseña</label>
                   <input type="text" name="txtPass" id="txtPass" placeholder="Ingresa Contraseña"/>
                   <input type="submit" name="btnEnviar" value="Enviar"/>
                   <a href="#">Recuperar Contraseña</a><br>
                   <a href="#">Registrarse</a>
            </form>
</div>--%>
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
                   <table  border ="4">
                         <tr>
                            <td><h1>Bienvenido</h1></td>
                        </tr>
                        <tr>
                            <td><a href="consulta.jsp">Consulta cliente</a></td>
                        </tr>
                        <tr>
                            <td><a href="insertar.jsp">Insertar cliente</a></td>
                        </tr>
                     </table>
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
