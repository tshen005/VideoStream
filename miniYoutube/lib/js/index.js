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
					signupup.innerHTML="<a href=\"#\" id=\"signinin\" class=\"icon-off\" onclick=\"signout()\"> Sign out</a>";

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

function getQuery(){
	var qstr = document.getElementById("Query").value;
	window.location.href="./search.html?query="+qstr;
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
	var passwd1 = document.getElementById("passwd").value;
	var passwd2 = document.getElementById("passwd2").value;
	var x = document.getElementById("check_ticket");
	if (passwd1 == "" || passwd2 == "") {return;}
	else if (passwd1 == passwd2) {
		x.innerHTML = "<div></div>";
	}
	else{
		x.innerHTML = "<div class=\"alert alert-danger\">Password didn't match</div>";
	}
}


function signin() {
	var u = document.getElementById("user").value;
	var p = document.getElementById("passwd").value;
	var c = document.getElementById("check").value;

	var x = document.getElementById("username_ticket");
	var y = document.getElementById("passwd_ticket");
	var z = document.getElementById("code_ticket");
	var zy = document.getElementById("check_ticket");

	if (u.length < 1) {
		x.innerHTML = "<span class=\"icon-remove\"></span>";
		return;
	}
	if (p.length < 1) {
		y.innerHTML = "<span class=\"icon-remove\"></span>";
		return;
	}
	if (c.toUpperCase() != code) {
		z.innerHTML = "<span class=\"icon-remove\"></span>";
		return;
	}

	if (c.toUpperCase() == code) {
		z.innerHTML = "<span class=\"icon-ok\"></span>";
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
					zy.innerHTML="<div class=\"alert alert-danger\">Incorrect username or password</div>";
					return;
				}
				else if (msg == 1) {
					zy.innerHTML="<div class=\"alert alert-danger\">Incorrect username or password</div>";
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
	var u = document.getElementById("username").value;
	var x = document.getElementById("check_ticket");
	var y = document.getElementById("username_ticket");
	if (u.length < 4 || u.length > 20) {
		x.innerHTML = "<div class=\"alert alert-danger\">Username has to be more than 4 characters and less than 20 characters.</div>";
		return;
	}
	else if (!(/^[\da-zA-Z]+$/.test(u))) {
		x.innerHTML = "<div class=\"alert alert-danger\">Username has to be more than 4 characters and less than 20 characters.</div>";
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
				var msg=xmlhttp.responseText;
				if(msg == 0) {
					x.innerHTML="<div class=\"alert alert-danger\">Username is already taken.</div>";
				}
				else{
					//x.innerHTML="<div></div>";
					y.style.display="inline";
				}
			}
		}

		xmlhttp.open("POST","./lib/jsp/checkuser.jsp?user="+u,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}

}

function emailok() {
	var e = document.getElementById("email").value;
	var x = document.getElementById("check_ticket");
	//var y = document.getElementById("email_ticket");
	
	if (!isEmail(e)) {
		x.innerHTML = "<div class=\"alert alert-danger\">Invaild email address.</div>";
		return;
	}
	if (isEmail(e)) {
		x.innerHTML="<div ></div>";
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
				var msg=xmlhttp.responseText;
				if(msg == 0) {
					x.innerHTML="<div class=\"alert alert-danger\">Email is already registered.</div>";
				}
				else{
					x.innerHTML="<div ></div>";
				}
			}
		}

		xmlhttp.open("POST","./lib/jsp/checkemail.jsp?email="+e,true);
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send();
	}

}

function isEmail(str) {
	var reg = /^(\w)+(\.\w+)*@(\w)+((\.\w+)+)$/;
	return reg.test(str);
}


function signup() {

	var u = document.getElementById("username").value;
	var e = document.getElementById("email").value;
	var p1 = document.getElementById("passwd").value;
	var p2 = document.getElementById("passwd2").value;
	var c = document.getElementById("check2").value;

	var x = document.getElementById("check_ticket");
//	var y1 = document.getElementById("passwd_ticket1");
//	var y2 = document.getElementById("passwd_ticket2");
	var z = document.getElementById("code_ticket");

	if (u.length < 4 || u.length > 20) {
		x.innerHTML = "<div class=\"alert alert-danger\">Username has to be more than 4 characters and less than 20 characters.</div>";
		return;
	}

	if (!isEmail(e)) {
		x.innerHTML = "<div class=\"alert alert-danger\">Invaild email address.</div>";
		return;
	}

	if (p1 != p2 || p1.length < 0 || p2.length < 0) {
		x = "<div class=\"alert alert-danger\">Invaild password</div>";
		return;
	}
	if (c.toUpperCase() != code2) {
		alert(c.toUpperCase()+"---"+code2);
		z.innerHTML = "<span class=\"icon-remove\"></span>";
		return;
	}
	if (c.toUpperCase() == code2) {
		z.innerHTML = "<span class=\"icon-ok\"></span>";
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
					x.innerHTML="<div class=\"alert alert-danger\">Username is already taken.</div>";
					return;
				}
				else {
					x.innerHTML="<div class=\"alert alert-success\">Success.</div>";
					window.location.href="./index.html";
					return;
				}
			}
		}

		xmlhttp.open("POST","./lib/jsp/signup.jsp?user="+u+"&passwd="+p1+"&email="+e,true);
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
