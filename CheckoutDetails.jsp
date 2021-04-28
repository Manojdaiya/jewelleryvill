<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>

<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
	String merchant_key="o5pkBfKg";
	String salt="tB02nlwouA";
	String action1 ="";
	String base_url="https://sandboxsecure.payu.in";
	int error=0;
	String hashString="";
	
 

	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
        String udf2 = txnid;
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<Title>Checkout Details</Title>  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
       <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">   
</head>
<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	if (hash == '')
		return;
      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>
<body onload="submitPayuForm();">	
	<!-- Card -->
<div class="">
  <div class="pt-4 pb-3">

  <!-- Grid row -->
  <div class="row">

    <!-- Grid column -->
   <form action="<%= action1 %>" method="post" name="payuForm">
<input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      <input type="hidden" name="udf2" value="<%= txnid %>" />
     <input type="hidden" name="service_provider" value="payu_paisa" />
    <div class="col-lg-6 mb-5 mb-lg-0">
   
    <input type="hidden" name="surl" value="<%= (empty(params.get("surl"))) ? "" : params.get("surl") %>" size="64" />
    <input type="hidden" name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount") %>" />
    <input type="hidden" name="furl" value="<%= (empty(params.get("furl"))) ? "" : params.get("furl") %>" size="64" />
    <input type="hidden" name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "" : params.get("productinfo") %>" size="64" />
        
      <h5 class="mb-4 pb-1 m-2">Billing details</h5>
      <!-- Grid row -->
      <div class="row">
        <!-- Grid column -->
        <div class="col-lg-12">

          <!-- First name -->
          <div class="md-form md-outline mt-0 m-2">
			<label for="form11">Your Name:</label>
            <input type="text" class="form-control" name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" required />
         
          </div>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
      
        <!-- Grid column -->

      </div>
      <!-- Grid row -->
      <!-- Address Part 1 -->
      <div class="md-form md-outline mt-0  m-2">
		<label for="form14">Address:</label>
        <input type="text" name="address1" class="form-control" value="<%= (empty(params.get("address1"))) ? "" : params.get("address1") %>" required />
       
      </div>

    

      <!-- Postcode / ZIP -->
      <div class="md-form md-outline mt-0  m-2">
		    <label for="form16">Postcode / ZIP:</label>
        <input type="text" class="form-control" name="zipcode" value="<%= (empty(params.get("zipcode"))) ? "" : params.get("zipcode") %>" required/>
      
      </div>

     
      <div class="md-form md-outline mt-0  m-2">
		   <label for="form17">Town / City:</label>
        <input type="text" class="form-control" name="city" value="<%= (empty(params.get("city"))) ? "" : params.get("city") %>" required />
       
      </div>

      <!-- Phone -->
      <div class="md-form md-outline mt-0  m-2">
		<label for="form18">Phone:</label>
        <input type="tel" class="form-control" name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" pattern="^\d{10}$" title="Number should be 10 digit" required  />
       
      </div>

      <!-- Email address -->
      <div class="md-form md-outline mt-0  m-2">
		 <label for="form19">Email address:</label>
        <input type="email" class="form-control" name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" required/>
      
      </div>

      <div class="form-check pl-0 mb-4 mb-lg-0">
       <Button class="btn btn-primary">Process</Button>
      </div>

    </div>
        </form>
    <!-- Grid column -->

    <!-- Grid column -->
  
    </div>
    <!-- Grid column -->

  </div>
  <!-- Grid row -->

  </div>
</div>
<!-- Card -->
</body>
