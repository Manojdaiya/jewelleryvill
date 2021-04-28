<%-- 
    Document   : productdetails
    Created on : 16 Feb, 2021, 12:17:25 PM
    Author     : Manoj
--%>

<%@page import="java.util.Base64"%>
<%@page import="java.sql.Blob"%>
<%@page import="DBO.SignUpDBO"%>
<%@page import="bean.ProductBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
  <head>
     <title>eCommerce Product Detail</title>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <link href="productview.css" rel="stylesheet">
	  <script src="https://kit.fontawesome.com/6bddb47dad.js" crossorigin="anonymous"></script>
  </head>
 <body>
      <jsp:include page="header.jsp"></jsp:include>
      <%
         
          SignUpDBO sb=new SignUpDBO();
          int Id=Integer.parseInt(request.getParameter("id")); 
          sb.oneItem(Id);
          ProductBean pb=sb.oneItem(Id);
         
          String img2;
          //image encode pic1
           byte[] imagedata=pb.getPic1().getBytes(1,(int)pb.getPic1().length());
          String encodeImage=Base64.getEncoder().encodeToString(imagedata);
          String img="data:image/jpg;base64,"+encodeImage;
          //second pic encode
          
           byte[] imagedata2=pb.getPic2().getBytes(1,(int)pb.getPic2().length());
          String encodeImage2=Base64.getEncoder().encodeToString(imagedata);
          img2="data:image/jpg;base64,"+encodeImage;  
          //third pic encode
          /*
         if(pb.getPic2()!=null)
         {
          byte[] imagedata3=pb.getPic3().getBytes(1,(int) pb.getPic3().length());
          out.println(imagedata3);
          String encodeimage3=Base64.getEncoder().encodeToString(imagedata3);
          String img3="data:image/jpg;bae64,"+encodeimage3;
         }
          */
      %>
      
<!--Section: Block Content-->
<section class="mb-5">

  <div class="row">
    <div class="col-md-6 mb-4 mb-md-0">

      <div id="mdb-lightbox-ui"></div>

      <div class="mdb-lightbox">

        <div class="row product-gallery mx-1">

          <div class="col-12 mb-0">
         
              
          <div class="container-fluid p-0">
              <!-- <div class="site-slider">-->
                  
 <div id="carouselExampleIndicators" class="carousel slide p-md-5" data-interval="false" >

  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%out.println(img);%>" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
          <img src="<%out.println(img2);%>"class="d-block w-100" alt="...">
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
<!-- </div>-->
       
          </div>
         
        </div>

      </div>

    </div>
    <div class="col-md-6">

      <h1 class="mx-2 color-primary" ><%out.println(pb.getProduct_name());%></h1>
           <div class="table-responsive mx-2">
        <table class="table table-sm table-borderless mb-0">
          <tbody class= "mx-2" >
         <tr >
			 <td class="pl-0 pb-0 w-25"><strong><h2>Rs.<%out.println(pb.getOffer_price());%></strong> <span  style="text-decoration: line-through;text-decoration-color: tomato"><%out.println(pb.getActual_price());%></span><span class="mx-3" style="color:lightgreen"><%out.println((pb.getOffer_price()/pb.getActual_price())*100);%>%</span></td>
            </tr>
          </tbody>
        </table>
      </div>
		
     <!-- <p><span class="mr-1 mx-2"><strong>Rs.12000</strong></span></p> -->
      <p class="pt-1 mx-2">Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam, sapiente illo. Sit
        error voluptas repellat rerum quidem, soluta enim perferendis voluptates laboriosam. Distinctio,
        officia quis dolore quos sapiente tempore alias.</p>
      <div class="table-responsive">
        <table class="table table-sm table-borderless mb-0">
          <tbody>
         <tr>
              <td class="pl-0 pb-0 w-25">Quantity</td>
            </tr>
            <tr>
              <td class="pl-0">
                <div class="def-number-input number-input safari_only mb-0">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepDown()"
                    class="minus"></button>
                  <input class="quantity" min="0" name="quantity" value="1" type="number">
                  <button onclick="this.parentNode.querySelector('input[type=number]').stepUp()"
                    class="plus"></button>
                </div>
              </td>
        
            </tr>
          </tbody>
        </table>
      </div>
      <hr>
  
      <a href="CheckoutDetails.jsp?productinfo=<%= pb.getId()%> &amount=<%= pb.getOffer_price()%>&surl=www.google.com &furl=www.facebook.com"" class="btn btn-primary btn-md mr-1 mb-2 mx-2">Buy now</a>
      <button type="button" class="btn btn-light btn-md mr-1 mb-2" onclick="addtoCart('<%out.print(Id);%>')">
		  <i class="fas fa-shopping-cart pr-2"></i>Add to cart</button>
		 <div>
	  <img src="banner-secure-payment.jpg" class="img-responsive w-100" alt="...">
	  </div>
    </div>
  </div>
	<hr>
</section>
	 
	 <!--Ralated product-->
	 <div class="container-fluid">
		 <div>
			 <h2 class="mx-2">Trending <b>Products</b></h2>
		 </div>

    <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-6" style="margin-top: 10px">
			<img src="pic2.jpg" class="img-responsive w-100" alt="1">
			<h3> my fav necklace</h3>
			<strong>Rs.11999</strong> <span  style="text-decoration: line-through;text-decoration-color: tomato"> Rs.15990</span><span class="mx-3" style="color:lightgreen">25% 0ff </span>
			<table>
			<tr>
				<td><button class="btn btn-primary">Buy</button></td>
				<td><button class="btn btn-primary m-2" onclick="addtoCart('<%out.print(pb.getId());%>')"> <i class="fas fa-shopping-cart pr-2"></i>Add to cart</button></td>
			</tr>
			</table>
          
        </div>
        
		<div class="col-md-3 col-sm-6 col-xs-6" style="margin-top: 10px">
			<img src="pic2.jpg" class="img-responsive w-100" alt="2">
			<h3> my fav necklace</h3>
			<h2> my fav necklace</h2>
          
        </div>
		<div class="col-md-3 col-sm-6 col-xs-6" style="margin-top: 10px">
			<img src="pic5.jpg" class="img-responsive w-100" alt="3">
			<h3> my fav necklace</h3>
          
        </div>
		<div class="col-md-3 col-sm-6 col-xs-6" style="margin-top: 10px">
			<img src="pic5.jpg" class="img-responsive w-100" alt="3">
			<h3> my fav necklace</h3>
        </div>
       
    </div>
</div>
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
<!--Section: Block Content-->	   
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
 </script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous">
  </body>
</html>

