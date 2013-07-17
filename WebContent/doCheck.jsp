<%@ page import="tool.UserDB"%>
<%@ page import="tool.User"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String user=request.getParameter("user");
	String  pass=request.getParameter("password");
	boolean status= UserDB.CheckAccount(user, pass);
	if(status){
		session.setAttribute("user",user);
	}
%>
{
	"status":<%=status%>,
}