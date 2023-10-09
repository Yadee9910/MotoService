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
                
                var fullName = given_name + " " + family_name;
                
                document.getElementById('username').textContent = username;
                document.getElementById('name').textContent = fullName;
                document.getElementById('given_name').textContent = given_name;
                document.getElementById('family_name').textContent = family_name;
                document.getElementById('email').textContent = email;
                document.getElementById('phone').textContent = phone;
                document.getElementById('address').textContent = country;
                
                
                document.getElementById('submit').addEventListener('click', function () {            
                    document.getElementById('username01').value = username;
                });
                
                
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
               
              