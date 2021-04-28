/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Manoj
 */
@WebServlet("/RemoveProducts")
public class RemoveProducts extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
         String param=request.getParameter("id");
         System.out.println(param);
          HttpSession session=request.getSession();
         
       List li=((List)session.getAttribute("addToCart"));
       if(li.contains(param))
       {
           int i=li.indexOf(param);
           li.remove(i);
           System.out.println(param);
           session.setAttribute("addToCart", li);
           response.sendRedirect("addtocart.jsp");
       }
      
    }
}
