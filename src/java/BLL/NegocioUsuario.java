package BLL;

import Conexion.*;
import DTO.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.swing.JOptionPane;

public class NegocioUsuario {
    
    Conexion conectar;
    
    public NegocioUsuario()
    {
        conectar = new Conexion("desarrolloweb1");
        
    }
    
    public ArrayList getCliente()
    {
        ArrayList auxListaCliente = new ArrayList();
        Statement t = conectar.crearSentencia();
        ResultSet resultado = null;
        try
        {
         resultado = t.executeQuery("SELECT * from usuario");
              while(resultado.next())
            {
                Usuario auxUsuario = new Usuario();
                auxUsuario.setId(resultado.getInt("id_usuario"));
                auxUsuario.setNombre(resultado.getString("nombre"));
                auxUsuario.setApellido(resultado.getString("apellido"));
                auxUsuario.setTipo(resultado.getString("id_tipousuario"));
                auxListaCliente.add(auxUsuario);
            }
        }
        catch( Exception ex)
        {
            JOptionPane.showMessageDialog(null, "error de comando consulta SELECT"+ ex.getMessage());
        }
        return auxListaCliente;
    }
    public void InsertarUsuario(Usuario usuario)
    {
        Statement t = conectar.crearSentencia();
        try{
             int resultado = t.executeUpdate("insert into usuario (nombre,apellido,contraseña,estado,id_tipousuario) "
                + "values('"+usuario.getNombre()+"','"+usuario.getApellido()+"',md5('"+usuario.getContraseña()+"'),1,'"+usuario.getTipo()+"')");
        }catch( Exception ex)
        {
            JOptionPane.showMessageDialog(null, "error de comando consulta SELECT"+ ex.getMessage());
        }
        
          
   
}
    public Usuario LoginUsuario(Usuario usuario) {
        Statement t = conectar.crearSentencia();
        ResultSet resultado = null;
        try
        {
            Usuario us = new Usuario();
            resultado = t.executeQuery("select * from usuario where nombre='"+usuario.getNombre()+"' and contraseña=md5('"+usuario.getContraseña()+"')");
            while(resultado.next())
            {
                us.setId(resultado.getInt("id_usuario"));
                us.setNombre(resultado.getString("nombre"));
                us.setApellido(resultado.getString("apellido"));
                us.setTipo(resultado.getString("id_tipousuario"));
                us.setEstado(resultado.getInt("estado"));
            }
            return us;
        }
        catch(SQLException e)
        {
         return null;
        }
    }

            

}

