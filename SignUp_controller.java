/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBO.SignUpDBO;
import bean.SignupBean;
import common.DB_connection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import security.BCrypt;

/**
 *
 * @author Manoj
 */
public class SignUp_controller extends HttpServlet {

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
           
       SignupBean s=new SignupBean();
       PrintWriter out = response.getWriter();
       String phoneno=request.getParameter("Phone_no");
      // phoneno.length();
       
        if(!request.getParameter("Name").equals("") && !request.getParameter("Name").equals(" "))
       {
         s.setName(request.getParameter("Name"));
       }
       else
       {
         out.println("name not valid");
       }
       if(!request.getParameter("Gmail").equals("") && !request.getParameter("Gmail").equals(" "))
       {
         s.setGmail(request.getParameter("Gmail"));
       }
       else
       {
         out.println("Gmail not valid");
       }
        if(phoneno.length()==10)
       {
         s.setPhone_no(request.getParameter("Phone_no"));
       }
       else
       {
         out.println("Phone_no not valid");
         
       }
     
         if(!request.getParameter("Password").equals("") && !request.getParameter("Password").equals(" "))
       {
         s.setPassword( BCrypt.hashpw(request.getParameter("Password"), BCrypt.gensalt(12)));
        
       }
       else
       {
         out.println("Password not valid");
       }
          if(request.getParameter("cpassword").length()>=6 && !request.getParameter("cpassword").equals(" "))
       {
         s.setCpassword(request.getParameter("cpassword"));
         
       }
       else
       {
         out.println("Check Password and Conform Password");
       }
     
         
      if(request.getParameter("Password").equals(request.getParameter("cpassword")) &&request.getParameter("Password").length()>=6 )
      {
          SignUpDBO sd=new SignUpDBO();
           Boolean bool=sd.InsertIntoDB(s);
           if(bool)
           {
           response.sendRedirect("demohome.jsp");
           } 
           else{
             RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
               rd.include(request,response);
              }
      }else
      { 
          out.println("password does not macth");
        
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
