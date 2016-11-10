var code ; //在全局定义验证码   
//产生验证码  
function createCode(){  
	 code = "";   
	 var codeLength = 4;//验证码的长度  
	 var checkCode = document.getElementById("code");   
	 var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
	 'S','T','U','V','W','X','Y','Z');//随机数  
	 for(var i = 0; i < codeLength; i++) {//循环操作  
		var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）  
		code += random[index];//根据索引取得随机数加到code上  
	}  
	checkCode.value = code;//把code值赋给验证码
	var x = document.getElementById("codeNo");
	x.value = code;
}
var code2 ; //在全局定义验证码   
//产生验证码  
function createCode2(){  
	 code2 = "";   
	 var codeLength = 4;//验证码的长度  
	 var checkCode = document.getElementById("code2");   
	 var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
	 'S','T','U','V','W','X','Y','Z');//随机数  
	 for(var i = 0; i < codeLength; i++) {//循环操作  
		var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）  
		code2 += random[index];//根据索引取得随机数加到code上  
	}  
	checkCode.value = code2;//把code值赋给验证码
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
//校验验证码  
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
//校验验证码  
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
//两次密码是否相同
function samepasswd() {
	var passwd1 = document.getElementById("passwd").value;
	var passwd2 = document.getElementById("passwd2").value;
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

//登录
function signin() {
	var u = document.getElementById("user").value;
	var p = document.getElementById("passwd").value;
	var c = document.getElementById("check").value;
	
	var x = document.getElementById("tick_user");
	var y = document.getElementById("tick_passwd");
	var z = document.getElementById("tick_check");
	
	if (u.length < 1) {
		x.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	if (p.length < 1) {
		y.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	if (c.toUpperCase() != code) {
		z.innerHTML = "<img src = \"./images/001_75.png\"/>";
		return;
	}
	if (c.toUpperCase() == code) {
		z.innerHTML = "<img src = \"./images/004_16.png\"/>";
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
					x.innerHTML="<img src = \"./images/001_75.png\"/>";
					return;
				}
				else if (msg == 1) {
					y.innerHTML="<img src = \"./images/001_75.png\"/>";
					return;
				}
				else if (msg == 3) {
					window.location.href="./admin.jsp";
					return;
				}
				else {
					window.location.href="./main.jsp";
					return;
				}
			}
		}
		
		xmlhttp.open("POST","login.jsp?user="+u+"&passwd="+p,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
}

//判断用户名
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
		
		xmlhttp.open("POST","checkuser.jsp?user="+u,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}
	
}

//注册
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
					window.location.href="./index.html";
					return;
				} 
			}
		}
		
		xmlhttp.open("POST","signup.jsp?user="+u+"&passwd="+p1+"&email="+e,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}
}