var phoneError=document.getElementById('phone-error');
var emailError=document.getElementById('email-error');
var epassError=document.getElementById('epass-error');
var cpassError=document.getElementById('cpass-error');
function mnovalidation(){
	var phone=document.getElementById('mno').value;
	
	if(isNaN(phone)){
		phoneError.innerHTML='only Numeric';
		return false;
	}
	if(phone.length<10){
		phoneError.innerHTML='must be 10digits';
		return false;
	}
	if(phone.length>10){
		phoneError.innerHTML='must be 10digits';
		return false;
	}
	if(phone.charAt(0)!=9 && phone.charAt(0)!=8 && phone.charAt(0)!=7){
		phoneError.innerHTML='must start with 9 or 8 or 7';
		return false;
	}
	
	phoneError.innerHTML='<i class="fa-solid fa-circle-check"></i>';
		return true;
}

function passwordvalidation(){
	var epass=document.getElementById('epassword').value;
	var cpass=document.getElementById('cpassword').value;
	
	if(epass.length<6){
		epassError.innerHTML='Password range must be 6-20';
		cpassError.innerHTML='';
		return false;
	}
	if(epass.length>20){
		epassError.innerHTML='Password range must be 6-20';
		cpassError.innerHTML='';
		return false;
	}
	
	if(epass!=cpass){
		epassError.innerHTML='';
		cpassError.innerHTML='Passwords dont Match';
		return false;
	}
	cpassError.innerHTML='<i class="fa-solid fa-circle-check"></i>';
	return true;
}

function validation(){
		var userid=document.getElementById('userID').value;
		var epassword=document.getElementById('epassword').value;
		var cpassword=document.getElementById('cpassword').value;
		var firstname=document.getElementById('firstname').value;
		var lastname=document.getElementById('lastname').value;
		var dob=document.getElementById('dob').value;
		var gender=document.getElementById('gender').value;
		var presentadd=document.getElementById('preadd').value;
		var permanentadd=document.getElementById('peradd').value;
		var mobileno=document.getElementById('mno').value;
		var email=document.getElementById('email').value;
		
		if(epassword.length==0 || cpassword.length==0 || firstname.length==0 || lastname.length==0 || dob.length==0 || gender.length==0 || presentadd.length==0 || permanentadd.length==0 || mobileno.length==0 || email.length==0){
		}
		else{
			Swal.fire({
  			position: 'top-end',
  			icon: 'success',
  			title: 'Registration Done Successfully',
  			showConfirmButton: false,
  			timer: 1500
			})
		}
}