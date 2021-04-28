<%-- 
    Document   : index
    Created on : 11 Jan, 2021, 1:14:38 PM
    Author     : Manoj
--%>

<%@page import="bean.SignupBean"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="bean.ProductBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="DBO.SignUpDBO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>       
<html>
<head>
<Title>E commerce responsive site</Title>  
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
       <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
       <!-- font awesome -->
    <script src="https://kit.fontawesome.com/6bddb47dad.js" crossorigin="anonymous"></script>
    <link href="productview.css" rel="stylesheet">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
        <!-- slick libary -->
    
</head>
    <body>
     <jsp:include page="header.jsp"></jsp:include>
        
         
          <div class="container-fluid p-0">
             <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
  <ol class="carousel-indicators">
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
    <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="banner1.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="banner3.png" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </a>
</div>				   
 </div>
 </div>
  <!- PRODUCT VIEW START-->
      
      <div class="container">
          <div class="row">
        <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel">
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="row">
        
      
        <%                       
        Blob image=null;
        byte[] imgData=null;
        String product_name;
        String description;
        InputStream r=null;
         String offerpicstr;
         String img;
         int id;
        try{
             Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jewelleryvilla","root","12345678");
            String sqlQuery="SELECT*from product";
            PreparedStatement pr=con.prepareStatement(sqlQuery);
            ResultSet rs=pr.executeQuery();
             SignupBean signup=(SignupBean)session.getAttribute("Signup");
              while(rs.next())
            {
                ProductBean pb=new ProductBean();
          pb.setId(rs.getInt("id"));
        pb.setProduct_name(rs.getString("p_name"));
        pb.setDescription(rs.getString("Discription"));
         String offer_price=rs.getString("offer_price");
         String actual_price=rs.getString("actual_price");
          pb.setPic1(rs.getBlob("f_pic"));
imgData = pb.getPic1().getBytes(1,(int)pb.getPic1().length());
String encodeImage=Base64.getEncoder().encodeToString(imgData);
 img="data:image/jpg;base64,"+encodeImage;
                                        %>
           
                        <div class="col-sm-3" style="margin-top: 10px">
                            <div class="col-item">
                                <div class="photo"> 
                                     <% out.println("<img src="+ img +" Class=img-responsive alt=a>"); %>
                                </div>
                                <div class="info">
                                    <div class="row">
                                        <div class="price col-md-6">
                                      <% out.println("<a href=productdetails.jsp?id="+ pb.getId() +" style=text-decoration:none ><h5>"+pb.getProduct_name()+"</h5></a>");%>
                                            <h5 class="price-text-color">Rs.
                                               <%  out.println(offer_price);%></h5>
                                        </div>
                                        <div class="rating hidden-sm col-md-6">
                                            <i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                            </i><i class="price-text-color fa fa-star"></i><i class="price-text-color fa fa-star">
                                            </i><i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="separator clear-left">
       
                                        <p class="btn-details">
                                        <!-- <button class="btn btn-primary">Buy</button></p>-->
                                        <% if(session.getAttribute("Signup")!=null) 
                                      {%>
                                      <!--<a href="CheckoutDetails.jsp?amount=<%=offer_price%>&firstname=<%= signup.getName() %>&email=<%= signup.getGmail()%>&phone=<%= signup.getPhone_no()%>&productinfo=<%= pb.getId()%>&surl=www.google.com&furl=www.facebook.com" class="btn btn-success">buy</a>-->
                                 <a href="CheckoutDetails.jsp?amount=<%=offer_price%>&firstname=<%= signup.getName() %>&email=<%= signup.getGmail()%>&phone=<%= signup.getPhone_no()%>&productinfo=<%= pb.getId()%>&surl=demohome.jsp &furl=SuccessPayment.jsp"><button class="btn btn-primary">Buy</button></a>
                                        <%
                                 }
                              else{
                               %>
                               <a href="CheckoutDetails.jsp?amount=<%=offer_price%>&productinfo=<%= pb.getId()%>&surl=demohome.jsp &furl=SuccessPayment.jsp"><button class="btn btn-primary">Buy</button></a>
                               <%}%>
                                   
                                        
					<p class="btn-add">
                                            <button class="btn btn-primary" onclick="addtoCart('<%out.print(pb.getId());%>')"><i class="fas fa-cart-plus"></i> Cart</button></p>
                                    </div>
                                    <div class="clearfix">
                                    </div>
                                </div>
                            </div>
                        </div>
     
             <%
     }
        }
         catch(Exception e)
        { out.println(e);}
             
             %>    
                    </div>
                   
                </div>
                                       
            </div>
        </div>
    </div>
</div>
         <div><h1>i am product section</h1></div>
         
            
         <jsp:include page="footer.jsp"></jsp:include>
   <!--footer close-->
   <!-- $(".superid").text(data);-->
   <script>
       
       function addtoCart(id)
       {
         $.post("addtoCartController", {
             id: id
         }, function (data, status) {
            
             alert(data);
         });
       }
   </script>
  
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
 </script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous">

<!--header close-->
 </body>

</html>
