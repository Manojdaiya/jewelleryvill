<%-- 
    Document   : addtocart
    Created on : 19 Feb, 2021, 2:15:14 PM
    Author     : Manoj
--%>

<%@page import="bean.SignupBean"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<%@page import="bean.ProductBean"%>
<%@page import="DBO.SignUpDBO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ListIterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
   
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 col-md-12 col-md-offset-1">
            <table class="table table-hover ml-2">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
               <% 
                   SignupBean signup=(SignupBean)session.getAttribute("Signup");
                   if(session.getAttribute("addToCart")!= null)
                   {
                   ListIterator li=((List)session.getAttribute("addToCart")).listIterator();
                   SignUpDBO sb=new SignUpDBO();
                   int Total=0;
                   String ids="";
                   int id;
                   ProductBean pb;
                   while(li.hasNext())
                   {
                       id=Integer.parseInt((String)li.next());
                       pb=sb.oneItem(id);   
                      Total+=pb.getOffer_price();
                      ids+=pb.getId()+",";
               %>
                    
              
                <tbody>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <%
                                byte[] imgData = pb.getPic1().getBytes(1,(int)pb.getPic1().length());
             String encodeImage=Base64.getEncoder().encodeToString(imgData);
                      String  img="data:image/jpg;base64,"+encodeImage;
                            %>
                           <%out.println("<a class=thumbnail pull-left href=#> <img class=media-object src="+img+" style=width:100px; height:100px></a>");%>
                            <div class="media-body">
                               <% out.println("<h4 class=media-heading><a href=# style=text-decoration:none >"+pb.getProduct_name()+"</a></h4>"); %>
                                <h5 class="media-heading"></h5>
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center" name="QTN">
                        <input type="number" class="form-control" value="1" min=1>
                        </td>
                       <td class="col-sm-1 col-md-1 text-center"><strong><%out.println(+pb.getOffer_price());%></strong></td>
                        <td class="col-sm-1 col-md-1 text-center">Rs.5000</strong></td>
                        <td class="col-sm-1 col-md-1">
                           
                            <a href="RemoveProducts?id=<%out.println(pb.getId());%>" class="btn btn-danger" method="post">
                               Remove
                            <a>
                </td>
                    </tr>
                    <%
                        }
                  
                    %>
                
                    <tr>
                        <td>  </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong><h6>Rs.<%out.print(Total);%></h6></strong></h5></td>
                    </tr>
                  
                    <tr>
                        <td><h6>Including all texs   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>Rs.<%out.print(Total);%></strong></h3></td>
                    </tr>
                    <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </button></td>
                        
                        
                            <% if(session.getAttribute("Signup")!=null) 
                            {%>
                            <td>
                            <a href="CheckoutDetails.jsp?amount=<%= Total%>&firstname=<%= signup.getName() %>&email=<%= signup.getGmail()%>&phone=<%= signup.getPhone_no()%>&productinfo=<%= ids%>&surl=demohome.jsp&furl=SuccessPayment.jsp" class="btn btn-success">
                                Checkout <span class="glyphicon glyphicon-play"></span>
                        </a> 
                              </td>  
                            <%
                            }
                              else{
                               %>
                                <td>
                        <button type="button" class="btn btn-success" onclick="alertbox()">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Checkout
                        </button>
                                </td>
                            <%
                                }
                            %>
                        
                    </tr>
                    
                </tbody>
                 <%
                        }else{
                    %>
                    <h1>opps,cart is empty</h1>
                    <%}%>
            </table>  
                          
                <script>
                       function alertbox()
                          {
                            alert("Please Login first to checkout");
                          }
                </script>    
        </div>
    </div>
</div>
    </body>
</html>
