<%-- 
    Document   : AdminPenel
    Created on : 17 Mar, 2021, 1:12:51 PM
    Author     : Manoj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<style>
* {box-sizing: border-box;}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}

.topnav a {
  float: left;
  display: block;
  color: black;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #2196F3;
  color: white;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin-top: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}
</style>
</head>
<body>
<h1>Admin penel</h1>
<div class="topnav">
  <a class="active" href="AdminPenel.jsp">Upload product</a>
  <div class="ml-2">
    <form action="productdetails.jsp">
      <input type="text" placeholder="Product Id" name="id">
      <button type="submit"><i class="fa fa-search"></i></button>
    </form>
  </div>
</div>
	<!--form upload-->
	<form class=m-2 method="post" action="Storedata" enctype="multipart/form-data">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label>Product Name</label>
      <input type="text" class="form-control" name="product_name">
    </div>
    <div class="form-group col-md-6">
      <label>Desciption</label>
      <input type="text" class="form-control" name="description">
    </div>
  </div>
  <div class="form-group m-2">
	   <label >Category:</label><br>
   <input type="radio" align="center" name="category" value="Necklace" required>Necklace<br>
      <input  type="radio" align="center" name="category" value="Earring" > Earring <br>
        <input  type="radio" align="center" name="category" value="Anklet"> Anklet <br>
         <input  type="radio" align="center" name="category" value="Bracelet">Bracelet<br>
         <input type="radio" align="center" name="category" value="Ring">Ring<br>
        <input  type="radio" align="center" name="category" value="NoseRing">NoseRing<br>
        <input    type="radio" align="center" name="category" value="Bridle Collections"> Bridle Collections<br><br>
  </div>
  <div class="form-group col-md-6">
      <label>Actual price:</label>
      <input type="text" class="form-control" name="actual_price">
		</div>
  <div class="form-group col-md-6">
    <label>Offer Price:</label>
    <input type="text" class="form-control" name="offer_price">
  </div>
 
 <div class="form-group col-md-6">
     <label>  first Photo:</label>
      <input type="file" class="form-control" name="first_photo" required>
</div>
 <div class="form-group col-md-6">
     <label>  Second Photo:</label>
      <input type="file" class="form-control"  name="second_photo">
</div>
 <div class="form-group col-md-6">
     <label>  Third Photo:</label>
      <input type="file" class="form-control" name="third_photo">
</div>
<button type="submit" class="btn btn-primary m-2">Add</button>
</form>
	
		
</body>
</html>

