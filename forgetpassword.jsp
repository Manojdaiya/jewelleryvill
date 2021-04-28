<%-- 
    Document   : forgetpassword
    Created on : 7 Mar, 2021, 3:14:14 PM
    Author     : Manoj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="sendmail" method="post">
        <h1>enter your Gmail</h1>
        <input type="email" name="toGmail">
        <button> send</button>
        </form>
    </body>
</html>
