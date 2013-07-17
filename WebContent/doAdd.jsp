<%@ page import="tool.UserDB"%>
<%@ page import="tool.User"%>
<%@ page language="java" contentType="application/json; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	if(session.getAttribute("user") == null)
		response.sendRedirect("/PhoneBook/login.jsp");
	String name = request.getParameter("name");
	String nice = request.getParameter("nick");
	String age= request.getParameter("age");
	String phone= request.getParameter("phone");
	String sex= request.getParameter("sex");
	User us=new User();
	us.setUserName(name);
	us.setNiceName(nice);
	us.setAge(Integer.parseInt(age));
	us.setUserPhone(phone);
	us.setSex(sex);
	boolean status=UserDB.addUser(us);
%>
{
	"status":<%=status%>,
}