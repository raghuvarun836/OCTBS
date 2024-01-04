var phoneError=document.getElementById('phone-error');

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
	
	phoneError.innerHTML='<i style="color: green;position:absolute;margin-right: 25px;float: right;font-size: 14px;" class="fa-solid fa-circle-check"></i>';
		return true;
}