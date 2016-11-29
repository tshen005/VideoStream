<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
	String a = session.getId();
	//out.println(a);
	session.removeAttribute("username");
	session.invalidate();
	//String b = session.getId();
	out.println("1");

%>