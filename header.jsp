<%-- 
    Document   : header
    Created on : 11 Jan, 2021, 11:22:46 AM
    Author     : Manoj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
       <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
       <!-- font awesome -->
    <script src="https://kit.fontawesome.com/6bddb47dad.js" crossorigin="anonymous"></script>
    
    <link href="headerstyle.css" rel=stylesheet>
    
        <!-- slick libary -->
    </head>
    <body>
        <!-- header -->
        <header>
            <div class="container">
                <div class="row">
                    
                    <div class="col-md-4 col-sm-12 col-12">
                        <div class="btn-group">
                            <button class="btn border dropdown-toggle my-md-4 my-2"
                                    data-toggle="dropdown"
                                    aria-haspopup="true"
                                    aria-expanded="false">
                                INR
                            </button>
                            <div class="dropdown-menu">
                                <a href="#" class="dropdown-item"> INR-RUPEES</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 col-12 text-center">
                        <h1 class="my-md-3 site-title">JewelleryVilla</h1>
                    </div>
                    <%if(session.getAttribute("Signup")==null){%>
                    <div class="col-md-4 col-12 text-right">
                        <p class="my-md-4 col-14 header-links"> 
                        <a href="login.jsp" class="px-2">Sign In</a>
                        <a href="signup.jsp" class="px-1">Create an Account</a>
                        </p>
                    </div>
                    <%}%>
                </div>
            </div>
            <div class="container-fluid p-0">
           <nav class="navbar navbar-expand-lg navbar-light bg-light">
  
   
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="demohome.jsp">HOME</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">PRODUCT</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">FEATURE</a>
        </li>
           <li class="nav-item">
          <a class="nav-link" href="#">POLICY</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">ABOUT US</a>
        </li>
      </ul>
    </div>
                <div class="navbar-nav">
     <li class="nav-item border rounded-circle mx-2 search-icon">
          <i class="fas fa-search p-2"></i>
     
     </li>   
     <li class="nav-item border rounded-circle mx-2 basket-icon">
          <a href="addtocart.jsp" style="text-decoration: none;color: black"> <i class="fas fa-shopping-basket p-2"></i></a>
     
     </li>  
                
</div>
</nav>           
 </div>
        </header>
        
	
        
    </body>
</html>
