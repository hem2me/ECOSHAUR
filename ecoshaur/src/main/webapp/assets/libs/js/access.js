function signUp(f) {
    
	var pw = f.pw.value;
    if(pw.length == 0){
        alert("비밀번호를 입력해 주세요"); 
        f.pw.focus();
        return false;
    }
    
    if(pw.length<4){
		alert("비밀번호 4글자이상 입력해 주세요");
		f.passwd.focus();
		return false;
	}//if end
 
    var pw2 = f.pw2.value;
    if(pw != pw2){
        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
        f.pw2.focus();
        return false; 
    }
 
    var mem_name = f.mem_name.value;
    if(mem_name.length == 0){
        alert("이름을 입력해주세요");
        f.mem_name.focus();
        return false;
    }
    
    var email = f.email.value;
    if(email.length == 0){
        alert("이메일을 입력해주세요");
        f.email.focus();
        return false;
    }
    
    var contact_number = f.contact_number.value;
    if(contact_number.length == 0){
        alert("연락처를 입력해주세요");
        f.contact_number.focus();
        return false;
    }
    
    var address_r = f.address_r.value;
    if(address_r.length == 0){
        alert("나머지주소를 입력해주세요");
        f.address_r.focus();
        return false;
    }

    
   
}//signUp() end


function rentalCheck(f){
	
	var title = f.title.value;
	title = title.trim();
	if(title.length==0){
		alert("제목을 입력해주세요");
		f.title.focus();
		return false;
	}// if end
	
	var sub_title = f.sub_title.value;
	sub_title = sub_title.trim();
	if(sub_title.length==0){
		alert("소제목을 입력해주세요");
		f.sub_title.focus();
		return false;
	}// if end
	
	var product_name = f.product_name.value;
	product_name = product_name.trim();
	if(product_name.length==0){
		alert("상품명을 입력해주세요");
		f.product_name.focus();
		return false;
	}// if end
	
	var description = f.description.value;
	description = description.trim();
	if(description.length==0){
		alert("내용을 입력해 주세요");
		f.description.focus();
		return false;
	}// if end
	if(description.length<2){
		alert("내용을 2글자이상 입력해 주세요");
		f.description.focus();
		return false;
	}//if end
	
	var price_daily = f.price_daily.value;
	price_daily = price_daily.trim();
	if(price_daily.length==0){
		alert("일일가격을 입력해주세요");
		f.price_daily.focus();
		return false;
	}// if end
	
	var deposit = f.deposit.value;
	deposit = deposit.trim();
	if(deposit.length==0){
		alert("보증금을 입력해주세요");
		f.deposit.focus();
		return false;
	}// if end
	
	var total_quantity = f.total_quantity.value;
	total_quantity = total_quantity.trim();
	if(total_quantity.length==0){
		alert("수량을 1개이상 입력해주세요");
		f.total_quantity.focus();
		return false;
	}// if end

}//rentalCheck() end


function boardCheck(f){
	
	var title=f.title.value;
	if(title.length<5){
		alert("제목을 5글자 이상 입력해주세요");
		f.title.focus();
		return false;
	}// if end
	
}//boardCheck() end

function qnaCheck(f){
	
	var title=f.title.value;
	if(title.length<5){
		alert("제목을 5글자 이상 입력해주세요");
		f.title.focus();
		return false;
	}// if end
	
}

