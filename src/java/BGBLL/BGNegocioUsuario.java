package BGBLL;

import BGDTO.BGUsuario;
import BGConexion.BGConexion;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;
import javax.swing.JOptionPane;

public class BGNegocioUsuario {
    
    BGConexion conectar;
    
    public BGNegocioUsuario()
    {
        conectar = new BGConexion("desarrolloweb1");
        
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
                BGUsuario auxUsuario = new BGUsuario();
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
    public void InsertarUsuario(BGUsuario usuario)
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
    public BGUsuario LoginUsuario(BGUsuario usuario) {
        Statement t = conectar.crearSentencia();
        ResultSet resultado = null;
        try
        {
            BGUsuario us = new BGUsuario();
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

