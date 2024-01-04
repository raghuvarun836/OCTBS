function validate(){
    var email = document.getElementById('email');
    var password = document.getElementById('password');
    
    if(email.value=="" || password.value==""){
		alert("No Blank  values Allowed");
		return false;
	}
	else
	{
		true;
	}

}