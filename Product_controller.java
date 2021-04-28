/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBO.SignUpDBO;
import bean.ProductBean;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import sun.misc.IOUtils;
@MultipartConfig(maxFileSize=16177215)
/**
 *
 * @author Manoj
 */
public class Product_controller extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String errors[]=new String[6];
        ProductBean pb=new ProductBean();
        SignUpDBO sb=new SignUpDBO();
        PrintWriter out = response.getWriter();
        Part pic1,pic2,pic3,pic4;
        InputStream inputStream=null;
        pic1=request.getPart("first_photo");
       if(!request.getParameter("product_name").equals("") && !request.getParameter("product_name").equals(" "))
       {
         pb.setProduct_name(request.getParameter("product_name"));
       }
       else
       {
         errors[0]="Product name is not valid";
       }
        if(!request.getParameter("description").equals("") && !request.getParameter("description").equals(" "))
       {
         pb.setDescription(request.getParameter("description"));
       }
       else
       {
         errors[1]="Description is not valid";
       }
         if(!request.getParameter("category").equals("") && !request.getParameter("category").equals(" "))
       {
         pb.setProduct_category(request.getParameter("category"));
       }
       else
       {
         errors[2]="please select product Category";
       }
        if(!request.getParameter("offer_price").equals("") && !request.getParameter("offer_price").equals(" "))
       {
         pb.setOffer_price((Integer.parseInt(request.getParameter("offer_price"))));
       }
       else
       {
         errors[2]="Price can not be empty";
       }
         if(!request.getParameter("actual_price").equals("") && !request.getParameter("actual_price").equals(" "))
       {
         pb.setActual_price((Integer.parseInt(request.getParameter("actual_price"))));
       }
         
         if(request.getPart("first_photo")!=null)
       { 
          InputStream s=request.getPart("first_photo").getInputStream();
          ByteArrayOutputStream buffer = new ByteArrayOutputStream();
          int nRead;
          byte[] data = new byte[16384];
          while ((nRead = s.read(data, 0, data.length)) != -1) {
             buffer.write(data, 0, nRead);
              }
               
          if(s!=null)
          {
           
          }
        
       }
         else
         {
             errors[3]="please enter a pic";
         }
         /*
        if(request.getPart("second_photo")!=null)
       {
           
         pb.setPic2(request.getPart("second_photo"));
       }
         if(request.getPart("third_photo")!=null)
       {
         pb.setPic3(request.getPart("third_photo"));
       }
          if(request.getPart("four_photo")!=null)
       {
         pb.setPic4(request.getPart("four_photo"));
       }
         */
     boolean bool=sb.InsertProduct(pb);
     if(bool)
     {
         System.out.println("product inserted successfully");
     }
     else
     {
          System.out.println("product inserted failed");
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
