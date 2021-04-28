/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DBO.SignUpDBO;
import bean.LoginBean;
import bean.SignupBean;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import security.BCrypt;

/**
 *
 * @author Manoj
 */
public class login_Controller extends HttpServlet {

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
        String errors[]=new String[2];
        SignUpDBO sd=new SignUpDBO();
        SignupBean sb=new SignupBean();
        PrintWriter out = response.getWriter();
     
            if(!request.getParameter("Gmail").equals("") && !request.getParameter("Gmail").equals(" "))
       {
         sb.setGmail(request.getParameter("Gmail"));
       }
             else
       {
         errors[0]="Gmail is not valid";
       }
              if(!request.getParameter("Password").equals("") && !request.getParameter("Password").equals(" "))
          {
         sb.setPassword(request.getParameter("Password"));
        
         }
       else
       {
         errors[1]="Password not valid";
       }
             SignupBean s= sd.login(sb);
        if(s!=null)
        {
            HttpSession session=request.getSession();
                    session.setAttribute("Signup",s);
           
            response.sendRedirect("demohome.jsp");
                
             
        }
        else
        {
           //  response.sendRedirect("fail.jsp");
            out.println("Username or Password incorrect!!");
              RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
               rd.include(request,response);  
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
