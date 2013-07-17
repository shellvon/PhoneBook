<%@ page import="tool.UserDB"%>
<%@ page import="tool.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%

	if(session.getAttribute("user") == null)
		response.sendRedirect("/PhoneBook/login.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>PhoneBook</title>
<script type="text/javascript" src="zepto.js"></script>
<script type="text/javascript" src="fuck.js"></script>
</head>
<body>
	<div>
		<center>
			<h1>
				<b><i>PhoneBook Information</i></b>
			</h1>
		</center>
	</div>
	<div>
		<center>
			<table id="tb_user" cellpadding="0" cellspacing="0" border="1"
				width="80%">
				<tr align="center" height="30">
					<%
						String[] title = { "姓名", "昵称", "年龄", "性别", "电话号码", "指令" };
						for (int i = 0; i < title.length; i++) {
					%>
					<td><%=title[i]%></td>

					<%
						}
					%>
				</tr>

				<%
					User[] user = UserDB.getUser();
					if (user == null) {//空表不处理
				%>

				<%
					} else {
						int rows = user.length; // 多少行
						for (int j = 0; j < rows; j++) {
							String name = user[j].getUserName();
				%>
				<tr align="center" height="30" id="tr<%=name%>">
					<td id="<%=name%>name"><%=name%></td>
					<td id="<%=name%>nick"><%=user[j].getNiceName()%></td>
					<td id="<%=name%>age"><%=user[j].getAge()%></td>
					<td id="<%=name%>sex"><%=user[j].getSex()%></td>
					<td id="<%=name%>phone"><%=user[j].getUserPhone()%></td>
					<td><a class="delete" user_id="<%=name%>" href="#"><span
							class='red'>[delete/</span></a><a class="modify" user_id="<%=name%>"
						href="#"><span class='red'>modify]</span></a></td>
				</tr>
				<%
					}
					}
				%>
			</table>
		</center>
	</div>
	<div id="div1">
		<center>
			<h2>添加联系人</h2>

			<table border=0 cellpadding=0 cellspacing=0>
				<tr>
					<td>姓名:</td>
					<td><input id="name" type=text size=20 name=name></td>
				</tr>
				<tr>
					<td>昵称:</td>
					<td><input id="nick" type=text size=20 name=nickname></td>
				</tr>
				<tr>
					<td>电话号码:</td>
					<td><input id="phone" type=text size=20 name=phone></td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td><input id="age" type=text size=20 name=age></td>
				</tr>
				<tr>
					<td>性别:</td>
					<td><input id="sex" type="radio" name="sex" value="男">男&nbsp;&nbsp;
						<input id="sex2" type="radio" name="sex" value="女">女</td>
				<tr>
					<td></td>
					<td><input id="add_user" type=submit border=0 value="AddUser">
						<input id="mod_user" type=submit border=0 value="Modify"></td>

				</tr>
			</table>
		</center>
	</div>
</body>
</html>