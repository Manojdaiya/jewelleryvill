
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize=16177215)

/**
 *
 * @author Manoj
 */
public class Storedata extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String Product_Name=request.getParameter("product_name");
        String Product_description=request.getParameter("description");
        String Product_category=request.getParameter("category");
        int Offer_Price=Integer.parseInt(request.getParameter("offer_price"));
        int Actual_Price=Integer.parseInt(request.getParameter("actual_price"));
        Part Product_pic1=request.getPart("first_photo");
        Part Product_pic2=request.getPart("second_photo");
        Part Product_pic3=request.getPart("third_photo");
        InputStream pic1=Product_pic1.getInputStream();
        InputStream pic2=Product_pic2.getInputStream();
        InputStream pic3=Product_pic3.getInputStream();
        PrintWriter out = response.getWriter();
         String errors[]=new String[6];
        response.setContentType("text/html;charset=UTF-8");
        try {
             Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryvilla","root","12345678");
             PreparedStatement ps=con.prepareStatement("insert into product(p_name,p_categories,Discription,actual_price,offer_price,f_pic,s_pic)values(?,?,?,?,?,?,?)");
             
            if(!Product_Name.equals(" ") && !Product_Name.equals("") )
            {
                ps.setString( 1,Product_Name);
            }
            else
            {
                errors[0]="Please fill the product name";
            }
             if(!Product_description.equals(" ") && !Product_description.equals("") )
            {
                ps.setString( 3,Product_description);
            }
            else
            {
                errors[1]="Please fill the product Description";
            }
             if(!Product_category.equals(" ") && !Product_category.equals("") )
            {
                ps.setString( 2,Product_category);
            }
            else
            {
                errors[2]="Please fill the select Category";
            }
              if(!request.getParameter("offer_price").equals(" ") && !request.getParameter("offer_price").equals(""))
            {
                ps.setInt( 4,Offer_Price);
            }
            else
            {
                errors[3]="Please fill the select Category";
            }
            
            if(!request.getParameter("actual_price").equals(" ") && !request.getParameter("actual_price").equals(""))
            {
                ps.setInt( 5,Actual_Price);
            }
            else
            {
                errors[4]="Please fill the select Category";
            }
             
             if(pic1!=null)
            {
                ps.setBlob( 6,pic1);
            }
            else
            {
                errors[5]="Please upload image";
            }
            if(pic2!=null)
            {
                ps.setBlob(7,pic2);
            }
            else
            {
                 ps.setBlob( 7,pic2);   
            }
           
          //  ps.setBlob(8,pic3);
            
             int row=ps.executeUpdate();
             if(row>0)
             {
              out.println("file uploaded and saved into database");
            }
             else
             {
               out.println("failed");  
             }
             
            
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Storedata</title>");            
            out.println("</head>");
            out.println("<body>");
               if(row>0)
             {
              out.println("file uploaded and saved into database");
            }
             else
             {
               out.println("failed");  
             }
            out.println("<h1>Servlet Storedata at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        catch(Exception e)
        {
            out.print(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
