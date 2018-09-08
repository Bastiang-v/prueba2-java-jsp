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
        <h1>Desarrollo Web 1</h1>
        <% 
            session.setAttribute("logeo", null);
            if(request.getParameter("txtUsuario")==null)
            {
        %>
        <div id="contenedor">
            <h1>Login Usuario</h1>
        <table width="100%" border ="1" id="div-login">
            <form method='get'>
                <tr>
                    <td width="678">Usuario</td>
                    <td width="685"><label for ="txtUsuario"></label>
                        <input type="text" name="txtUsuario" id="txtUsuario"/>
                    </td>
                </tr>
                <tr>
                    <td width="678">Clave</td>
                    <td width="685"><label for ="txtPass"></label>
                        <input type="text" name="txtPass" id="txtPass"/>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="btnEnviar" value="Enviar"</td>
                </tr>
            </form>
        </table>
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
                   <table width="100%" border ="1">
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
                }
            }
        %>
    </body>
    <footer>
        <ul>
            <li><a href="">Inicio</a></li>
            <li><a href="http://www.ipchile.cl/">Pagina Instituto</a></li>
            <li><a href="">Pagina de prueba </a></li>
        </ul>
    </footer>
    
</html>
