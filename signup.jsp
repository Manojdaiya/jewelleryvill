<%-- 
    Document   : signup
    Created on : 11 Jan, 2021, 1:30:30 PM
    Author     : Manoj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
             <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>sign up</title>
		<link href="loginstyle.css" rel=stylesheet>
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://kit.fontawesome.com/6bddb47dad.js" crossorigin="anonymous"></script>
		
	</head>
	<body>
               <jsp:include page="header.jsp"></jsp:include>
            <main>
		<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="inactive underlineHover"><a href="login.jsp" style="text-decoration: none;color: #cccccc"> Sign In </a> </h2>
    <h2  class="active">Sign Up </h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <i class="fas fa-users"></i>
    </div>

    <!-- Login Form -->
    <form  method="post" action="SignUp_controller">
      <input type="text" id="name" class="fadeIn third" name="Name" placeholder="Your Name" required>
      <input type="email" id="emailid" class="fadeIn second" name="Gmail" placeholder="Enter Gmail" required>
      <input type="tel" id="pnumber" name="Phone_no" placeholder="Phone Number" pattern="^\d{10}$" title="Number should be 10 digit" required Style="background-color: #f6f6f6;border: none;color: #0d0d0d;padding: 15px 32px;text-align: center;text-decoration: none;display: inline-block;font-size: 16px;margin: 5px;width: 85%;border: 2px solid #f6f6f6;">
      <input type="password" id="password" class="fadeIn third" name="Password" placeholder="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="One Capital letter,Specific charactor,length greater or equal to 8" required>
      <input type="password" id="cpassword" class="fadeIn third" name="cpassword" placeholder="confirm password" required>
      <input type="submit" class="fadeIn fourth" value="Sign up">
    </form>
    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="forgetpassword.jsp">Forgot Password?</a>
    </div>
  </div>
</div>
                </main>  
      <jsp:include page="footer.jsp"></jsp:include>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous">
 </script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous">
</body>
</html>
