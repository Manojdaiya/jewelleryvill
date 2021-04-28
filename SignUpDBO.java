  /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBO;


import bean.ProductBean;
import bean.SignupBean;
import bean.ValidationBean;
import java.io.InputStream;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import security.BCrypt;


/**
 *
 * @author Manoj
 */
public class SignUpDBO
{
    /*
         Connection con;
       
     public SignUpDBO(Connection con)
        {
            this.con=con;
        }
*/
     public Boolean InsertIntoDB(SignupBean s) 
     {
         try
         {
             Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryvilla","root","12345678");
            String sql="insert into customer_details(U_Name,U_Email,U_Password,U_phoneNO)values('"+s.getName()+"','"+s.getGmail()+"','"+s.getPassword()+"','"+s.getPhone_no()+"') " ;
            Statement st=con.createStatement();
            st.executeUpdate(sql);
            return true;
         }
         catch(Exception e)
         {
         System.err.print(e);
         }
         return false;
     }
     
     public Boolean InsertProduct(ProductBean s) 
     {
         try
         {
             Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryvilla","root","12345678");
            String sql="insert into product(p_name,p_categories,Discription,offer_price,actual_price,f_pic,s_pic,t_pic,fth_pic)values('"+s.getProduct_name()+"','"+s.getProduct_category()+"','"+s.getDescription()+"','"+s.getOffer_price()+"','"+s.getActual_price()+"','"+s.getPic1()+"','"+s.getPic2()+"','"+s.getPic3()+"','"+s.getPic4()+"') " ;
            Statement st=con.createStatement();
            st.executeUpdate(sql);
            con.close();
            return true;
         }
         catch(Exception e)
         {
         System.err.print(e);
         }
         return false;
     }
    public SignupBean login(SignupBean s)
    {
        try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryvilla","root","12345678");
         String sql="select* from customer_details where U_Email='"+s.getGmail()+"'";
          SignupBean sb=new SignupBean();
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery(sql);
          while(rs.next())
          {
             sb.setName(rs.getString("U_Name"));
              sb.setGmail(rs.getString("U_Email"));
              sb.setPassword(rs.getString("U_Password")); 
               sb.setPhone_no(rs.getString("U_phoneNO"));
               //sb.setId(rs.getInt("U_id"));
          }
          Boolean b=BCrypt.checkpw(s.getPassword(),sb.getPassword());
          if(b)
          {
              return sb;
          }
          else
          {
             System.err.print("bean is null");
             }
        }
        catch(Exception e)
        {
            System.out.println(e);
        }
        return null;
    }
    public ProductBean oneItem(int id)
    {
          try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryvilla","root","12345678");
         String sql="select * from product where ID ="+ id ;
         ProductBean pb=new ProductBean();
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery(sql);
          while(rs.next())
          {
              pb.setId(rs.getInt("ID"));
              pb.setProduct_name(rs.getString("p_name"));
              pb.setDescription(rs.getString("Discription"));
              pb.setProduct_category(rs.getString("p_categories"));
              pb.setOffer_price(rs.getInt("offer_price"));
              pb.setActual_price(rs.getInt("actual_price"));
              pb.setPic1(rs.getBlob("f_pic"));
              pb.setPic2(rs.getBlob("s_pic"));
              //pb.setPic3(rs.getBlob("t_pic"));
              //pb.setPic4(rs.getBlob("fth_pic"));
              
          }
          return pb;
          }
          catch(Exception e)
          {
             System.out.println(e); 
          }
        
        return null;
    }
    
    public boolean hasEmailid(String gmail)
    {
         try{
         Class.forName("com.mysql.jdbc.Driver");
         Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryvilla","root","12345678");
         String sql="select * from customer_details";
         Statement st=con.createStatement();
         ResultSet rs=st.executeQuery(sql);
          while(rs.next())
          {
              String gmailcl=rs.getString("U_Email");
              if(gmailcl.equals(gmail))
              {
                  System.out.println(true);
                  return true;
              }
          }
         }
         catch(Exception e)
         {
             System.out.println(e);
         }  
         System.out.println(false);
   return false;
    }
    /*
    public static void main(String[] args)
    {
        SignUpDBO sb=new SignUpDBO();
        sb.hasEmailid("mkdaiya12@gmail.com");
    }
   */
    
}