<%-- 
    Document   : AddProduct
    Created on : 13 Jan, 2021, 3:22:00 PM
    Author     : Manoj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add product</title>
        <style>
            .un {
    width: 50%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    form.form1 {
        padding-top: 40px;
    }
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #E83D3D, #DA9595);
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 8%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    .main {
        background-color:#EBBCB2 ;
        width: 100%;
        height:100%;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.20);
        margin-left: 20px;
        margin-top: 10px;
        margin-bottom: 10px;
      
    }
        </style>
    </head>
    <body>
        <header>
            <h1 align="center"> Add Product Panel</h1>
        </header>
         <div class="main">
        <form class="form1" method="post" action="Storedata" enctype="multipart/form-data">
        Enter Product name:<br>
      <input class="un " type="text" align="center" placeholder="Product Name" name="product_name"><br>
       Add Description:<br>
      <input class="un " type="text" align="center" placeholder="Description" name="description"><br>
       Category:<br>
        <input type="radio" align="center" name="category" value="Necklace" required>Necklace<br>
      <input  type="radio" align="center" name="category" value="Earring" > Earring <br>
        <input  type="radio" align="center" name="category" value="Anklet"> Anklet <br>
         <input  type="radio" align="center" name="category" value="Bracelet">Bracelet<br>
         <input type="radio" align="center" name="category" value="Ring">Ring<br>
        <input  type="radio" align="center" name="category" value="NoseRing">NoseRing<br>
        <input    type="radio" align="center" name="category" value="Bridle Collections"> Bridle Collections<br><br>
        
  
         Offer Price:
      <input class="un " type="number" align="center" placeholder="offer Price" name="offer_price"><br>
      
          Actual Price:
      <input class="un " type="number" align="center" placeholder="Actual Price" name="actual_price"><br>
      
       first Photo:
       <input type="file" align="center"  name="first_photo" required><br>
        
        second Photo:
        <input type="file" align="center"  name="second_photo"><br>
        
         three Photo:
        <input type="file" align="center"  name="third_photo"><br>
        
         four Photo:
         <input type="file" align="center"  name="four_photo"><br><br>
      
         <input type="submit" value="ADD" class="submit">
    </form>  
         </div>
    </body>
</html>
