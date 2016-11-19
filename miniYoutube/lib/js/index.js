function checkSession() {
//	alert("sdf11111");
	var signinin = document.getElementById("ticket1");
	var signupup = document.getElementById("ticket2");
//	alert(signupup);
	var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				var msg = xmlhttp.responseText;
				if (msg != 0) {
					signinin.innerHTML="<a href=\"userpage.html\" id=\"signinin\">My profile</a>";
					signupup.innerHTML="<a href=\"#\" id=\"signinin\" onclick=\"signout()\">Sign out</a>";

				}
				else {
					//window.location.href="./play.html";
					return;
				}
			}
		}
		
		xmlhttp.open("POST","./lib/jsp/checkSession.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
}



function signout() {
	var signinin = document.getElementById("ticket1");
	var signupup = document.getElementById("ticket2");
	//alert(signupup);
	var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				var msg = xmlhttp.responseText;
				if (msg == 1) {
					
					signinin.innerHTML="<a href=\"signin.html\">Sign in</a>";
					signupup.innerHTML="<a href=\"signup.html\">Sign up</a>";
				}
				else {
					return;
				}
			}
		}
		
		xmlhttp.open("POST","./lib/jsp/signout.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
}

function signouta() {

	var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				var msg = xmlhttp.responseText;
				if (msg == 1) {
					window.location.href="./index.html";
				}
				else {
					return;
				}
			}
		}
		
		xmlhttp.open("POST","./lib/jsp/signout.jsp",true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
}

var code; 
function createCode(){  
	 code = "";   
	 var codeLength = 4;
	 var checkCode = document.getElementById("code");   
	 var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
	 'S','T','U','V','W','X','Y','Z');
	 for(var i = 0; i < codeLength; i++) {
		var index = Math.floor(Math.random()*36);
		code += random[index];
	}  
	checkCode.value = code;
	var x = document.getElementById("codeNo");
	x.value = code;
}
var code2; 
function createCode2(){  
	 code2 = "";   
	 var codeLength = 4; 
	 var checkCode = document.getElementById("code2");   
	 var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
	 'S','T','U','V','W','X','Y','Z');
	 for(var i = 0; i < codeLength; i++) {
		var index = Math.floor(Math.random()*36); 
		code2 += random[index];
	}  
	checkCode.value = code2;
	var x = document.getElementById("codeNo2");
	x.value = code2;
}
var load = 0;
function loadCode() {
	if (load == 0) {
		var x = document.getElementById("check_pictrue");
		x.style.display = "inline-block";
		createCode();
		load = 1;
	}
}
var load2 = 0;
function loadCode2() {
	if (load2 == 0) {
		var x = document.getElementById("check_pictrue2");
		x.style.display = "inline-block";
		createCode2();
		load2 = 1;
	}
}

function validate(){  
	if (load != 0) {
		var inputCode = document.getElementById("check").value.toUpperCase(); //取得输入的验证码并转化为大写
		var x = document.getElementById("tick_check");
		if (inputCode == code) {
			x.innerHTML = "<img src = \"./images/004_16.png\"/>";
		}
		else {
			x.innerHTML = "<img src = \"./images/001_75.png\"/>";
		}
	}        
}

function validate2(){  
	if (load2 != 0) {
		var inputCode = document.getElementById("check2").value.toUpperCase(); //取得输入的验证码并转化为大写
		var x = document.getElementById("tick_check2");
		if (inputCode == code2) {
			x.innerHTML = "<img src = \"./images/004_16.png\"/>";
		}
		else {
			x.innerHTML = "<img src = \"./images/001_75.png\"/>";
		}
	}        
}

function samepasswd() {
	var passwd1 = document.getElementById("passwd");
	var passwd2 = document.getElementById("passwd2");
	var x = document.getElementById("tick_passwdsame");
	if (passwd1 == "" || passwd2 == "") {}
	else if (passwd1 == passwd2) {
		x.innerHTML = "<img src = \"./images/004_16.png\"/>";
	//	alert("success");
	}
	else{
		x.innerHTML = "<img src = \"./images/001_75.png\"/>";
	//	alert("error");
	}
}


function signin() {
	var u = document.getElementById("user").value;
	var p = document.getElementById("passwd").value;
	var c = document.getElementById("check").value;

//	var x = document.getElementById("tick_user");
//	var y = document.getElementById("tick_passwd");
//	var z = document.getElementById("tick_check");
	
	if (u.length < 1) {
//		x.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	if (p.length < 1) {
//		y.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	if (c.toUpperCase() != code) {
//		z.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}

	if (c.toUpperCase() == code) {
//		z.innerHTML = "<img src = \"./images/004_16.png\"/>";
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				var msg = xmlhttp.responseText;
	//			alert("sdfwwwww");
				if (msg == 0) {
	//				x.innerHTML="<img src = \"./images/001_75.png\"/>";
					return;
				}
				else if (msg == 1) {
	//				y.innerHTML="<img src = \"./images/001_75.png\"/>";
					return;
				}
				else if (msg == 3) {
					window.location.href="./admin.jsp";
					return;
				}
				else if(msg == 2){
					window.location.href="./index.html";
					return;
				}
				else {
					window.location.href="./index.html";
					return;
				}
			}
		}
		
		xmlhttp.open("POST","./lib/jsp/signin.jsp?user="+u+"&passwd="+p,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
}


function userok() {
	var u = document.getElementById("user2").value;
	var x = document.getElementById("tick_user2");
	if (u.length < 4 || u.length > 20) {
		x.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	else if (!(/^[\da-zA-Z]+$/.test(u))) {
		x.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	else {
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				x.innerHTML=xmlhttp.responseText;
			}
		}
		
		xmlhttp.open("POST","./lib/jsp/checkuser.jsp?user="+u,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
}


function signup() {
//	alert("sdfdsfdfsdfs");
	var u = document.getElementById("username").value;

	var e = document.getElementById("email").value;
	
	var p1 = document.getElementById("passwd").value;
	
	var p2 = document.getElementById("passwd2").value;
//	var g = document.getElementsByName("gender");
	var c = document.getElementById("check2").value;
	
//	var x = document.getElementById("tick_user2");
//	var y = document.getElementById("tick_passwdsame");
//	var z = document.getElementById("tick_check2");
	
	alert(c);
	
	if (u.length < 4 || u.length > 20) {
//		x.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	if (p1 != p2 || p1.length < 0 || p2.length < 0) {
//		y = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	if (c.toUpperCase() != code2) {
		alert(c.toUpperCase()+"---"+code2);
//		z = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	if (c.toUpperCase() == code2) {
//		z = "<img src = \"./images/004_16.png\"/>";
		var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				var msg = xmlhttp.responseText;
				if (msg == 0) {
//					x.innerHTML="<img src = \"./images/001_75.png\"/>";
					alert("damn it");
					return;
				}
				else {
					alert("ok");
					//String add = "./index.html?uid=" + u;
					//window.location.href=add;
					window.location.href="./index.html";
					//window.history.back();
					return;
				} 
			}
		}
		
		xmlhttp.open("POST","signup.jsp?user="+u+"&passwd="+p1+"&email="+e,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}	
}

function updatepwd() {

	var ticket = document.getElementById("uploadpwd");

	var opwd = document.getElementById("opwd").value;
	var passwd = document.getElementById("passwd").value;
	var passwd2 = document.getElementById("passwd2").value;

	if(passwd != passwd2) {
		alert("not");
		return;
	}
	var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp=new XMLHttpRequest();
		}
		else {// code for IE6, IE5
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange=function() {
			if (xmlhttp.readyState==4 && xmlhttp.status==200) {
				var msg = xmlhttp.responseText;
				if (msg == 1) {
					//alert(msg);
					ticket.innerHTML="<p>Success</p>";
				}
				else {
					alert(msg);
					return;
				}
			}
		}
		
		xmlhttp.open("POST","./lib/jsp/updatepwd.jsp?opwd="+opwd+"&passwd="+passwd,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
}

