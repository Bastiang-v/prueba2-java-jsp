/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BGConexion;

//import com.mysql.jdbc.Connection;
import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author educacion
 */
public class BGConexion {
       Connection conn;
   public BGConexion(String baseDatos)
   {
       verificar();
       conectarse(baseDatos);
   }
   
   public String verificar()
   {
       try
       {
           Class.forName("com.mysql.jdbc.Driver");
           return "Exito";
       }
       catch(ClassNotFoundException e)
       {
           return "Falta el conector";
       }
   }
   public String conectarse(String baseDatos)
   {
       try
       {
           conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+baseDatos,"root","");
           return "exito";
       }
       catch(SQLException e)
       {
           return "Servidor no encontrado";
       }
   }
   public Statement crearSentencia()
   {
    try
       {
           return conn.createStatement();
       }
       catch(SQLException e)
       {
          return null;
       }
   }
}