<%-- 
    Document   : login
    Created on : 11 Jan, 2021, 1:20:39 PM
    Author     : Manoj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
             <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>login</title>
		<link href="loginstyle.css" rel=stylesheet>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

		<script src="https://kit.fontawesome.com/6bddb47dad.js" crossorigin="anonymous"></script>
		
	</head>
	<body> 
  
            <jsp:include page="header.jsp"></jsp:include>
           <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="active"> Sign In </h2>
	  <h2 class="inactive underlineHover"><a href="signup.jsp" style="text-decoration: none; color: #cccccc">Sign Up</a> </h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <i class="fas fa-users"></i>
    </div>

    <!-- Login Form -->
    <form action="login_Controller" method="post" >
      <input type="text" id="login" class="fadeIn second" name="Gmail" placeholder="Gmail" required>
      <input type="text" id="password" class="fadeIn third" name="Password" placeholder="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Please fill correct Password" required>
      <input type="submit" class="fadeIn fourth" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
     <jsp:include page="footer.jsp"></jsp:include>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
 </script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous">
    
	</body>
	
</html>
