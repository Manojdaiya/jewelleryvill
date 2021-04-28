/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Manoj
 */

public class addtoCartController extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
        String param=request.getParameter("id");
        
        List li;
        HttpSession session=request.getSession();
        
        if(session.getAttribute("addToCart")==null)
        {
           li= new ArrayList();
           li.add(param);
           session.setAttribute("addToCart", li);
           out.println("Successfully Added in Cart");
        }
        else
        {
            li=(List)session.getAttribute("addToCart");
            if(!li.contains(param))
            {
                li.add(param);
                 out.println("Successfully Added in Cart");
            }
            else{
           out.println("Product Exist in Cart"); }
            session.setAttribute("addToCart", li);
        }
      // out.println(li.size());  
    }
}
