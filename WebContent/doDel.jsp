<%@ page import="tool.UserDB"%>
<%@ page import="tool.User"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	if(session.getAttribute("user") == null)
		response.sendRedirect("/PhoneBook/login.jsp");
	String user_id=request.getParameter("user_id");
	boolean status= UserDB.delUser(user_id);
%>
{
	"status":<%=status%>,
}