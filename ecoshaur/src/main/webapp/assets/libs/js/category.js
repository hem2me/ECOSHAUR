	function searchCheck(f){		// 로그인 유효성 검사
		var check = false;
		var i = 0;
		for( i = 0; i < document.getElementsByName("test_check").length; ++i )
	    {
	       if ( document.getElementsByName("test_check")[i].checked == true )
	       { 
	           check = true;
	           break;
	        }
	     }
		
	     if( check == false )
	     { 
	         alert( "카테고리를 선택해주세요");
	 	    return false;	
	      } 
		    return true;	
	}
	