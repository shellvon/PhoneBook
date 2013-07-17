<%@ page import="tool.UserDB"%>
<%@ page import="tool.User"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

	if(session.getAttribute("user") != null)
		response.sendRedirect("/PhoneBook/main.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PhoneBook-Login</title>
<script type="text/javascript" src="zepto.js"></script>
<script language="javascript">
	function showTime(){     
        var thetime=new Date();   //   åå§åæ¥æå¯¹è±¡ 
            document.getElementById( "timeArea").innerText   = thetime.toLocaleString(); 
            window.setTimeout( "showTime()",1000);   //setTimeout (è¡¨è¾¾å¼,å»¶æ¶æ¶é´)å¶ä¸­å»¶æ¶æ¶é´ä»¥è±ªç§ä¸ºåä½(1000ms=1s)
        } 
</script>
</head>
<body onload="showTime()">
	<center>
		<table bgcolor="white" cellpadding="12" border="0" bordercolor="gray">
			<tr>
				<td colspan="12">
					<center>
						<h1>
							<i><b>PhoneBook</b></i>
						</h1>
					</center>
				</td>
			</tr>
			<tr>
				<td><h1>
						<i><b>UserID:</b></i>
					</h1></td>
				<td><form name="login">
						<input class="input_box" name="user" type="text"></input></td>
			</tr>
			<tr>
				<td><h1>
						<i><b>Password:</b></i>
					</h1></td>
				<td><input class="input_box" name="password" type="password"></input></form></td>
			</tr>
			<tr>
				<td><center>
						<input id="login" type="button" value="login" ></input>
					</center></td>
				<td><center>
						<input id="clear" type="button" value="reset" ></input>
					</center></td>
			</tr>
		</table>

		<td> <center><font color="black" style='font-size:15pt;font-family: Courier New'><br><br><br><br>
		Writen By Shell-von</font>
			</center>
		</td>
		<font color="black" style='font-size:17pt;font-family: Courier New'><div id="timeArea" align="center"></div></font>
	</center>
<script type="text/javascript" src="main.js"></script>
</body>
</html>