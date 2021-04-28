/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.sql.Connection;
import java.sql.DriverManager;



/**
 *
 * @author Manoj
 */
public class DB_connection
{

 public static Connection connetto()
      {
        try 
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryvilla","root","12345678");
            
            
        }
        catch(Exception e)
        {
     System.err.print(e);
        }
        return null;
       }
}
