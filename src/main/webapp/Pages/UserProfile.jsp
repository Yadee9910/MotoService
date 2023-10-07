<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet"  href ="../Styles/user.css">
    <title>MotoService_UserProfile</title>
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   
    
        <script type="text/javascript">
 
 
        const introspectionEndpointUrl = 'https://api.asgardeo.io/t/motoservice/oauth2/introspect ';
        const accessToken = localStorage.getItem('access_token');
        const idToken = localStorage.getItem('id_token');
        
        if(accessToken && idToken){
        	
        var settings = {
            "url": "https://api.asgardeo.io/t/motoservice/oauth2/userinfo",
            "method": "GET",
            "timeout": 0,
            "headers": {
                "Authorization": "Bearer " + accessToken
            },
        };

        $.ajax(settings)
            .done(function (response) {
                console.log(response);
                var username =  response.username;
                var given_name = response.given_name;
                var family_name = response.family_name;
                var phone = response.phone_number;
                var email = response.email;               
                var country = response.address.country;
                var name = response.name;
                
                document.getElementById('username').textContent = username;
                document.getElementById('name').textContent = name;
                document.getElementById('given_name').textContent = given_name;
                document.getElementById('family_name').textContent = family_name;
                document.getElementById('email').textContent = email;
                document.getElementById('phone').textContent = phone;
                document.getElementById('address').textContent = country;
                
           
                
            })
            .fail(function (jqXHR, textStatus, errorThrown) {
                // Handle any errors here
                console.error('Error:', errorThrown);
                alert("There is an Error in Authorization Login again!");
                cnsole.log(errorThrown)
                window.location.href = "Login.jsp";
            });
        }
        else{
        	window.location.href = "Login.jsp";	
        }
    </script>
    
</head>
<body>
    <%@ include file="Navbar.jsp" %>

    <div class="profile_img">
        <i class="fas fa-user-circle"></i>
    </div>

 
  <ul>
  <li>First Name : <span id = 'given_name'></span></li>
  <li>Last Name : <span id = 'family_name'></span></li>
  <li>User Name : <span id = 'username'></span></li>
  <li>Contact: <span id = 'phone'></span></li>
   <li>Email: <span id = 'email'></span></li>
   <li>Country : <span id = 'address'></span></li>
  <li>Full Name: <span id = 'name'></span></li>
  
  </ul>
    
</body>
</html>
